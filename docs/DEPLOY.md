# Deploy SIAP (Online)

Panduan deploy **API**, **PostgreSQL**, **Web Flutter**, dan **APK** untuk testing online.

## Repositori GitHub

| Proyek | Repo |
|--------|------|
| **API** (Express + PostgreSQL) | https://github.com/miftah-sdt/api |
| **Flutter** (Web + APK) | https://github.com/miftah-sdt/siap |

Clone:
```bash
git clone https://github.com/miftah-sdt/api.git
git clone https://github.com/miftah-sdt/siap.git
```

## Pilih metode deploy

| Metode | Kartu kredit? | Cocok untuk |
|--------|---------------|-------------|
| **[Neon + Koyeb + GitHub Pages](#neon--koyeb--github-pages-gratis)** | Tidak | **Disarankan** — gratis, tanpa CC |
| [Render.com](#alternatif-rendercom) | Kadang diminta | All-in-one di satu platform |

---

## ⚠️ Error GitHub Actions: `SIAP_API_URL`

Workflow deploy butuh URL API yang sudah online.

1. Repo `siap` → **Settings** → **Secrets and variables** → **Actions**
2. **New repository secret**:

| Name | Value |
|------|--------|
| `SIAP_API_URL` | `https://YOUR-API-HOST/v1` |

3. **Actions** → **Deploy to Render** → **Run workflow**

Tanpa secret, push ke `main` tidak gagal — deploy dilewati dengan peringatan.

---

# Neon + Koyeb + GitHub Pages (Gratis)

**Tanpa kartu kredit.** Stack yang dipakai:

```
┌──────────────────────┐     HTTPS     ┌─────────────────────┐
│  GitHub Pages        │ ────────────▶ │  Koyeb              │
│  (Web + APK download)│               │  (Express API)      │
│  branch: gh-pages    │               └──────────┬──────────┘
└──────────────────────┘                          │ SSL
                                                  ▼
                                       ┌─────────────────────┐
                                       │  Neon               │
                                       │  (PostgreSQL)       │
                                       └─────────────────────┘
```

| Komponen | Platform | URL contoh |
|----------|----------|------------|
| Database | [Neon](https://neon.tech) | `postgresql://...@ep-xxx.neon.tech/neondb` |
| API | [Koyeb](https://www.koyeb.com) | `https://siap-api-USER.koyeb.app` |
| Web | GitHub Pages | `https://miftah-sdt.github.io/siap/` |
| APK | GitHub Pages | `https://miftah-sdt.github.io/siap/downloads/siap.apk` |

---

## Langkah 1 — Push repo API ke GitHub

```bash
cd d:\project_flutter\api
git init
git add .
git commit -m "SIAP API PostgreSQL"
git branch -M main
git remote add origin https://github.com/miftah-sdt/api.git
git push -u origin main
```

Ganti URL remote jika repo Anda berbeda.

---

## Langkah 2 — Database di Neon

1. Buka [neon.tech](https://neon.tech) → daftar dengan **GitHub** (gratis, tanpa CC)
2. **New Project** → nama: `siap` → region: **Singapore** (terdekat ke Indonesia)
3. Setelah dibuat, buka **Dashboard** → **Connection Details**
4. Copy **connection string** (mode **Pooled** atau **Direct** — keduanya bisa)

Contoh:
```
postgresql://neondb_owner:PASSWORD@ep-cool-name-12345678.ap-southeast-1.aws.neon.tech/neondb?sslmode=require
```

5. Simpan string ini — dipakai di Koyeb sebagai `DATABASE_URL`

### DBeaver ke Neon

| Field | Nilai |
|-------|--------|
| Host | `ep-xxxxx.ap-southeast-1.aws.neon.tech` |
| Port | `5432` |
| Database | `neondb` |
| Username / Password | dari connection string |
| SSL | **Require** (wajib) |

---

## Langkah 3 — Deploy API di Koyeb

1. Buka [koyeb.com](https://www.koyeb.com) → daftar dengan **GitHub** (gratis, tanpa CC)
2. **Create App** → **GitHub** → pilih repo **`miftah-sdt/api`**
3. **Builder**: Buildpack (auto-detect Node.js)
4. **Instance**: Free (jika tersedia di region Anda)
5. **Port**: `3000` (atau biarkan Koyeb set `PORT` otomatis — API sudah membaca `process.env.PORT`)

### Environment variables

Di Koyeb → App → **Settings** → **Environment variables**:

| Key | Value |
|-----|--------|
| `DATABASE_URL` | *(paste connection string Neon)* |
| `DATABASE_SSL` | `true` |
| `JWT_SECRET` | *(string acak panjang, min. 32 karakter)* |
| `NODE_ENV` | `production` |
| `CORS_ORIGIN` | `*` |

Setelah web online (Langkah 5), ganti `CORS_ORIGIN` ke:
```
https://miftah-sdt.github.io
```

6. **Deploy** → tunggu status **Healthy**

Catat URL API, misalnya:
```
https://siap-api-miftah.koyeb.app
```

### Verifikasi API

```bash
curl https://siap-api-miftah.koyeb.app/health
```

Harus return:
```json
{"status":"ok","service":"siap-api","database":"connected"}
```

Test login:
```bash
curl -X POST https://siap-api-miftah.koyeb.app/v1/auth/login ^
  -H "Content-Type: application/json" ^
  -d "{\"email\":\"admin@siap.local\",\"password\":\"password123\"}"
```

*(Di PowerShell gunakan backtick `` ` `` untuk line break, atau satu baris)*

**Akun demo:** `admin@siap.local` / `password123`

---

## Langkah 4 — Secret GitHub (repo Flutter)

1. Repo `miftah-sdt/siap` → **Settings** → **Secrets and variables** → **Actions**
2. **New repository secret**:

| Name | Value |
|------|--------|
| `SIAP_API_URL` | `https://siap-api-miftah.koyeb.app/v1` |

**Wajib** diakhiri `/v1` dan pakai `https://`.

---

## Langkah 5 — Deploy Web + APK (GitHub Actions)

```bash
cd d:\project_flutter\siap
git add .
git commit -m "Configure deploy"
git push origin main
```

Atau manual: **Actions** → **Deploy to Render** → **Run workflow** → isi `api_base_url` jika secret belum ada.

Workflow akan:
1. Build Flutter Web dengan `API_BASE_URL` dari secret
2. Build APK dengan URL yang sama
3. Copy APK ke `downloads/siap.apk`
4. Push ke branch **`gh-pages`**

---

## Langkah 6 — Aktifkan GitHub Pages

1. Repo `siap` → **Settings** → **Pages**
2. **Source**: Deploy from a branch
3. **Branch**: `gh-pages` → folder `/ (root)`
4. **Save**

Tunggu 1–2 menit. URL web:
```
https://miftah-sdt.github.io/siap/
```

Ganti `miftah-sdt` dengan username GitHub Anda.

### Download APK (Nox / Android)

| | URL |
|---|-----|
| Langsung | `https://miftah-sdt.github.io/siap/downloads/siap.apk` |
| Halaman download | `https://miftah-sdt.github.io/siap/downloads/` |

**Install di Nox:**
- Drag `siap.apk` ke jendela Nox, atau
- `adb connect 127.0.0.1:62001` lalu `adb install siap.apk`

---

## Langkah 7 — Update CORS di Koyeb

Setelah GitHub Pages aktif, update di Koyeb → Environment:

```
CORS_ORIGIN=https://miftah-sdt.github.io
```

Redeploy otomatis. Buka web → login dengan `admin@siap.local` / `password123`.

---

## Build lokal dengan API online

```bash
cd d:\project_flutter\siap

# Web
flutter build web --release ^
  --dart-define=API_BASE_URL=https://siap-api-miftah.koyeb.app/v1

# APK untuk Nox
flutter build apk --release ^
  --dart-define=API_BASE_URL=https://siap-api-miftah.koyeb.app/v1
```

---

## Checklist (Neon + Koyeb + GitHub Pages)

- [ ] Repo [`miftah-sdt/api`](https://github.com/miftah-sdt/api) di GitHub
- [ ] Neon project + connection string disalin
- [ ] Koyeb app deployed, `/health` → `connected`
- [ ] Login API via `curl` berhasil
- [ ] Secret `SIAP_API_URL` di repo `siap`
- [ ] Workflow deploy sukses → branch `gh-pages` ada
- [ ] GitHub Pages aktif dari branch `gh-pages`
- [ ] `CORS_ORIGIN` di Koyeb = URL GitHub Pages
- [ ] Login web & APK berhasil

---

## Troubleshooting (Neon + Koyeb)

| Masalah | Solusi |
|---------|--------|
| `database: disconnected` | Cek `DATABASE_URL` di Koyeb, pastikan `DATABASE_SSL=true` |
| API tidak bisa connect ke Neon | Gunakan connection string dengan `?sslmode=require` |
| CORS error di browser | Set `CORS_ORIGIN` ke URL GitHub Pages (tanpa slash akhir) |
| Web 404 di GitHub Pages | Pastikan branch `gh-pages` ada dan Pages mengarah ke branch itu |
| APK tidak connect ke API | Rebuild dengan `--dart-define=API_BASE_URL=.../v1` |
| Koyeb sleep / lambat | Free tier bisa cold start; buka `/health` dulu |
| Workflow gagal `SIAP_API_URL` | Set secret atau isi input saat Run workflow |

---

# Alternatif: Render.com

Gunakan jika Blueprint / Render tersedia tanpa CC di akun Anda.

## Arsitektur Render

```
┌─────────────────┐     HTTPS      ┌──────────────────┐
│  Render Static  │ ──────────────▶│  Render Web      │
│  atau gh-pages  │                │  + PostgreSQL    │
└─────────────────┘                └──────────────────┘
```

| Komponen | Platform |
|----------|----------|
| API + DB | Render Web Service + PostgreSQL (`render.yaml` di repo `api`) |
| Web | Render Static Site **atau** GitHub Pages (branch `gh-pages`) |

### Deploy API di Render (tanpa Blueprint)

Jika Blueprint minta kartu kredit, buat manual:

1. **New → PostgreSQL** → plan **Free**
2. **New → Web Service** → repo **`miftah-sdt/api`** → Instance **Free**
3. Environment: link `DATABASE_URL` dari database Render
4. `JWT_SECRET`, `CORS_ORIGIN=*`

### Deploy Web di Render

1. Jalankan workflow GitHub Actions (sama seperti Langkah 5)
2. **New → Static Site** → repo `siap` → branch **`gh-pages`**
3. Build command: *(kosong)*, Publish: `.`

### DBeaver ke Render PostgreSQL

Render Dashboard → database → **External Database URL** → SSL **require**.

---

## Catatan platform gratis

| Platform | Catatan |
|----------|---------|
| **Neon** | 0.5 GB storage, tidak expire 30 hari seperti Render free DB |
| **Koyeb** | Free tier terbatas; bisa cold start |
| **GitHub Pages** | Gratis, tidak sleep, cocok untuk web + APK |
| **Render free** | API sleep ~15 menit idle; DB free expire ~30–90 hari |

---

## Login demo (semua metode)

| Email | Password |
|-------|----------|
| admin@siap.local | password123 |
| operator@siap.local | password123 |
