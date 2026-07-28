# DoveRunner Android CI/CD + GitHub Actions (SIAP)

Panduan build dan **sealing APK** Flutter SIAP dengan paket resmi **AppSealing_CI_Integration_Tool_latest** (`sealing.jar` + `config.txt`).

> **Dokumen Word lengkap:** [cicd-doverunner/SIAP-DoveRunner-CICD-GitHub.docx](cicd-doverunner/SIAP-DoveRunner-CICD-GitHub.docx) (Android + checklist iOS)  
> **Checklist iOS:** [cicd-doverunner/IOS_CHECKLIST.md](cicd-doverunner/IOS_CHECKLIST.md)

> iOS memakai SDK embed — lihat [IOS_DOVERUNNER_CI.md](IOS_DOVERUNNER_CI.md).

## Ringkasan alur

```
GitHub Actions (ubuntu-latest)
  → flutter build apk --release
  → ambil sealing.jar (Release / repo / URL)
  → doverunner-seal.sh (generate config.txt)
  → java -jar sealing.jar -config config.txt
  → artifact APK ter-seal
```

| Komponen | Path |
|----------|------|
| Workflow CI | `.github/workflows/build-android-sealed.yml` |
| Script seal | `android/scripts/doverunner-seal.sh` |
| Template config | `android/doverunner/config.txt.example` |
| Contoh resmi v3 | `android/doverunner/examples/` |
| Threat callback | `android/.../ThreatReceiver.kt` |

---

## Paket resmi: AppSealing_CI_Integration_Tool_latest

