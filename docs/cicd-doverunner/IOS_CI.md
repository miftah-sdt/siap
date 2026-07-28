# CI/CD iOS — Checklist Khusus (DoveRunner Sealed)

Panduan menjalankan workflow **Build iOS (DoveRunner sealed)** di GitHub Actions.

| Item | Nilai |
|------|-------|
| Workflow | `.github/workflows/build-ios-sealed.yml` |
| Runner | `macos-15` |
| Trigger | Manual (`workflow_dispatch`) |
| Bundle ID | `com.miftah.siap` |
| SDK path | `ios/AppSealingSDK/Tools/generate_hash` |

> Credential dari Windows: [IOS_SIGNING_WINDOWS.md](../IOS_SIGNING_WINDOWS.md)  
> Detail lengkap: [IOS_DOVERUNNER_CI.md](../IOS_DOVERUNNER_CI.md)

---

## Prasyarat mutlak

| No | Item | Wajib | Keterangan |
|----|------|-------|------------|
| 1 | Apple Developer Program | **Ya** | $99/tahun — tanpa ini workflow gagal |
| 2 | DoveRunner iOS SDK | **Ya** | Folder `ios/AppSealingSDK/` |
| 3 | GitHub Secrets iOS (5 buah) | **Ya** | Certificate + profile + Team ID |
| 4 | Repo GitHub **private** | **Ya** | SDK berlisensi — jangan public |
| 5 | Mac lokal | Tidak | Build di runner GitHub |

---

## Checklist sebelum Run workflow

Centang semua item berikut:

```
[ ] ios/AppSealingSDK/Tools/generate_hash ada di repo (sudah di-push)
[ ] IOS_DIST_CERT_P12_BASE64        — base64 file .p12 (Apple Distribution)
[ ] IOS_DIST_CERT_PASSWORD          — password export .p12
[ ] IOS_MOBILEPROVISION_BASE64      — base64 provisioning profile
[ ] IOS_TEAM_ID                     — Team ID 10 karakter Apple
[ ] IOS_PROFILE_NAME                — nama persis provisioning profile
[ ] (Opsional) SIAP_API_URL         — https://archive-capabilities-devices-embedded.trycloudflare.com/v1
[ ] App ID com.miftah.siap terdaftar di Apple Developer
[ ] Bundle ID terdaftar di DoveRunner Console
[ ] UDID iPhone terdaftar (jika export_method = release-testing / ad-hoc)
```

---

## Langkah 1 — Salin AppSealingSDK ke repo SIAP

SDK dari DoveRunner Console biasanya diunduh terpisah. Di mesin lokal:

```bash
cd siap

# Contoh: SDK ada di folder sibling (sesuaikan path)
cp -r "../ios/AppSealingSDK_Xcode_1.14.0.0-AdhocEnabled_[com.miftah.siap]/AppSealingSDK" ios/

# Pastikan tool sealing executable
chmod +x ios/AppSealingSDK/Tools/generate_hash

# Verifikasi
test -x ios/AppSealingSDK/Tools/generate_hash && echo "OK"
```

SDK sudah disalin ke `siap/ios/AppSealingSDK`. Commit ke repo private:

```bash
cd siap
git add -f ios/AppSealingSDK
git commit -m "chore: add AppSealingSDK for iOS CI (private repo)"
git push
```

> Folder `AppSealingSDK/` ada di `.gitignore` — wajib `git add -f`.

---

## Langkah 2 — Isi GitHub Secrets

Repo → **Settings → Secrets and variables → Actions**

| Secret GitHub | Isi | Catatan |
|---------------|-----|---------|
| `IOS_DIST_CERT_P12_BASE64` | Base64 `.p12` | Apple **Distribution** certificate |
| `IOS_DIST_CERT_PASSWORD` | Password `.p12` | Password saat export pkcs12 |
| `IOS_MOBILEPROVISION_BASE64` | Base64 `.mobileprovision` | Ad Hoc atau App Store profile |
| `IOS_TEAM_ID` | `AB12CD34EF` | developer.apple.com → Membership |
| `IOS_PROFILE_NAME` | `SIAP AdHoc` | Nama **persis** di portal Apple |

### Mapping error CI → secret yang benar

Pesan error di log Actions memakai alias singkat; secret GitHub aslinya:

