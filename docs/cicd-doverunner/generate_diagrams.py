#!/usr/bin/env python3
"""Generate CI/CD architecture diagrams for SIAP DoveRunner docx."""

from pathlib import Path

import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.patches import FancyBboxPatch, FancyArrowPatch

OUT_DIR = Path(__file__).resolve().parent / "images"
OUT_DIR.mkdir(parents=True, exist_ok=True)

BG = "#FAFBFC"
BOX = "#E8F0FE"
BOX2 = "#E6F4EA"
BOX3 = "#FEF7E0"
BOX4 = "#FCE8E6"
ACCENT = "#1A365D"
TEXT = "#202124"


def add_box(ax, x, y, w, h, text, color=BOX, fontsize=9):
    box = FancyBboxPatch(
        (x, y), w, h,
        boxstyle="round,pad=0.02,rounding_size=0.08",
        facecolor=color, edgecolor=ACCENT, linewidth=1.2,
    )
    ax.add_patch(box)
    ax.text(x + w / 2, y + h / 2, text, ha="center", va="center",
            fontsize=fontsize, color=TEXT, wrap=True)


def arrow(ax, x1, y1, x2, y2):
    ax.add_patch(FancyArrowPatch(
        (x1, y1), (x2, y2),
        arrowstyle="-|>", mutation_scale=12,
        color=ACCENT, linewidth=1.5,
    ))


def save(fig, name):
    path = OUT_DIR / name
    fig.savefig(path, dpi=150, bbox_inches="tight", facecolor=BG)
    plt.close(fig)
    print(f"Created: {path}")


def diagram_overview():
    fig, ax = plt.subplots(figsize=(12, 7))
    ax.set_xlim(0, 12)
    ax.set_ylim(0, 7)
    ax.axis("off")
    fig.patch.set_facecolor(BG)
    ax.set_facecolor(BG)

    ax.text(6, 6.6, "Arsitektur CI/CD SIAP + DoveRunner (Multi-Platform)",
            ha="center", fontsize=14, fontweight="bold", color=ACCENT)

    add_box(ax, 4.5, 5.5, 3, 0.7, "Developer / Tim Release", BOX3)

    add_box(ax, 1, 4, 2.2, 0.9, "GitHub\n(GitHub Actions)", BOX)
    add_box(ax, 4.9, 4, 2.2, 0.9, "GitLab\n(GitLab CI/CD)", BOX2)
    add_box(ax, 8.8, 4, 2.2, 0.9, "Jenkins\n(Pipeline)", BOX4)

    add_box(ax, 3, 2.3, 6, 1.0,
            "CI Runner / Agent\n(Ubuntu · Java 17 · Flutter · Android SDK)", "#D2E3FC")

    steps = [
        (0.8, 0.9, "1. Checkout"),
        (2.5, 0.9, "2. flutter build apk"),
        (4.5, 0.9, "3. sealing.jar"),
        (6.3, 0.9, "4. doverunner-seal.sh"),
        (8.2, 0.9, "5. Artifact APK"),
    ]
    for x, y, t in steps:
        add_box(ax, x, y, 1.5, 0.65, t, "#FFFFFF", fontsize=8)

    add_box(ax, 4.2, -0.1, 3.6, 0.65,
            "Runtime: Threat → API → PostgreSQL → SIEM", BOX2, fontsize=8)

    arrow(ax, 6, 5.5, 2.1, 4.9)
    arrow(ax, 6, 5.5, 6, 4.9)
    arrow(ax, 6, 5.5, 9.9, 4.9)
    arrow(ax, 2.1, 4, 5, 3.3)
    arrow(ax, 6, 4, 6, 3.3)
    arrow(ax, 9.9, 4, 7, 3.3)
    arrow(ax, 6, 2.3, 6, 1.55)

    for i in range(len(steps) - 1):
        x1 = steps[i][0] + 1.5
        x2 = steps[i + 1][0]
        arrow(ax, x1, 1.22, x2, 1.22)

    save(fig, "cicd-overview.png")


def diagram_workflow_steps():
    fig, ax = plt.subplots(figsize=(10, 8))
    ax.set_xlim(0, 10)
    ax.set_ylim(0, 10)
    ax.axis("off")
    fig.patch.set_facecolor(BG)
    ax.set_facecolor(BG)

    ax.text(5, 9.5, "Alur Step-by-Step Build + Seal (Semua Platform)",
            ha="center", fontsize=13, fontweight="bold", color=ACCENT)

    steps = [
        "Trigger manual\n(workflow / pipeline / build)",
        "Validasi DOVERUNNER_AUTH_KEY",
        "Setup Java 17 + Flutter",
        "flutter pub get",
        "Resolve SIAP_API_URL",
        "Decode keystore (opsional)",
        "flutter build apk --release",
        "Siapkan sealing.jar",
        "java -jar sealing.jar\n(via doverunner-seal.sh)",
        "Upload / Archive artifact",
    ]
    y = 8.8
    for i, s in enumerate(steps, 1):
        add_box(ax, 2.5, y - 0.35, 5, 0.7, f"{i}. {s}", BOX if i % 2 else BOX2, fontsize=9)
        if i < len(steps):
            arrow(ax, 5, y - 0.35, 5, y - 0.85)
        y -= 0.85

    save(fig, "workflow-steps.png")


