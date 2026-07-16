# iOS Signing + Sealing dari Windows (tanpa Mac)

Panduan menyiapkan **credential iOS** untuk build + sealing DoveRunner di CI GitHub,
seluruhnya **dari Windows** (tanpa Mac). Build tetap berjalan di runner macOS milik
GitHub — PC-mu hanya membuat credential lalu mengisi GitHub Secrets.

> Prasyarat mutlak: **akun Apple Developer Program berbayar ($99/thn)**.
> Tanpa ini, sertifikat distribusi/ad-hoc tidak bisa dibuat (lihat `docs/` pembahasan sebelumnya).

Perangkat di Windows: **OpenSSL** (sudah ada di Git Bash) dan **iTunes** (untuk ambil UDID).

---

## Ringkasan: apa saja yang harus diisi (GitHub Secrets)

Repo → **Settings → Secrets and variables → Actions → New repository secret**.

Untuk workflow `build-ios-sealed.yml` (ad-hoc, install langsung ke iPhone terdaftar):

| Secret | Isi | Diperoleh dari |
|--------|-----|----------------|
| `IOS_DIST_CERT_P12_BASE64` | isi file `.p12` yang di-base64 | Langkah 3–4 (OpenSSL) |
| `IOS_DIST_CERT_PASSWORD` | password `.p12` yang kamu tentukan | Langkah 4 |
| `IOS_MOBILEPROVISION_BASE64` | isi `.mobileprovision` yang di-base64 | Langkah 6 |
| `IOS_TEAM_ID` | Team ID (mis. `AB12CD34EF`) | developer.apple.com → Membership |
| `IOS_PROFILE_NAME` | nama persis provisioning profile | Langkah 6 |
| `SIAP_API_URL` *(opsional)* | `https://.../v1` | URL API-mu |

Selain itu: folder **`ios/AppSealingSDK/`** harus tersedia di CI. Karena di-git-ignore,
untuk repo **private** jalankan sekali: `git add -f ios/AppSealingSDK && git commit`.

---

## Langkah 1 — Daftarkan App ID

