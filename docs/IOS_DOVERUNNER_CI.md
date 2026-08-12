# DoveRunner iOS CI/CD + GitHub Actions (SIAP)

Panduan build dan **sealing IPA** Flutter SIAP dengan DoveRunner AppSealing SDK di GitHub Actions.

> Android memakai CLI `sealing.jar` — lihat [ANDROID_DOVERUNNER_CI.md](ANDROID_DOVERUNNER_CI.md).  
> iOS memakai **SDK embed** + tool `generate_hash` (bukan upload IPA ke server).

## Ringkasan alur

```
GitHub Actions (macos-15)
  → flutter build ios --release --no-codesign
  → apply_appsealing.sh (embed AppSealingSDK ke Xcode)
  → xcodebuild archive + export IPA (signed)
  → seal_ipa.sh (generate_hash)
  → artifact IPA ter-seal
```

| Komponen | Path |
|----------|------|
| Workflow CI | `.github/workflows/build-ios-sealed.yml` |
| Integrasi SDK | `ios/scripts/apply_appsealing.sh` |
| Sealing IPA | `ios/scripts/seal_ipa.sh` |
| Threat callback | `ios/Runner/Security/AppSealingThreatBridge.swift` |
| Credential dari Windows | [IOS_SIGNING_WINDOWS.md](IOS_SIGNING_WINDOWS.md) |

---

## Prasyarat

| Item | Wajib | Keterangan |
|------|-------|------------|
| Apple Developer Program | Ya | $99/tahun — distribution/ad-hoc certificate |
| DoveRunner iOS SDK | Ya | Folder `ios/AppSealingSDK/` (di-git-ignore) |
| Bundle ID | Ya | `com.miftah.siap` terdaftar di Apple + DoveRunner |
| GitHub Secrets | Ya | Certificate, provisioning profile, Team ID |
| macOS lokal | Tidak | Build di runner GitHub `macos-15` |

### Menyediakan AppSealingSDK di repo

SDK berlisensi dan di-ignore default. Untuk repo **private**:

```bash
git add -f ios/AppSealingSDK
git commit -m "chore: add AppSealingSDK for CI (private repo)"
```

Alternatif: checkout SDK dari secure storage / artifact terpisah di workflow (custom step).

---

## GitHub Secrets

Repository → **Settings → Secrets and variables → Actions**

| Secret | Wajib | Isi |
|--------|-------|-----|
| `IOS_DIST_CERT_P12_BASE64` | Ya | Base64 file `.p12` (Apple Distribution) |
| `IOS_DIST_CERT_PASSWORD` | Ya | Password export `.p12` |
| `IOS_MOBILEPROVISION_BASE64` | Ya | Base64 provisioning profile (ad-hoc / App Store) |
| `IOS_TEAM_ID` | Ya | Team ID 10 karakter dari Apple Developer |
| `IOS_PROFILE_NAME` | Ya | Nama persis provisioning profile |
| `SIAP_API_URL` | Disarankan | `https://<tunnel-atau-domain>/v1` |

Cara membuat credential dari **Windows** (tanpa Mac): [IOS_SIGNING_WINDOWS.md](IOS_SIGNING_WINDOWS.md).

Encode file ke base64 (Git Bash):

```bash
base64 -w0 ios_dist.p12 > ios_dist.p12.b64
base64 -w0 profile.mobileprovision > profile.mobileprovision.b64
```

---

## Menjalankan workflow GitHub Actions

1. Tab **Actions** → **Build iOS (DoveRunner sealed)**
2. **Run workflow**
3. Pilih:
   - **export_method**: `release-testing` (ad-hoc, sideload) atau `app-store-connect` (TestFlight)
   - **api_base_url** (opsional): URL API produksi
4. Download artifact **`siap-ios-sealed-ipa`**

Workflow **manual** (`workflow_dispatch`) — tidak otomatis setiap push.

---

## Build & seal lokal (macOS)

```bash
cd siap

# 1. Build Flutter (no codesign)
flutter build ios --release --no-codesign \
  --dart-define=API_BASE_URL=https://knowledgestorm-arizona-campaigns-proportion.trycloudflare.com/v1 \
  --dart-define=ENABLE_THREAT_REPORTING=true

# 2. Embed SDK (skip otomatis jika ios/AppSealingSDK tidak ada)
bash ios/scripts/apply_appsealing.sh

# 3. Archive + export IPA via Xcode / xcodebuild (harus sudah signed)
#    ... lihat build-ios-sealed.yml untuk contoh xcodebuild ...

# 4. Seal IPA
bash ios/scripts/seal_ipa.sh /path/absolut/App.ipa
```

`generate_hash` hanya jalan di **macOS** dan membutuhkan IPA yang **sudah di-sign**.

---

## Opsi workflow

| Input | Nilai | Keterangan |
|-------|-------|------------|
| `export_method` | `release-testing` | Ad-hoc — install ke device terdaftar UDID |
| `export_method` | `app-store-connect` | Upload ke TestFlight / App Store |
| `api_base_url` | URL opsional | Override `SIAP_API_URL` secret |

---

## Threat detection (Monitoring Mode)

Threat callback iOS sudah diimplementasi:

- `ios/Runner/Security/AppSealingThreatBridge.swift`
- `ios/Runner/Security/DoveRunnerThreatCatalog.swift`
- Flutter: `lib/core/security/threat_guard.dart`

Pastikan opsi **Use callback for threat handling** aktif saat konfigurasi sealing di DoveRunner Console.

Laporan ancaman dikirim ke API: `POST /v1/security/threats` (lihat [API.md](API.md)).

---

## Perbandingan Android vs iOS

| | Android | iOS |
|--|---------|-----|
| Tool | `sealing.jar` (CLI upload) | `AppSealingSDK` + `generate_hash` |
| Runner CI | `ubuntu-latest` | `macos-15` |
| Workflow | `build-android-sealed.yml` | `build-ios-sealed.yml` |
| Apple account | Tidak perlu | Developer $99/tahun |
| Dokumentasi | [ANDROID_DOVERUNNER_CI.md](ANDROID_DOVERUNNER_CI.md) | dokumen ini |

---

## Troubleshooting

| Gejala | Penyebab | Solusi |
|--------|----------|--------|
| `ios/AppSealingSDK tidak ada` | SDK tidak di checkout | `git add -f ios/AppSealingSDK` atau sediakan via storage |
| Secret belum di-set | Credential kosong | Isi semua `IOS_*` secrets |
| Archive/sign gagal | Cert/profile mismatch | Cek Team ID, profile name, bundle ID |
| `generate_hash tidak ada` | SDK Tools hilang | Pastikan `ios/AppSealingSDK/Tools/generate_hash` executable |
| IPA tidak ter-seal | Path relatif | Gunakan path absolut ke `.ipa` |
| Install ad-hoc gagal | UDID tidak terdaftar | Tambah UDID di provisioning profile Apple |

---

## Referensi resmi

- [DoveRunner Mobile App Security](https://docs.doverunner.com/mobile-app-security/)
- Workflow terkait: `.github/workflows/build-ios.yml` (IPA unsigned, tanpa sealing — jalur AltStore/SideStore)
