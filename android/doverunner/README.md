# DoveRunner CLI (AppSealing_CI_Integration_Tool_latest)

Folder ini menyiapkan integrasi CI/CD Android sealing sesuai paket resmi **AppSealing_CI_Integration_Tool_latest** dari DoveRunner Console.

## Struktur (selaras paket resmi)

| File / folder | Asal resmi | Fungsi |
|---------------|------------|--------|
| `sealing.jar` | root paket CLI | JAR sealing (jangan commit — lihat `.gitignore`) |
| `config.txt.example` | `Document_EN/examples/config-for-native-v3.txt` + preset SIAP | Template config AppSecurity 3.x |
| `examples/` | `Document_EN/examples/` + `config.txt` | Contoh resmi native/hybrid v2 & v3 |
| `config.txt` | generated | Dibuat runtime oleh `android/scripts/doverunner-seal.sh` |

## Setup lokal

1. Unduh **AppSealing_CI_Integration_Tool_latest** dari [DoveRunner Console](https://console.doverunner.com) → Organization → Third party → CLI Tool for Android AppSealing
2. Salin `sealing.jar` ke folder ini
3. Catat **CLI Key** (`CLI Key.txt` di paket) → export sebagai `DOVERUNNER_AUTH_KEY`
4. Jalankan seal via script (lihat `docs/ANDROID_DOVERUNNER_CI.md`)

Perintah resmi (setara script):

```bash
java -jar sealing.jar -config ./config.txt
```

## SIAP (Flutter)

- `service_type=NATIVE_AOS`
- `use_callback_feature=true` → `ThreatReceiver.kt`
- `app_signing=registered_key` → keystore `com.miftah.siap` terdaftar di console
- Region Indonesia: `url=https://jakarta-api.appsealing.com/covault/gw`
