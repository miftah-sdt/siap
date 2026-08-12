# CI/CD Pipeline

## Overview

Pipeline GitHub Actions didefinisikan di `.github/workflows/ci.yml`.

```
Push/PR → main, develop
    │
    ├─► Analyze & Test (parallel gate)
    │       ├── dart format check
    │       ├── flutter analyze
    │       └── flutter test --coverage
    │
    ├─► Build Web (after tests pass)
    │       └── flutter build web --release
    │
    └─► Build APK (after tests pass)
            └── flutter build apk --release
```

## Trigger

| Event | Branch |
|-------|--------|
| `push` | `main`, `develop` |
| `pull_request` | `main`, `develop` |

Concurrency group mencegah pipeline duplikat pada branch yang sama.

## Jobs

### 1. Analyze & Test

- **Runner:** `ubuntu-latest`
- **Timeout:** 20 menit
- **Steps:**
  1. Checkout code
  2. Setup Flutter stable (cached)
  3. `flutter pub get`
  4. `dart format --set-exit-if-changed` — gagal jika ada file belum diformat
  5. `flutter analyze` — zero errors required
  6. `flutter test --coverage`
  7. Upload `coverage/lcov.info` sebagai artifact

### 2. Build Web

- **Depends on:** Analyze & Test
- **Output:** `build/web/` → artifact `web-build`

### 3. Build APK

- **Depends on:** Analyze & Test
- **Requires:** JDK 17
- **Output:** `app-release.apk` → artifact `release-apk`

## Artifacts

| Name | Isi | Retention |
|------|-----|-----------|
| `coverage-lcov` | LCOV coverage report | Default GitHub retention |
| `web-build` | Production web build | Default |
| `release-apk` | Android APK release | Default |

Download artifacts dari tab **Actions** → run → **Artifacts**.

## Menjalankan Lokal (Simulasi CI)

```bash
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test --coverage
flutter build web --release
flutter build apk --release
```

## Branch Protection (Rekomendasi)

Konfigurasi di GitHub repository settings:

- Require status check: **Analyze & Test**
- Require PR review before merge
- Require branch up to date

## Deployment (Manual / Future)

Pipeline saat ini **build-only**. Workflow tambahan:

| Workflow | Platform | Trigger |
|----------|----------|---------|
| `ci.yml` | Web + APK biasa | Push/PR |
| `build-android-sealed.yml` | Android ter-seal DoveRunner | Manual |
| `build-ios-sealed.yml` | iOS ter-seal DoveRunner | Manual |
| `deploy-pages.yml` | Flutter Web | Push main |

Panduan DoveRunner:

| Platform | Dokumentasi |
|----------|-------------|
| Android (sealed APK) | [docs/ANDROID_DOVERUNNER_CI.md](ANDROID_DOVERUNNER_CI.md) |
| Android + iOS CI/CD (Word) | [docs/cicd-doverunner/SIAP-DoveRunner-CICD-GitHub.docx](cicd-doverunner/SIAP-DoveRunner-CICD-GitHub.docx) |
| iOS checklist CI/CD | [docs/cicd-doverunner/IOS_CI.md](cicd-doverunner/IOS_CI.md) |
| iOS (sealed IPA) | [docs/IOS_DOVERUNNER_CI.md](IOS_DOVERUNNER_CI.md) |
| iOS signing dari Windows | [docs/IOS_SIGNING_WINDOWS.md](IOS_SIGNING_WINDOWS.md) |

Untuk deployment:

| Target | Opsi |
|--------|------|
| Web | Upload `web-build` ke Firebase Hosting / Nginx / GitHub Pages |
| Android sealed | Artifact dari `build-android-sealed.yml` → Play Internal / sideload |
| Android unsealed | Artifact `release-apk` dari `ci.yml` |
| iOS sealed | Artifact dari `build-ios-sealed.yml` + TestFlight |

Contoh tambahan deploy web (future):

```yaml
deploy-web:
  needs: build-web
  runs-on: ubuntu-latest
  if: github.ref == 'refs/heads/main'
  steps:
    - uses: actions/download-artifact@v5
      with:
        name: web-build
        path: build/web
    # ... deploy step
```

## Troubleshooting CI

| Error | Solusi |
|-------|--------|
| Format check failed | Jalankan `dart format lib test` lokal |
| Analyze failed | Fix errors dari `flutter analyze` |
| Test failed | Jalankan `flutter test` lokal |
| APK build failed | Pastikan `android/` config valid, JDK 17 |
