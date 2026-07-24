# DoveRunner CLI (AppSealing_CI_Integration_Tool_latest)

Folder ini menyiapkan integrasi CI/CD Android sealing sesuai paket resmi **AppSealing_CI_Integration_Tool_latest** dari DoveRunner Console.

## Struktur (selaras paket resmi)

| File / folder | Asal resmi | Fungsi |
|---------------|------------|--------|
| `sealing.jar` | root paket CLI | JAR sealing (jangan commit — lihat `.gitignore`) |
| `config.txt.example` | `Document_EN/examples/config-for-native-v3.txt` + preset SIAP | Template config AppSecurity 3.x |
| `examples/` | `Document_EN/examples/` + `config.txt` | Contoh resmi native/hybrid v2 & v3 |
| `config.txt` | generated | Dibuat runtime oleh `android/scripts/doverunner-seal.sh` |

## Setup CI (GitHub Actions)

`sealing.jar` (~2.5 MB) **tidak muat** GitHub Secret (max 64 KB). Pilih:

1. **GitHub Release** tag `doverunner-tools` + asset `sealing.jar` ← disarankan
2. **`git add -f sealing.jar`** di repo private
3. Secret **`DOVERUNNER_SEALING_JAR_URL`** = URL unduh jar

Detail: [docs/ANDROID_DOVERUNNER_CI.md](../../docs/ANDROID_DOVERUNNER_CI.md)

## Setup lokal

1. Unduh paket dari DoveRunner Console → Third party → CLI Tool
2. Salin `sealing.jar` ke folder ini
3. `export DOVERUNNER_AUTH_KEY="..."` dari `CLI Key.txt`
4. `bash android/scripts/doverunner-seal.sh`

Perintah resmi (setara script):

```bash
java -jar sealing.jar -config ./config.txt
```

## SIAP (Flutter)

- `service_type=NATIVE_AOS`
- `use_callback_feature=true` → `ThreatReceiver.kt`
- `app_signing=registered_key` → keystore `com.miftah.siap` terdaftar di console
- Region Indonesia: `url=https://jakarta-api.appsealing.com/covault/gw`
