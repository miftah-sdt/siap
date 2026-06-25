# SIAP — Sistem Informasi Asuransi Pertanian

![CI](https://github.com/miftah-sdt/siap/actions/workflows/ci.yml/badge.svg)

Aplikasi enterprise Flutter untuk manajemen asuransi pertanian dengan Clean Architecture, modular features, dan dukungan multi-platform (Android, iOS, Web).

## Fitur

| Modul | Deskripsi |
|-------|-----------|
| **Auth** | Login, logout, lupa password, JWT session |
| **Dashboard** | Ringkasan statistik & grafik registrasi/klaim |
| **Petani** | CRUD data petani + search + pagination |
| **Lahan** | CRUD lahan pertanian (koordinat map-ready) |
| **Asuransi** | Pendaftaran polis + workflow status + dokumen |
| **Klaim** | Pengajuan klaim + workflow + bukti kerusakan |
| **Laporan** | Filter & export PDF/Excel |
| **Pengguna** | CRUD user + role assignment |

## Tech Stack

- **Flutter** (Stable) · **Dart 3+**
- **State:** flutter_bloc
- **DI:** get_it
- **Network:** dio
- **Storage:** shared_preferences
- **Routing:** go_router
- **Serialization:** freezed + json_serializable
- **UI:** Material 3, flutter_screenutil, fl_chart

## Quick Start

### Prasyarat

- Flutter SDK ≥ 3.12
- Dart SDK ≥ 3.12

### Instalasi

```bash
git clone https://github.com/miftah-sdt/siap.git
cd siap
flutter pub get
dart run build_runner build
```

### Menjalankan

```bash
# Web
flutter run -d chrome

# Android
flutter run -d android

# iOS (macOS)
flutter run -d ios
```

### Konfigurasi API

Ubah base URL di `lib/core/config/env.dart`:

```dart
static const AppEnvironment current = AppEnvironment.development;
```

| Environment | Base URL |
|-------------|----------|
| development | `http://localhost:3000/v1` |
| staging / production | `https://siap-api-production.up.railway.app/v1` |

**Production (online):**

| Layanan | URL |
|---------|-----|
| API | https://siap-api-production.up.railway.app |
| Web | https://miftah-sdt.github.io/siap/ |
| APK | https://miftah-sdt.github.io/siap/downloads/siap.apk |

Repo API: https://github.com/miftah-sdt/api

### Development lokal

```bash
cd ../api
docker compose up -d
npm install
npm run dev
```

Akun demo: `admin@siap.local` / `password123`

## Struktur Proyek

```
lib/
├── core/           # Config, network, storage, theme, utils
├── injection/      # GetIt dependency injection
├── routes/         # go_router + role guard
├── shared/         # Reusable widgets & layout
├── features/       # Feature modules (auth, dashboard, ...)
└── main.dart
```

Setiap feature mengikuti Clean Architecture:

```
features/<nama>/
├── data/           # Models, datasources, repository impl
├── domain/         # Entities, repository contracts, use cases
└── presentation/   # Bloc, pages, widgets
```

Detail lengkap: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)

## Role & Akses

| Role | Akses |
|------|-------|
| Admin | Semua modul |
| Operator | Semua kecuali restricted admin-only |
| Verifikator | Petani, Lahan, Laporan, Asuransi, Klaim |
| Petani | Asuransi, Klaim |

## Testing

```bash
flutter test
flutter test --coverage
```

Detail: [docs/TESTING.md](docs/TESTING.md)

## CI/CD

Pipeline GitHub Actions (`.github/workflows/ci.yml`):

1. **Analyze & Test** — format check, `flutter analyze`, unit/bloc tests + coverage
2. **Build Web** — `flutter build web --release`
3. **Build APK** — `flutter build apk --release`

Detail: [docs/CI_CD.md](docs/CI_CD.md)

## Deploy Online

Panduan lengkap: [docs/DEPLOY.md](docs/DEPLOY.md)

**Disarankan (tanpa kartu kredit):** Neon (DB) + **Railway** (API) + GitHub Pages (Web + APK)

> Render & Koyeb sering minta kartu kredit. Jika terblokir, pakai Railway atau Belmo.

| Repo | URL |
|------|-----|
| API | https://github.com/miftah-sdt/api |
| Flutter | https://github.com/miftah-sdt/siap |

| Komponen | Platform |
|----------|----------|
| Database | [Neon](https://neon.tech) |
| API | [Railway](https://railway.com) — https://siap-api-production.up.railway.app |
| Web | https://miftah-sdt.github.io/siap/ |
| APK | https://miftah-sdt.github.io/siap/downloads/siap.apk |

Alternatif: [Render.com](docs/DEPLOY.md#alternatif-rendercom)

## Dokumentasi

| Dokumen | Isi |
|---------|-----|
| [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) | Arsitektur & pola desain |
| [docs/SETUP.md](docs/SETUP.md) | Setup development lengkap |
| [docs/TESTING.md](docs/TESTING.md) | Panduan testing |
| [docs/API.md](docs/API.md) | Referensi endpoint API |
| [docs/CI_CD.md](docs/CI_CD.md) | Pipeline CI/CD |
| [docs/DEPLOY.md](docs/DEPLOY.md) | Deploy online (API: [miftah-sdt/api](https://github.com/miftah-sdt/api)) |

## Push ke GitHub (aktifkan CI/CD)

```bash
git init
git add .
git commit -m "Initial commit: SIAP Flutter app with CI/CD"
git branch -M main
git remote add origin https://github.com/miftah-sdt/siap.git
git push -u origin main
```

Setelah push, pipeline otomatis berjalan di tab **Actions** repository GitHub.

Ganti `USERNAME` dengan username GitHub Anda, lalu update badge di `README.md`.
