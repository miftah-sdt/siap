#!/usr/bin/env bash
# Integrasi DoveRunner/AppSealing ke Xcode project — DINAMIS.
# - Jika ios/AppSealingSDK ADA  -> integrasikan SDK ke Runner.xcodeproj.
# - Jika TIDAK ADA              -> lewati (exit 0), build tetap jalan tanpa sealing.
#
# Aman dipanggil di CI sebelum `xcodebuild archive`.
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
IOS_DIR="$(dirname "$SCRIPT_DIR")"
SDK_DIR="$IOS_DIR/AppSealingSDK"

if [ ! -d "$SDK_DIR" ]; then
  echo "[appsealing] ios/AppSealingSDK tidak ada — build TANPA sealing."
  exit 0
fi

echo "[appsealing] SDK terdeteksi — mengintegrasikan ke Runner.xcodeproj..."
chmod +x "$SDK_DIR/Tools/generate_hash" 2>/dev/null || true
python3 "$SCRIPT_DIR/integrate_appsealing.py"
echo "[appsealing] integrasi selesai."
