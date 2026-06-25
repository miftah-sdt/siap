# Setup Development

## Prasyarat

| Tool | Versi Minimum |
|------|---------------|
| Flutter | 3.12+ (stable channel) |
| Dart | 3.12+ |
| Android Studio / VS Code | Latest |
| Git | 2.x |

Untuk build Android tambahan:
- JDK 17
- Android SDK

Untuk build iOS (macOS only):
- Xcode 15+
- CocoaPods

## Clone & Install

```bash
git clone <repository-url>
cd siap
flutter pub get
dart run build_runner build
```

## Environment

Edit `lib/core/config/env.dart`:

```dart
enum AppEnvironment { development, staging, production }

class Env {
  static const AppEnvironment current = AppEnvironment.development;
  // ...
}
```

Atau override saat build (future enhancement via `--dart-define`).

## Menjalankan Aplikasi

```bash
# Cek device
flutter devices

# Web (development)
flutter run -d chrome

# Android emulator
flutter run -d android

# Hot reload: tekan r
# Hot restart: tekan R
```

## Code Generation

Setelah mengubah model freezed atau json_serializable:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Watch mode saat development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## Analisis & Format

```bash
dart format lib test
flutter analyze
flutter test
```

## Struktur Branch (Rekomendasi)

| Branch | Purpose |
|--------|---------|
| `main` | Production-ready |
| `develop` | Integration branch |
| `feature/*` | Feature development |
| `fix/*` | Bug fixes |

## Troubleshooting

### Build runner conflict
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Pub get gagal
```bash
flutter clean
flutter pub get
```

### Web CORS error
Pastikan backend API mengizinkan origin development. Untuk local dev, gunakan proxy atau disable CORS di dev server.

### Generated files missing
Pastikan menjalankan `build_runner` setelah clone. File `*.freezed.dart` dan `*.g.dart` harus ada di repo atau di-generate lokal.