| Pesan error CI | Secret GitHub yang harus diisi |
|----------------|-------------------------------|
| `Secret CERT belum di-set` | `IOS_DIST_CERT_P12_BASE64` |
| `Secret CERT_PW belum di-set` | `IOS_DIST_CERT_PASSWORD` |
| `Secret PROFILE belum di-set` | `IOS_MOBILEPROVISION_BASE64` |
| `Secret TEAM_ID belum di-set` | `IOS_TEAM_ID` |
| `Secret PROFILE_NAME belum di-set` | `IOS_PROFILE_NAME` |

### Encode base64 (Git Bash / Windows)

```bash
base64 -w0 ios_dist.p12 > ios_dist_p12.b64.txt
base64 -w0 SIAP_AdHoc.mobileprovision > profile.b64.txt
```

Copy **seluruh isi** file `.b64.txt` ke secret (tanpa spasi/baris baru).

Panduan buat certificate dari Windows: [IOS_SIGNING_WINDOWS.md](../IOS_SIGNING_WINDOWS.md)

---

## Langkah 3 — Buat credential Apple (ringkas)

1. **App ID** — `com.miftah.siap` di developer.apple.com
2. **Team ID** → secret `IOS_TEAM_ID`
3. **Apple Distribution certificate** → export `.p12` → base64
4. **Device UDID** — daftarkan iPhone (untuk ad-hoc)
5. **Ad Hoc profile** — pilih cert + device → download `.mobileprovision`
6. Nama profile → secret `IOS_PROFILE_NAME`

---

## Langkah 4 — Jalankan workflow

1. GitHub → repo **siap** → tab **Actions**
2. Pilih **Build iOS (DoveRunner sealed)**
3. Klik **Run workflow**
4. Pilih branch (`main`)
5. Input:

| Input | Pilihan | Kapan dipakai |
|-------|---------|---------------|
| `export_method` | `release-testing` | Ad-hoc — install langsung ke iPhone (UDID terdaftar) |
| `export_method` | `app-store-connect` | TestFlight / App Store |
| `api_base_url` | opsional | Override `SIAP_API_URL` |

6. Tunggu status **hijau** (success)
7. Download artifact **`siap-ios-sealed-ipa`**

---

## Alur workflow (12 step)

```
1.  Checkout
2.  Cek prasyarat (SDK + 5 secrets)     ← gagal di sini jika checklist belum lengkap
3.  Resolve API URL
4.  Setup Flutter
5.  Import certificate & provisioning profile
6.  flutter pub get
7.  flutter build ios --release --no-codesign
8.  apply_appsealing.sh (embed SDK)
9.  xcodebuild archive (signed)
10. xcodebuild export IPA
11. seal_ipa.sh (generate_hash)
12. Upload artifact siap-ios-sealed-ipa
```

---

## Troubleshooting iOS CI

| Gejala | Penyebab | Solusi |
|--------|----------|--------|
| `ios/AppSealingSDK tidak ada` | SDK tidak di-push | Langkah 1 — `git add -f ios/AppSealingSDK` |
| `Secret CERT/CERT_PW/...` | Secret kosong | Langkah 2 — isi 5 secret `IOS_*` |
| Archive/sign gagal | Cert/profile mismatch | Cek Team ID, profile name, bundle ID |
| `generate_hash tidak ada` | Tools hilang / tidak executable | `chmod +x ios/AppSealingSDK/Tools/generate_hash` |
| Install ad-hoc gagal | UDID tidak di profile | Tambah UDID di Apple Developer → regenerate profile |
| OpenSSL import gagal | Enkripsi .p12 baru | Buat ulang dengan `openssl pkcs12 -export -legacy ...` |

---

## Perbandingan Android vs iOS CI

| | Android | iOS |
|--|---------|-----|
| Workflow | `build-android-sealed.yml` | `build-ios-sealed.yml` |
| Runner | `ubuntu-latest` | `macos-15` |
| Tool sealing | `sealing.jar` | `AppSealingSDK` + `generate_hash` |
| Apple account | Tidak perlu | **Wajib** $99/tahun |
| Secrets utama | `DOVERUNNER_AUTH_KEY` + jar | 5× `IOS_*` + SDK di repo |
| Artifact | `sealed-apk-release` | `siap-ios-sealed-ipa` |

---

## Referensi

- [IOS_DOVERUNNER_CI.md](../IOS_DOVERUNNER_CI.md)
- [IOS_SIGNING_WINDOWS.md](../IOS_SIGNING_WINDOWS.md)
- [ANDROID_DOVERUNNER_CI.md](../ANDROID_DOVERUNNER_CI.md)