Unduh dari [DoveRunner Console](https://console.doverunner.com) → **Organization → Third party → CLI Tool for Android AppSealing**.

```
AppSealing_CI_Integration_Tool_latest/
├── sealing.jar
├── CLI Key.txt
└── Document_EN/
    ├── config.txt
    └── examples/
        ├── config-for-native-v3.txt   ← basis template SIAP
        └── ...
```

Mode eksekusi resmi:

```bash
java -jar sealing.jar -config ./config.txt
```

---

## GitHub Secrets

Repository → **Settings → Secrets and variables → Actions**

| Secret | Wajib | Isi |
|--------|-------|-----|
| `DOVERUNNER_AUTH_KEY` | Ya | CLI Key dari `CLI Key.txt` |
| `SIAP_API_URL` | Disarankan | `https://<domain>/v1` |
| `DOVERUNNER_API_URL` | Opsional | Default script: `https://api.appsealing.com/covault/gw` |
| `DOVERUNNER_SEALING_PRESET_NAME` | Opsional | Nama preset DoveRunner Console |
| `DOVERUNNER_SEALING_JAR_URL` | Opsional* | URL unduh `sealing.jar` |
| `ANDROID_KEYSTORE_BASE64` | Opsional** | Base64 keystore release |
| `ANDROID_KEYSTORE_PASSWORD` | Opsional** | Password keystore |
| `ANDROID_KEY_ALIAS` | Opsional** | Alias key (`siap`) |
| `ANDROID_KEY_PASSWORD` | Opsional** | Password key |

\* Alternatif jika tidak pakai GitHub Release atau commit jar ke repo.  
\*\* Wajib jika `app_signing=none` atau CI belum punya `android/key.properties`.

### sealing.jar tidak bisa di GitHub Secret

`sealing.jar` ≈ **2.5 MB** → base64 ≈ **3.3 MB**.  
GitHub Actions Secret **maksimum 64 KB** — paste `sealing.jar.b64` **tidak akan berhasil**.

Pilih **salah satu** cara menyediakan jar di CI:

#### Opsi A — GitHub Release (disarankan)

Upload sekali, CI unduh otomatis via `gh release download`:

```bash
cd AppSealing_CI_Integration_Tool_latest

# Release baru
gh release create doverunner-tools sealing.jar \
  --repo miftah-sdt/siap \
  --title "DoveRunner CLI (internal)" \
  --notes "Asset sealing.jar untuk CI. Jangan didistribusikan."

# Atau update asset release yang sudah ada
gh release upload doverunner-tools sealing.jar --repo miftah-sdt/siap --clobber
```

Workflow otomatis cari release tag **`doverunner-tools`** dengan asset `sealing.jar`.

#### Opsi B — Commit ke repo private

```bash
cp AppSealing_CI_Integration_Tool_latest/sealing.jar siap/android/doverunner/
cd siap
git add -f android/doverunner/sealing.jar
git commit -m "chore: add sealing.jar for CI (private repo)"
git push
```

File tetap di `.gitignore` default — wajib `git add -f`.

#### Opsi C — URL unduh (secret)

Host `sealing.jar` di storage pribadi (S3, R2, server internal), lalu:

```
DOVERUNNER_SEALING_JAR_URL = https://your-storage/sealing.jar
```

> **Jangan commit** `config.txt` (berisi authkey). `sealing.jar.b64` tidak diperlukan.

---

## Menjalankan workflow GitHub Actions

1. Tab **Actions** → **Build Android (DoveRunner sealed)**
2. **Run workflow**
3. Pilih input:

| Input | Disarankan | Keterangan |
|-------|------------|------------|
| `deploymode` | `test` (uji) / `release` (produksi) | Test = watermark gratis |
| `use_callback` | `true` | Monitoring Mode → `ThreatReceiver.kt` |
| `app_signing` | `registered_key` | Keystore `com.miftah.siap` harus diregistrasi di console |
| `api_base_url` | opsional | Override `SIAP_API_URL` |

4. Download artifact **`sealed-apk-release`** atau **`sealed-apk-test`**

---

## Build & seal lokal

```bash
cd siap

# 1. Build APK release
flutter build apk --release \
  --dart-define=API_BASE_URL=https://archive-capabilities-devices-embedded.trycloudflare.com/v1 \
  --dart-define=ENABLE_THREAT_REPORTING=true

# 2. Salin sealing.jar dari paket resmi
cp ../AppSealing_CI_Integration_Tool_latest/sealing.jar android/doverunner/

# 3. Set CLI Key dan seal
export DOVERUNNER_AUTH_KEY="$(sed -n 's/^CLI Key: //p' ../AppSealing_CI_Integration_Tool_latest/CLI\ Key.txt | tr -d '\r\n')"
export DOVERUNNER_DEPLOY_MODE=release
export DOVERUNNER_USE_CALLBACK=true
export DOVERUNNER_APP_SIGNING=registered_key
# Opsional region Jakarta:
# export DOVERUNNER_API_URL=https://jakarta-api.appsealing.com/covault/gw

bash android/scripts/doverunner-seal.sh
```

Output: `build/app/outputs/flutter-apk/app-release-sealed.apk`

---

## Script `doverunner-seal.sh`

Script otomatis:

1. Menyalin `config.txt.example` → `config.txt`
2. Mengisi `authkey`, `srcapk`, `sealedapk`, `deploymode`, dll.
3. Menjalankan `java -jar sealing.jar -config config.txt`

Variabel lingkungan:

| Variabel | Default |
|----------|---------|
| `DOVERUNNER_AUTH_KEY` | *(wajib)* |
| `DOVERUNNER_API_URL` | `https://api.appsealing.com/covault/gw` |
| `DOVERUNNER_DEPLOY_MODE` | `release` |
| `DOVERUNNER_APP_SIGNING` | `registered_key` |
| `DOVERUNNER_USE_CALLBACK` | `true` |
| `DOVERUNNER_SEALING_PRESET_NAME` | *(kosong)* |
| `DOVERUNNER_SEALING_JAR` | `android/doverunner/sealing.jar` |

Argumen opsional: `doverunner-seal.sh [src_apk] [out_apk]`

---

## Opsi config penting (AppSecurity 3.x)

| Opsi | Nilai SIAP | Keterangan |
|------|------------|------------|
| `service_type` | `NATIVE_AOS` | Flutter = native Android |
| `use_callback_feature` | `true` | Broadcast threat, bukan force-close |
| `app_signing` | `registered_key` | Keystore terdaftar di console |
| `deploymode` | `test` / `release` | Test = watermark |
| `url` | Global API (default) | Jakarta: `https://jakarta-api.appsealing.com/covault/gw` |

Threat callback: `ThreatReceiver.kt` + `lib/core/security/threat_guard.dart` → `POST /v1/security/threats`.

---

## DoveRunner Console — checklist

1. Registrasi package **`com.miftah.siap`**
2. Upload **keystore release** (untuk `app_signing=registered_key`)
3. Aktifkan **Use callback for threat handling instead of app termination**
4. Pastikan **CLI / enterprise key aktif** (lisensi AppSealing)
5. (Opsional) Buat **sealing preset** → set `DOVERUNNER_SEALING_PRESET_NAME`

---

## Troubleshooting

| Exit / pesan | Penyebab | Solusi |
|--------------|----------|--------|
| **208** / `enterprise_key is inactive` | Lisensi CLI belum aktif | Hubungi DoveRunner support / aktivasi akun |
| **110** | Auth key salah / package belum diregistrasi | Cek CLI Key, daftar `com.miftah.siap` |
| **120** | Path APK salah | Pastikan `flutter build apk` sukses |
| **130–160** | Network / upload gagal | Retry (CLI retry otomatis) |
| Keystore mismatch | `registered_key` tidak cocok | Registrasi ulang keystore di console |

Uji setelah seal:

```bash
adb install -r app-release-sealed.apk
adb logcat | grep -E "ThreatTracker|ThreatGuard"
```

---

## Referensi resmi

- [CI/CD Pipeline Integration](https://docs.doverunner.com/mobile-app-security/android/cicd/)
- [Basic Configuration](https://docs.doverunner.com/mobile-app-security/android/cicd/basic-configuration/)
- [Troubleshooting](https://docs.doverunner.com/mobile-app-security/android/cicd/troubleshoot/)
- CI umum: [CI_CD.md](CI_CD.md)
