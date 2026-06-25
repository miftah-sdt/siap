# Deploy SIAP ke Render.com

Panduan deploy **API + PostgreSQL**, **Web**, dan **APK** (download via web).

## Ringkasan arsitektur

```
┌─────────────────┐     HTTPS      ┌──────────────────┐
│  siap-web       │ ──────────────▶│  siap-api        │
│  (Render Static)│                │  (Render Web)    │
│  gh-pages branch│                │  + PostgreSQL    │
└─────────────────┘                └──────────────────┘
        │
        └── /downloads/siap.apk  (APK untuk Nox/Android)
```

| Komponen | Platform | URL contoh |
|----------|----------|------------|
| API | Render Web Service | `https://siap-api.onrender.com` |
| Database | Render PostgreSQL | (internal, via `DATABASE_URL`) |
| Web | Render Static Site | `https://siap-web.onrender.com` |
| APK | File di static site | `https://siap-web.onrender.com/downloads/siap.apk` |

---

## Bagian 1 — Deploy API + PostgreSQL

### 1.1 Push repo API ke GitHub

Jika belum ada repo terpisah:

```bash
cd d:\project_flutter\api
git init
git add .
git commit -m "SIAP API with PostgreSQL"
git remote add origin https://github.com/miftah-sdt/siap-api.git
git push -u origin main
```

### 1.2 Deploy via Blueprint

1. Buka [Render Dashboard](https://dashboard.render.com/)
2. **New +** → **Blueprint**
3. Connect repo `siap-api`
4. Render membaca `render.yaml` dan membuat:
   - PostgreSQL `siap-db`
   - Web Service `siap-api`
5. Klik **Apply**

Tunggu deploy selesai. Catat URL API, misalnya:
`https://siap-api.onrender.com`

### 1.3 Verifikasi API

```bash
curl https://siap-api.onrender.com/health
```

Harus return `"database": "connected"`.

Test login:
```bash
curl -X POST https://siap-api.onrender.com/v1/auth/login \
  -H "Content-Type: application/json" \
  -d "{\"email\":\"admin@siap.local\",\"password\":\"password123\"}"
```

### 1.4 Update CORS (setelah web online)

Di Render → `siap-api` → **Environment**:

```
CORS_ORIGIN=https://siap-web.onrender.com
```

Bisa beberapa origin dipisah koma.

---

## Bagian 2 — Deploy Web + APK

Web & APK di-build oleh **GitHub Actions**, lalu di-publish ke branch `gh-pages`. Render Static Site membaca branch itu.

### 2.1 Set secret di repo Flutter (`siap`)

GitHub → repo `miftah-sdt/siap` → **Settings** → **Secrets and variables** → **Actions** → **New repository secret**:

| Name | Value |
|------|--------|
| `SIAP_API_URL` | `https://siap-api.onrender.com/v1` |

*(Ganti dengan URL API Anda yang sebenarnya, harus diakhiri `/v1`)*

### 2.2 Trigger deploy

Push ke branch `main`:

```bash
cd d:\project_flutter\siap
git push origin main
```

Atau manual: **Actions** → **Deploy to Render** → **Run workflow** → isi `api_base_url`.

Workflow akan:
1. Build Flutter Web dengan API URL production
2. Build APK dengan API URL yang sama
3. Copy APK ke `downloads/siap.apk`
4. Deploy ke branch `gh-pages`

### 2.3 Buat Static Site di Render

1. **New +** → **Static Site**
2. Connect repo `miftah-sdt/siap`
3. Setting:

| Field | Value |
|-------|--------|
| **Name** | `siap-web` |
| **Branch** | `gh-pages` |
| **Root Directory** | *(kosong)* |
| **Build Command** | *(kosong)* |
| **Publish Directory** | `.` |

4. **Create Static Site**

URL web: `https://siap-web.onrender.com`

### 2.4 Download APK

| Cara | URL |
|------|-----|
| Langsung | `https://siap-web.onrender.com/downloads/siap.apk` |
| Halaman download | `https://siap-web.onrender.com/downloads/` |

Install di **Nox**: drag `siap.apk` ke emulator, atau:
```bash
adb connect 127.0.0.1:62001
adb install siap.apk
```

---

## Bagian 3 — Remote database di DBeaver (Render)

1. Render Dashboard → **siap-db** → tab **Info**
2. Copy **External Database URL** (bukan Internal, agar bisa dari PC Anda)
3. DBeaver → PostgreSQL:

| Field | Dari URL Render |
|-------|-----------------|
| Host | `dpg-xxxxx.singapore-postgres.render.com` |
| Port | `5432` |
| Database | `siap` |
| Username / Password | dari URL |

4. Tab **SSL**: aktifkan **Use SSL** (mode `require`)

---

## Build lokal dengan API online

```bash
# Web
flutter build web --release --dart-define=API_BASE_URL=https://siap-api.onrender.com/v1

# APK untuk Nox
flutter build apk --release --dart-define=API_BASE_URL=https://siap-api.onrender.com/v1
```

---

## Catatan Render Free Tier

| Item | Perilaku |
|------|----------|
| Web Service | Sleep setelah ~15 menit tanpa traffic; request pertama lambat (~30–60 dtk) |
| PostgreSQL | 1 GB storage, expires 90 hari (free) — upgrade untuk production |
| Static Site | Tidak sleep, cocok untuk web + APK |

---

## Troubleshooting

| Masalah | Solusi |
|---------|--------|
| Web tidak bisa login | Cek `SIAP_API_URL` secret, pastikan API `/health` OK |
| CORS error di browser | Set `CORS_ORIGIN` di API ke URL web Render |
| APK tidak connect | Rebuild APK dengan `--dart-define=API_BASE_URL=...` |
| DB disconnected di Render | Cek `DATABASE_URL` ter-link ke database di Environment |
| gh-pages kosong | Jalankan workflow Deploy to Render dulu |

---

## Checklist deploy

- [ ] API repo di GitHub + Blueprint Render applied
- [ ] `/health` return `connected`
- [ ] Secret `SIAP_API_URL` di repo siap
- [ ] Workflow Deploy to Render sukses → branch `gh-pages` ada
- [ ] Static Site `siap-web` connect ke `gh-pages`
- [ ] `CORS_ORIGIN` di API = URL web
- [ ] Login web & APK dengan `admin@siap.local` / `password123`
