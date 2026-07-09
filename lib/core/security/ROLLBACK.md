# Rollback — AppSealing Threat Reporting

Fitur ini **nonaktif secara default**. Aktifkan hanya saat diperlukan.

## Opsi 1 — Matikan tanpa hapus kode (disarankan)

### Flutter
```bash
# Default sudah false; pastikan tidak ada dart-define aktif:
flutter run
# atau eksplisit:
flutter run --dart-define=ENABLE_THREAT_REPORTING=false
```

### API
```env
ENABLE_THREAT_REPORTING=false
```
Restart server API.

## Opsi 2 — Hapus integrasi sepenuhnya

1. Hapus folder `siap/lib/core/security/`
2. Hapus folder `siap/android/app/src/main/kotlin/com/example/siap/security/`
3. Kembalikan `MainActivity.kt` ke:
   ```kotlin
   class MainActivity : FlutterActivity()
   ```
4. Hapus pemanggilan `bootstrapThreatReportingIfEnabled()` di `main.dart`
5. Hapus blok `// --- AppSealing threat reporting ---` di `dependency_injection.dart`
6. Hapus `securityThreats` di `api_endpoint.dart`
7. Hapus `enableThreatReporting` di `env.dart` dan `app_config.dart`
8. API: hapus `security.routes.js`, `auth-optional.js`, `threat-report.repository.js`
9. Hapus baris `router.use('/security', ...)` di `api/src/routes/index.js`
10. (Opsional) `DROP TABLE security_threat_reports;`

## Opsi 3 — Git revert

Jika sudah di-commit sebagai satu commit terpisah:
```bash
git revert <commit-hash>
```

## Aktifkan fitur

```bash
# Flutter
flutter run --dart-define=ENABLE_THREAT_REPORTING=true

# API (.env)
ENABLE_THREAT_REPORTING=true
```

Jalankan migrasi `api/migrations/005_security_threat_reports.sql` sebelum production.

## DoveRunner Threat Detection Callback (Android)

Integrasi mengikuti `Threat_Detection_Callback_Integration_Guide_Android_v1.0_EN` dan sample `BroadcastSampleAppF.zip`:

- Broadcast action: `com.doverunner.aos.security.action.THREAT_DISCOVERED`
- Permission: `com.doverunner.aos.security.permission.RECEIVE_ALERTS`
- Receiver: `android/.../security/ThreatReceiver.kt`
- Mapping kode: `DoveRunnerThreatCatalog.kt` (D10001, D11001, dst.)

Saat sealing di DoveRunner Console, aktifkan opsi:
**Use callback for threat handling instead of app termination** (Monitoring Mode).

Uji di device sealed:
```bash
adb logcat | grep ThreatTracker
```

## Webhook DoveRunner (server-side)

Endpoint webhook ada di repo `api` (bukan Flutter):

```
POST /v1/security/webhooks/doverunner
```

Panduan lengkap: `api/docs/DOVERUNNER_WEBHOOK.md`
