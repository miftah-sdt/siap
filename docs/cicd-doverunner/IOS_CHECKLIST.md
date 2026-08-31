# Checklist Cepat — CI/CD iOS DoveRunner

Gunakan halaman ini sebagai lembar centang sebelum menjalankan **Build iOS (DoveRunner sealed)**.

---

## A. File di repository

- [ ] `ios/AppSealingSDK/` sudah ada di repo (force-add: `git add -f ios/AppSealingSDK`)
- [ ] `ios/AppSealingSDK/Tools/generate_hash` executable
- [ ] Perubahan sudah `git push` ke branch yang di-run workflow
- [ ] Repo GitHub **private** (SDK tidak boleh public)

---

## B. GitHub Secrets (Settings → Actions)

- [ ] `IOS_DIST_CERT_P12_BASE64`
- [ ] `IOS_DIST_CERT_PASSWORD`
- [ ] `IOS_MOBILEPROVISION_BASE64`
- [ ] `IOS_TEAM_ID`
- [ ] `IOS_PROFILE_NAME`
- [ ] `SIAP_API_URL` (opsional): `https://weblog-preparing-packing-came.trycloudflare.com/v1`

---

## C. Apple Developer

- [ ] Akun Apple Developer Program aktif ($99/tahun)
- [ ] App ID `com.miftah.siap` terdaftar
- [ ] Apple Distribution certificate dibuat
- [ ] Provisioning profile dibuat (Ad Hoc atau App Store)
- [ ] UDID iPhone terdaftar (jika ad-hoc / `release-testing`)

---

## D. DoveRunner Console

- [ ] Bundle `com.miftah.siap` terdaftar
- [ ] **Use callback for threat handling** aktif (Monitoring Mode)

---

## E. Jalankan workflow

- [ ] Actions → **Build iOS (DoveRunner sealed)** → Run workflow
- [ ] `export_method`: `release-testing` (ad-hoc) atau `app-store-connect` (TestFlight)
- [ ] Download artifact **siap-ios-sealed-ipa**

---

## Jika gagal di step "Cek prasyarat"

| Error log | Perbaikan |
|-----------|-----------|
| AppSealingSDK tidak ada | Bagian A |
| Secret CERT / CERT_PW / PROFILE / TEAM_ID / PROFILE_NAME | Bagian B (lihat mapping di [IOS_CI.md](./IOS_CI.md)) |