1. Masuk [developer.apple.com/account](https://developer.apple.com/account) → **Certificates, IDs & Profiles → Identifiers**.
2. **+** → **App IDs** → **App** → Bundle ID **Explicit**: `com.miftah.siap`.
3. Simpan. (Aktifkan capability bila perlu; untuk SIAP default cukup.)

## Langkah 2 — Catat Team ID

**Membership** (atau pojok kanan atas) → salin **Team ID** (10 karakter, mis. `AB12CD34EF`).
Ini nanti jadi `IOS_TEAM_ID`.

## Langkah 3 — Buat private key + CSR (OpenSSL di Windows)

Buka **Git Bash** di folder kerja, lalu:

```bash
# private key
openssl genrsa -out ios_dist.key 2048

# certificate signing request (ganti email/nama sesuai kebutuhan)
openssl req -new -key ios_dist.key -out ios_dist.csr \
  -subj "/emailAddress=kamu@email.com/CN=SIAP Distribution/C=ID"
```

Hasil: `ios_dist.key` (rahasia, simpan!) dan `ios_dist.csr` (diupload ke Apple).

## Langkah 4 — Terbitkan Distribution certificate → `.p12`

1. Portal Apple → **Certificates** → **+**.
2. Pilih **Apple Distribution** (atau **iOS Distribution**) → **Continue**.
3. Upload `ios_dist.csr` → **Continue** → **Download** → dapat `distribution.cer`.
4. Di Git Bash, gabungkan cert + private key jadi `.p12`:

```bash
# konversi .cer (DER) → PEM
openssl x509 -inform DER -in distribution.cer -out distribution.pem

# gabung jadi .p12 (isi password saat diminta -> jadi IOS_DIST_CERT_PASSWORD)
openssl pkcs12 -export \
  -inkey ios_dist.key \
  -in distribution.pem \
  -out ios_dist.p12 \
  -name "Apple Distribution"
```

> Jika nanti import di CI gagal (OpenSSL 3.x memakai enkripsi baru), buat ulang dengan
> tambahan flag `-legacy`:
> `openssl pkcs12 -export -legacy -inkey ios_dist.key -in distribution.pem -out ios_dist.p12 -name "Apple Distribution"`

## Langkah 5 — Ambil UDID iPhone (dari Windows) & daftarkan

Hanya untuk **ad-hoc** (install langsung). Kalau nanti pakai TestFlight, langkah ini tidak perlu.

1. Colok iPhone → buka **iTunes** → klik ikon device → **Summary**.
2. Klik tulisan **Serial Number** berulang sampai berubah jadi **UDID** → klik kanan → **Copy**.
3. Portal Apple → **Devices** → **+** → tempel UDID → beri nama → **Continue**.

## Langkah 6 — Buat Provisioning Profile (Ad Hoc) → `.mobileprovision`

1. Portal Apple → **Profiles** → **+**.
2. Pilih **Ad Hoc** (Distribution) → **Continue**.
3. App ID: `com.miftah.siap` → pilih **Distribution certificate** (Langkah 4) → pilih **device** (Langkah 5).
4. Beri **nama profile** (mis. `SIAP AdHoc`) → ini nanti jadi `IOS_PROFILE_NAME`.
5. **Generate** → **Download** → dapat `SIAP_AdHoc.mobileprovision`.

## Langkah 7 — Ubah file jadi base64 (Windows)

Di **Git Bash**:

```bash
base64 -w0 ios_dist.p12          > ios_dist_p12.b64.txt
base64 -w0 SIAP_AdHoc.mobileprovision > profile.b64.txt
```

Atau di **PowerShell**:

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("ios_dist.p12"))          | Set-Content ios_dist_p12.b64.txt
[Convert]::ToBase64String([IO.File]::ReadAllBytes("SIAP_AdHoc.mobileprovision")) | Set-Content profile.b64.txt
```

Isi `ios_dist_p12.b64.txt` → secret **`IOS_DIST_CERT_P12_BASE64`**.
Isi `profile.b64.txt` → secret **`IOS_MOBILEPROVISION_BASE64`**.

## Langkah 8 — Isi semua Secrets & jalankan

Isi 5 secret di tabel atas. Lalu: tab **Actions → Build iOS (DoveRunner sealed) → Run workflow**
→ pilih `export_method: release-testing` (ad-hoc) → **Run**.

Hasil: artifact **`siap-ios-sealed-ipa`**. Download, lalu install ke iPhone terdaftar
(mis. via Apple Configurator/Finder; dari Windows bisa lewat iTunes drag-drop atau layanan MDM).

---

## Alternatif (disarankan): TestFlight — paling mudah dari Windows

Kalau tujuannya install mudah tanpa urus UDID, pakai **App Store Connect API Key**
(bukan cert manual di atas). Semua dibuat lewat web, tanpa Mac:

1. [appstoreconnect.apple.com](https://appstoreconnect.apple.com) → **Users and Access → Integrations → App Store Connect API**.
2. **Generate API Key** (role: App Manager) → **Download** `.p8` (hanya sekali!).
3. Catat **Key ID** dan **Issuer ID**.

Secrets untuk pipeline Fastlane + TestFlight:

| Secret | Isi |
|--------|-----|
| `APP_STORE_CONNECT_KEY_ID` | Key ID |
| `APP_STORE_CONNECT_ISSUER_ID` | Issuer ID |
| `APP_STORE_CONNECT_PRIVATE_KEY` | isi file `.p8` (teks penuh) |
| `IOS_DIST_CERT_P12_BASE64` + `IOS_DIST_CERT_PASSWORD` | tetap perlu untuk re-sign (Langkah 3–4) |
| `IOS_PROFILE_NAME` | nama profile distribusi |

Lalu install di iPhone cukup lewat app **TestFlight** — tanpa UDID, tanpa tool Windows.
(Pipeline Fastlane belum dibuat; minta saya set up bila memilih jalur ini.)

---

## Catatan keamanan

- `ios_dist.key`, `.p12`, `.p8`, `.mobileprovision` bersifat **rahasia** — jangan commit ke Git.
  Simpan hanya sebagai GitHub Secrets + backup pribadi yang aman.
- File `.b64.txt` juga rahasia; hapus setelah dimasukkan ke Secrets.