def diagram_gitlab():
    fig, ax = plt.subplots(figsize=(10, 6))
    ax.set_xlim(0, 10)
    ax.set_ylim(0, 6)
    ax.axis("off")
    fig.patch.set_facecolor(BG)
    ax.set_facecolor(BG)

    ax.text(5, 5.6, "GitLab CI/CD — Alur Integrasi", ha="center",
            fontsize=13, fontweight="bold", color=ACCENT)

    boxes = [
        (0.5, 4.5, "GitLab Project\n(Push / Import repo)"),
        (3.5, 4.5, "CI/CD Variables\n(secrets)"),
        (6.5, 4.5, "GitLab Runner\n(self-hosted)"),
        (2, 2.8, ".gitlab-ci.yml\n(when: manual)"),
        (5.5, 2.8, "Job: build-sealed-apk\nflutter + seal"),
        (3.5, 1.0, "Artifacts\nsealed APK + reference"),
    ]
    for x, y, t in boxes:
        add_box(ax, x, y, 2.5, 0.9, t, BOX2)

    arrow(ax, 1.75, 4.5, 1.75, 3.7)
    arrow(ax, 4.75, 4.5, 3.25, 3.7)
    arrow(ax, 7.75, 4.5, 6.75, 3.7)
    arrow(ax, 3.25, 2.8, 5.5, 2.8)
    arrow(ax, 6.75, 2.8, 4.75, 1.9)

    save(fig, "gitlab-flow.png")


def diagram_jenkins():
    fig, ax = plt.subplots(figsize=(10, 6))
    ax.set_xlim(0, 10)
    ax.set_ylim(0, 6)
    ax.axis("off")
    fig.patch.set_facecolor(BG)
    ax.set_facecolor(BG)

    ax.text(5, 5.6, "Jenkins — Alur Integrasi Pipeline", ha="center",
            fontsize=13, fontweight="bold", color=ACCENT)

    boxes = [
        (0.3, 4.4, "Jenkins LTS\n:8080"),
        (3.2, 4.4, "Credentials\n(auth-key, API URL)"),
        (6.2, 4.4, "Agent Node\nflutter-android"),
        (1.5, 2.7, "Pipeline Job\nJenkinsfile"),
        (5.5, 2.7, "Stages:\nbuild → seal → archive"),
        (3.2, 1.0, "Build Artifacts\nDownload APK"),
    ]
    colors = [BOX4, BOX3, BOX2, BOX, BOX2, BOX3]
    for (x, y, t), c in zip(boxes, colors):
        add_box(ax, x, y, 2.4, 0.9, t, c)

    arrow(ax, 1.5, 4.4, 2.7, 3.6)
    arrow(ax, 4.4, 4.4, 3.2, 3.6)
    arrow(ax, 7.4, 4.4, 6.7, 3.6)
    arrow(ax, 2.7, 2.7, 5.5, 2.7)
    arrow(ax, 6.7, 2.7, 4.4, 1.9)

    save(fig, "jenkins-flow.png")


def diagram_platform_compare():
    fig, ax = plt.subplots(figsize=(10, 4))
    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4)
    ax.axis("off")
    fig.patch.set_facecolor(BG)
    ax.set_facecolor(BG)

    ax.text(5, 3.6, "Perbandingan Konsep: GitHub vs GitLab vs Jenkins",
            ha="center", fontsize=12, fontweight="bold", color=ACCENT)

    headers = ["Konsep", "GitHub", "GitLab", "Jenkins"]
    rows = [
        ["Config file", "build-android-sealed.yml", ".gitlab-ci.yml", "Jenkinsfile"],
        ["Secrets", "Repo Secrets", "CI/CD Variables", "Credentials"],
        ["Runner", "ubuntu-latest", "Self-hosted Runner", "Agent Node"],
        ["Trigger", "workflow_dispatch", "when: manual", "Build with Parameters"],
        ["Output", "Actions Artifacts", "Job Artifacts", "Archive Artifacts"],
    ]
    col_w = [2.2, 2.4, 2.4, 2.4]
    x0 = 0.3
    y = 2.9
    xh = x0
    for h, w in zip(headers, col_w):
        add_box(ax, xh, y, w, 0.45, h, ACCENT, fontsize=8)
        ax.text(xh + w / 2, y + 0.225, h, ha="center", va="center",
                fontsize=8, color="white", fontweight="bold")
        xh += w + 0.05
    y -= 0.55
    for row in rows:
        xh = x0
        for cell, w in zip(row, col_w):
            add_box(ax, xh, y, w, 0.45, cell, "#FFFFFF", fontsize=7)
            xh += w + 0.05
        y -= 0.5

    save(fig, "platform-compare.png")


if __name__ == "__main__":
    diagram_overview()
    diagram_workflow_steps()
    diagram_gitlab()
    diagram_jenkins()
    diagram_platform_compare()
    print("Done.")
