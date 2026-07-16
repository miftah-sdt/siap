#!/usr/bin/env python3
"""Integrasi DoveRunner/AppSealing SDK ke Runner.xcodeproj secara non-interaktif.

Dipakai di CI (atau lokal) HANYA saat folder ios/AppSealingSDK tersedia.
Meniru langkah AppSealingSDK/Tools/FrameworkIntegrator.py tetapi:
  - memilih target "Runner" otomatis (tanpa prompt),
  - mengaktifkan bridging header,
  - idempoten (aman dijalankan berulang).

Jalankan dengan CWD = folder ios/:
    python3 scripts/integrate_appsealing.py

Tidak untuk di-commit hasilnya: modifikasi project.pbxproj hanya diperlukan
saat build sealed. Untuk membatalkan: `git checkout ios/Runner.xcodeproj/project.pbxproj`.
"""
from __future__ import annotations

import json
import os
import sys

IOS_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SDK_DIR = os.path.join(IOS_DIR, "AppSealingSDK")
TOOLS_DIR = os.path.join(SDK_DIR, "Tools")
INTEGRATE_DIR = os.path.join(TOOLS_DIR, "integrate_script")
VENDOR_DIR = os.path.join(INTEGRATE_DIR, "vendor")
CONFIG_PATH = os.path.join(INTEGRATE_DIR, "path.config")
PBXPROJ_PATH = os.path.join(IOS_DIR, "Runner.xcodeproj", "project.pbxproj")
TARGET_NAME = "Runner"

SEALING_SCRIPT = (
    'if [ "${CONFIGURATION}" == "Debug" ]; then\n'
    '    rm -R "${TARGET_BUILD_DIR}/AppSealingFramework.framework"\n'
    '    if [[ "${SDKROOT}" == *"Simulator"* ]]; then\n'
    '        cp -R "${SRCROOT}/AppSealingSDK/Libraries/Debug/AppSealingFramework.xcframework/ios-arm64_x86_64-simulator/AppSealingFramework.framework" "${TARGET_BUILD_DIR}/"\n'
    "    else\n"
    '        cp -R "${SRCROOT}/AppSealingSDK/Libraries/Debug/AppSealingFramework.xcframework/ios-arm64/AppSealingFramework.framework" "${TARGET_BUILD_DIR}/"\n'
    "    fi\n"
    "fi"
)


def fail(msg: str) -> "None":
    print(f"[appsealing] ERROR: {msg}", file=sys.stderr)
    sys.exit(1)


def main() -> None:
    if not os.path.isdir(SDK_DIR):
        print("[appsealing] SDK tidak ditemukan di ios/AppSealingSDK — lewati integrasi.")
        return

    for path in (VENDOR_DIR, INTEGRATE_DIR):
        if path not in sys.path:
            sys.path.insert(0, path)

    try:
        from pbxproj import XcodeProject
        from pbxproj.pbxextensions import FileOptions
        from pbxproj.pbxextensions.ProjectFiles import ProjectFiles
    except Exception as exc:  # noqa: BLE001
        fail(f"gagal import pbxproj dari SDK vendor: {exc}")

    # Patch: lib pbxproj bawaan SDK menganggap semua PBXBuildFile punya `fileRef`.
    # Project Flutter dengan Swift Package Manager punya build file `productRef`
    # (tanpa fileRef) sehingga crash. Versi toleran ini melewati build file tsb.
    def _safe_filter_targets_without_path(self, path, target_name):
        potential_targets = self.objects.get_targets(target_name)
        for target in potential_targets.copy():
            for build_phase_id in target.buildPhases:
                build_phase = self.get_object(build_phase_id)
                for build_file_id in getattr(build_phase, "files", []):
                    build_file = self.get_object(build_file_id)
                    if build_file is None:
                        continue
                    file_ref_id = getattr(build_file, "fileRef", None)
                    if file_ref_id is None:
                        continue
                    file_ref = self.get_object(file_ref_id)
                    if file_ref is None:
                        continue
                    if (
                        "path" in file_ref
                        and ProjectFiles._path_leaf(path)
                        == ProjectFiles._path_leaf(file_ref.path)
                        and target in potential_targets
                    ):
                        potential_targets.remove(target)
        return [target.name for target in potential_targets]

    ProjectFiles._filter_targets_without_path = _safe_filter_targets_without_path

    with open(CONFIG_PATH, "r", encoding="utf-8") as handle:
        paths = json.load(handle)

    if not os.path.isfile(PBXPROJ_PATH):
        fail(f"project.pbxproj tidak ditemukan: {PBXPROJ_PATH}")

    project = XcodeProject.load(PBXPROJ_PATH)

    targets = [
        t
        for t in project.objects.get_objects_in_section("PBXNativeTarget")
        if t.get("name", "").strip('"') == TARGET_NAME
    ]
    if not targets:
        fail(f"target '{TARGET_NAME}' tidak ditemukan di project.")
    target = targets[0]

    frameworks_group = project.get_or_create_group("Frameworks")
    project.add_file(
        paths["framework_release"],
        parent=frameworks_group,
        force=False,
        file_options=FileOptions(
            create_build_files=True,
            weak=True,
            embed_framework=True,
            code_sign_on_copy=True,
        ),
        target_name=TARGET_NAME,
    )
    print("[appsealing] framework Release ditambahkan (embed + sign).")

    project.add_file(
        paths["lea_section"],
        force=False,
        file_options=FileOptions(create_build_files=True, weak=True),
        target_name=TARGET_NAME,
    )
    print("[appsealing] LEASection.mm ditambahkan.")

    found = False
    for phase_id in target.get("buildPhases", []):
        phase = project.objects[phase_id]
        if (
            phase.get("isa", "") == "PBXShellScriptBuildPhase"
            and phase.get("name", "").strip('"') == "AppSealing"
        ):
            phase["shellScript"] = SEALING_SCRIPT
            found = True
            print("[appsealing] run-script 'AppSealing' diperbarui.")
            break
    if not found:
        project.add_run_script(
            script=SEALING_SCRIPT,
            target_name=TARGET_NAME,
            insert_before_compile=True,
        )
        for phase in project.objects.get_objects_in_section("PBXShellScriptBuildPhase"):
            if SEALING_SCRIPT in phase.get("shellScript", ""):
                phase["name"] = "AppSealing"
        print("[appsealing] run-script 'AppSealing' ditambahkan.")

    project.set_flags("ENABLE_USER_SCRIPT_SANDBOXING", "NO", target_name=TARGET_NAME)
    project.set_flags("COMBINE_C_AND_OBJC", "YES", target_name=TARGET_NAME)
    project.set_flags(
        "SWIFT_OBJC_BRIDGING_HEADER", paths["bridging_header"], target_name=TARGET_NAME
    )
    print("[appsealing] build flags + bridging header di-set.")

    project.save()
    print("[appsealing] project.pbxproj tersimpan. Integrasi selesai.")


if __name__ == "__main__":
    main()
