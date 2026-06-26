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

## URL Production (aktif)

| Layanan | URL |
|---------|-----|
| **API** | https://siap-api-production.up.railway.app |
| **API base** (`/v1`) | https://siap-api-production.up.railway.app/v1 |
| **Health** | https://siap-api-production.up.railway.app/health |
| **Web** | https://miftah-sdt.github.io/siap/ |
| **APK** | https://miftah-sdt.github.io/siap/downloads/siap.apk |

GitHub secret `SIAP_API_URL`:
```
https://siap-api-production.up.railway.app/v1
```

## Pilih metode deploy

| Metode | Kartu kredit? | Cocok untuk |
|--------|---------------|-------------|
| **[Neon + Railway + GitHub Pages](#neon--railway--github-pages)** | **Tidak** | **Paling disarankan** jika Render/Koyeb minta CC |
| [Neon + Belmo + GitHub Pages](#neon--belmo--github-pages) | Tidak | 1 service gratis selamanya, no sleep |
| [Neon + Render + GitHub Pages](#neon--render--github-pages) | **Sering diminta** | Lewati jika muncul "Add Card" |
| [Neon + Koyeb + GitHub Pages](#neon--koyeb--github-pages) | **Sering diminta** | Lewati jika Pro $29 |

### ⚠️ Render / Koyeb minta kartu kredit?

| Platform | Gejala | Tindakan |
|----------|--------|----------|
| **Koyeb** | "Verify credit card" / Pro $29 | Jangan lanjutkan |
| **Render** | Modal **"Add Card"** / card declined | Tutup modal — pakai **Railway** atau **Belmo** |

Render & Koyeb sekarang sering **wajibkan CC** meski pilih plan Free (verifikasi anti-fraud).

**Solusi tanpa CC → [Neon + Railway](#neon--railway--github-pages)** atau **[Neon + Belmo](#neon--belmo--github-pages)**.

---

## ⚠️ Error GitHub Actions: `SIAP_API_URL`

Workflow deploy butuh URL API yang sudah online.

1. Repo `siap` → **Settings** → **Secrets and variables** → **Actions**
2. **New repository secret**:

| Name | Value |
|------|--------|
| `SIAP_API_URL` | `https://siap-api-production.up.railway.app/v1` |

3. **Actions** → **Deploy to Render** → **Run workflow**

Tanpa secret, push ke `main` tidak gagal — deploy dilewati dengan peringatan.

---

# Neon + Railway + GitHub Pages

**Tanpa kartu kredit** — gunakan ini jika Render/Koyeb memblokir.

```
GitHub Pages (web+APK) → Railway (API) → Neon (PostgreSQL)
```

| Komponen | Platform |
|----------|----------|
| Database | [Neon](https://neon.tech) |
| API | [Railway](https://railway.com) — trial **$5 credit**, tanpa CC |
| Web + APK | GitHub Pages |

## Langkah A1 — Neon (database)

Sama seperti [Langkah 2](#langkah-2--database-di-neon) — copy `DATABASE_URL`.

## Langkah A2 — Deploy API di Railway

1. Buka [railway.com](https://railway.com) → **Login with GitHub**
2. **New Project** → **Deploy from GitHub repo**
3. Pilih repo **`miftah-sdt/api`**
4. Tambah **PostgreSQL** di project yang sama (atau pakai Neon)

### Environment variables (`siap-api`)

Klik service **`siap-api`** → **Variables**:

| Key | Value |
|-----|--------|
| `DATABASE_URL` | `${{siap-db.DATABASE_URL}}` *(reference ke PostgreSQL Railway)* |
| `JWT_SECRET` | *(string acak min. 32 karakter)* |
| `NODE_ENV` | `production` |
| `CORS_ORIGIN` | `*` |

> **Jangan set `DATABASE_SSL=true`** jika pakai PostgreSQL Railway (`railway.internal`) — bisa gagal koneksi & healthcheck.

Cara set reference: **Add Variable** → **Add Reference** → pilih **`siap-db`** → `DATABASE_URL`.

### Healthcheck

File `railway.toml` di repo API mengarahkan healthcheck ke `/health`. Jika masih gagal, di Railway → **siap-api** → **Settings** → **Healthcheck Path** = `/health`.

### Public URL

1. Service → **Settings** → **Networking** → **Generate Domain**
2. Dapat URL: `https://siap-api-production.up.railway.app`

### Verifikasi

```bash
curl https://siap-api-production.up.railway.app/health
```

**Secret GitHub** (`SIAP_API_URL`):
```
https://siap-api-production.up.railway.app/v1
```

> Railway trial: $5 credit (~30 hari). Setelah habis, service pause — cukup untuk demo/testing. Untuk jangka panjang tanpa CC, lihat [Belmo](#neon--belmo--github-pages).

Lanjut [Langkah 4–7](#langkah-4--secret-github-repo-flutter) (secret, workflow, Pages).

---

# Neon + Belmo + GitHub Pages

Alternatif jika Railway credit habis — **1 service gratis selamanya**, tanpa CC, tidak sleep.

1. [belmo.io](https://belmo.io) → daftar GitHub (no CC)
2. Install Belmo GitHub App → pilih repo **`miftah-sdt/api`**
3. Set environment variables (sama seperti Railway)
4. Deploy → dapat URL `https://xxx.belmo.app`
5. `SIAP_API_URL` = `https://xxx.belmo.app/v1`

---

# Neon + Render + GitHub Pages

> **Lewati** jika muncul modal **"Add Card"**. Pakai [Railway](#neon--railway--github-pages) sebagai gantinya.

**Tanpa kartu kredit** — hanya jika Render tidak meminta CC di akun Anda.

```
┌──────────────────────┐     HTTPS     ┌─────────────────────┐
│  GitHub Pages        │ ────────────▶ │  Render Web Service │
│  (Web + APK)         │               │  (Express API)      │
│  branch: gh-pages    │               └──────────┬──────────┘
└──────────────────────┘                          │ SSL
                                                  ▼
                                       ┌─────────────────────┐
                                       │  Neon (PostgreSQL)  │
                                       └─────────────────────┘
```

| Komponen | Platform |
|----------|----------|
| Database | [Neon](https://neon.tech) — gratis, tanpa CC |
| API | [Render](https://render.com) Web Service — plan **Free** |
| Web + APK | GitHub Pages |

Ikuti **Langkah 1–2** (push API + Neon) di bawah, lalu:

## Langkah 3A — Deploy API di Render (tanpa Blueprint)

> **Jangan pakai Blueprint** jika diminta kartu kredit. Buat manual:

1. [dashboard.render.com](https://dashboard.render.com) → login GitHub
2. **New +** → **Web Service** (bukan Blueprint)
3. Connect repo **`miftah-sdt/api`**
4. Setting:

| Field | Value |
|-------|--------|
| **Name** | `siap-api` |
| **Region** | Singapore |
| **Branch** | `main` |
| **Runtime** | Node |
| **Build Command** | `npm install` |
| **Start Command** | `npm start` |
| **Instance Type** | **Free** |

5. **Environment Variables**:

| Key | Value |
|-----|--------|
| `DATABASE_URL` | *(connection string dari Neon)* |
| `DATABASE_SSL` | `true` |
| `JWT_SECRET` | *(string acak min. 32 karakter)* |
| `NODE_ENV` | `production` |
| `CORS_ORIGIN` | `*` |

6. **Create Web Service** → tunggu **Live**

URL API contoh: `https://siap-api.onrender.com`

### Verifikasi

```bash
curl https://siap-api.onrender.com/health
```

Lanjut **Langkah 4–7** di bawah (secret GitHub, workflow, Pages, CORS).

**Catatan Render Free:** API sleep setelah ~15 menit idle; request pertama bisa lambat 30–60 detik.

---

# Neon + Koyeb + GitHub Pages

> **Perhatian:** Koyeb bisa meminta kartu kredit (Pro $29 pre-auth). Jika muncul layar pembayaran, gunakan **[Neon + Render](#neon--render--github-pages-gratis)** di atas.

Stack (jika Koyeb tidak minta CC):

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

## Langkah 3 — Deploy API di Koyeb *(opsional)*

> Lewati bagian ini jika diminta kartu kredit — pakai [Render Langkah 3A](#langkah-3a--deploy-api-di-render-tanpa-blueprint).

1. Buka [koyeb.com](https://www.koyeb.com) → daftar dengan **GitHub**
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

> **Penting:** GitHub Pages project site (`username.github.io/siap/`) wajib build dengan `--base-href "/siap/"`. Workflow deploy sudah menyertakan flag ini. Jika halaman putih + error 404 `flutter_bootstrap.js` di root, jalankan ulang workflow deploy.

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

# Web (GitHub Pages project site)
flutter build web --release ^
  --base-href "/siap/" ^
  --dart-define=API_BASE_URL=https://siap-api-production.up.railway.app/v1

# APK untuk Nox
flutter build apk --release ^
  --dart-define=API_BASE_URL=https://siap-api-production.up.railway.app/v1
```

---

## Checklist deploy

- [ ] Repo [`miftah-sdt/api`](https://github.com/miftah-sdt/api) di GitHub
- [ ] Neon project + `DATABASE_URL` disalin
- [ ] API online (Render Free **atau** Koyeb) → `/health` = `connected`
- [ ] Secret `SIAP_API_URL` = `https://siap-api-production.up.railway.app/v1` di repo `siap`
- [ ] Workflow deploy sukses → branch `gh-pages`
- [ ] GitHub Pages aktif
- [ ] `CORS_ORIGIN` = URL GitHub Pages
- [ ] Login web & APK: `admin@siap.local` / `password123`

### Checklist (Neon + Koyeb — jika Koyeb tidak minta CC)

---

## Troubleshooting (Railway)

| Masalah | Solusi |
|---------|--------|
| **Healthcheck failure** | Set Healthcheck Path = `/health`; hapus `DATABASE_SSL`; pastikan `DATABASE_URL` = `${{siap-db.DATABASE_URL}}` |
| **Failed to start server** | Buka **Deploy Logs** — biasanya DB tidak terhubung |
| `database: disconnected` | Jangan pakai `DATABASE_SSL=true` untuk Railway internal DB |
| Build OK tapi crash | Push ulang setelah update `railway.toml` di repo API |

## Troubleshooting (Neon + Koyeb)

| Masalah | Solusi |
|---------|--------|
| `database: disconnected` | Cek `DATABASE_URL` di Koyeb, pastikan `DATABASE_SSL=true` |
| API tidak bisa connect ke Neon | Gunakan connection string dengan `?sslmode=require` |
| CORS error di browser | Set `CORS_ORIGIN` ke URL GitHub Pages (tanpa slash akhir) |
| Web halaman putih / 404 `flutter_bootstrap.js` di root | Jalankan **Actions → Deploy GitHub Pages Only**; pastikan `index.html` punya `base href="/siap/"` |
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
