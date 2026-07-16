#!/usr/bin/env bash
# Sealing IPA dengan DoveRunner generate_hash — DINAMIS.
# Pemakaian: seal_ipa.sh /path/absolut/ke/App.ipa
# - Jika SDK ada  -> jalankan generate_hash (meng-enkripsi kode + re-sign IPA).
# - Jika tidak ada -> lewati (exit 0), IPA dibiarkan apa adanya.
#
# generate_hash HANYA berjalan di macOS dan butuh IPA yang SUDAH di-sign
# (distribution/ad-hoc certificate). Lihat docs DoveRunner iOS.
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
IOS_DIR="$(dirname "$SCRIPT_DIR")"
HASH_SCRIPT="$IOS_DIR/AppSealingSDK/Tools/generate_hash"

IPA_PATH="${1:-}"
if [ -z "$IPA_PATH" ]; then
  echo "[appsealing] ERROR: path IPA wajib diisi." >&2
  exit 1
fi

if [ ! -f "$HASH_SCRIPT" ]; then
  echo "[appsealing] generate_hash tidak ada — lewati sealing."
  exit 0
fi

# generate_hash mewajibkan path absolut.
IPA_ABS="$(cd "$(dirname "$IPA_PATH")" && pwd)/$(basename "$IPA_PATH")"
if [ ! -f "$IPA_ABS" ]; then
  echo "[appsealing] ERROR: IPA tidak ditemukan: $IPA_ABS" >&2
  exit 1
fi

chmod +x "$HASH_SCRIPT" 2>/dev/null || true
echo "[appsealing] menjalankan sealing pada: $IPA_ABS"
"$HASH_SCRIPT" "$IPA_ABS"
echo "[appsealing] sealing selesai."
