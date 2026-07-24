#!/usr/bin/env bash
# Seal APK release dengan DoveRunner sealing.jar (AppSealing_CI_Integration_Tool_latest).
# Menggunakan mode resmi: java -jar sealing.jar -config ./config.txt
# Ref: AppSealing_CI_Integration_Tool_latest/Document_EN/config.txt
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
ANDROID_DIR="$ROOT_DIR/android"
TOOLS_DIR="$ANDROID_DIR/doverunner"
JAR="${DOVERUNNER_SEALING_JAR:-$TOOLS_DIR/sealing.jar}"
CONFIG_TEMPLATE="${DOVERUNNER_CONFIG_TEMPLATE:-$TOOLS_DIR/config.txt.example}"
CONFIG_FILE="${DOVERUNNER_CONFIG_FILE:-$TOOLS_DIR/config.txt}"

SRC_APK="${1:-$ROOT_DIR/build/app/outputs/flutter-apk/app-release.apk}"
OUT_APK="${2:-$ROOT_DIR/build/app/outputs/flutter-apk/app-release-sealed.apk}"

API_URL="${DOVERUNNER_API_URL:-https://api.appsealing.com/covault/gw}"
AUTH_KEY="${DOVERUNNER_AUTH_KEY:-}"
DEPLOY_MODE="${DOVERUNNER_DEPLOY_MODE:-release}"
APP_SIGNING="${DOVERUNNER_APP_SIGNING:-registered_key}"
USE_CALLBACK="${DOVERUNNER_USE_CALLBACK:-true}"
PRESET="${DOVERUNNER_SEALING_PRESET_NAME:-}"

if [[ ! -f "$JAR" ]]; then
  echo "[doverunner] ERROR: sealing.jar tidak ditemukan: $JAR" >&2
  echo "Salin dari AppSealing_CI_Integration_Tool_latest (DoveRunner Console -> Third party -> CLI Tool)." >&2
  exit 1
fi

if [[ -z "$AUTH_KEY" ]]; then
  echo "[doverunner] ERROR: DOVERUNNER_AUTH_KEY kosong." >&2
  exit 1
fi

if [[ ! -f "$SRC_APK" ]]; then
  echo "[doverunner] ERROR: APK sumber tidak ada: $SRC_APK" >&2
  exit 1
fi

if [[ ! -f "$CONFIG_TEMPLATE" ]]; then
  echo "[doverunner] ERROR: template config tidak ada: $CONFIG_TEMPLATE" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUT_APK")"
mkdir -p "$TOOLS_DIR"

# Normalisasi path absolut (Windows Git Bash / Linux)
to_abs_path() {
  local p="$1"
  if command -v cygpath >/dev/null 2>&1; then
    cygpath -m "$(cd "$(dirname "$p")" && pwd)/$(basename "$p")"
  else
    readlink -f "$p" 2>/dev/null || realpath "$p" 2>/dev/null || echo "$p"
  fi
}

SRC_APK_ABS="$(to_abs_path "$SRC_APK")"
OUT_APK_ABS="$(to_abs_path "$OUT_APK")"

echo "[doverunner] Seal: $SRC_APK_ABS -> $OUT_APK_ABS"
echo "[doverunner] API: $API_URL | deploymode=$DEPLOY_MODE | callback=$USE_CALLBACK | app_signing=$APP_SIGNING"

# Buat config.txt runtime dari template resmi (AppSealing_CI_Integration_Tool_latest)
cp "$CONFIG_TEMPLATE" "$CONFIG_FILE"

set_config() {
  local key="$1"
  local value="$2"
  if grep -q "^${key}=" "$CONFIG_FILE"; then
    sed -i.bak "s|^${key}=.*|${key}=${value}|" "$CONFIG_FILE"
  else
    echo "${key}=${value}" >> "$CONFIG_FILE"
  fi
}

set_config url "$API_URL"
set_config authkey "$AUTH_KEY"
set_config srcapk "$SRC_APK_ABS"
set_config sealedapk "$OUT_APK_ABS"
set_config deploymode "$DEPLOY_MODE"
set_config app_signing "$APP_SIGNING"
set_config use_callback_feature "$USE_CALLBACK"

if [[ -n "$PRESET" ]]; then
  set_config sealing_preset_name "$PRESET"
fi

rm -f "${CONFIG_FILE}.bak"

echo "[doverunner] Config: $CONFIG_FILE"
echo "[doverunner] Menjalankan: java -jar sealing.jar -config $CONFIG_FILE"

set +e
java -jar "$JAR" -config "$CONFIG_FILE"
EXIT=$?
set -e

if [[ $EXIT -ne 0 ]]; then
  echo "[doverunner] ERROR: sealing.jar exit code $EXIT" >&2
  echo "Lihat https://docs.doverunner.com/mobile-app-security/android/cicd/troubleshoot/" >&2
  exit "$EXIT"
fi

if [[ ! -f "$OUT_APK" ]]; then
  echo "[doverunner] ERROR: sealed APK tidak dibuat: $OUT_APK" >&2
  exit 1
fi

echo "[doverunner] Sealed APK OK: $OUT_APK"
