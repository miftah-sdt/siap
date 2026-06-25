# Referensi API

Base URL dikonfigurasi di `lib/core/config/env.dart`.

Default development: `http://localhost:3000/v1`

**Production (Railway):** `https://siap-api-production.up.railway.app/v1`

| Endpoint | URL |
|----------|-----|
| Health | https://siap-api-production.up.railway.app/health |
| Login | `POST /v1/auth/login` |

Jalankan backend lokal (PostgreSQL + API):

```bash
cd d:/project_flutter/api
docker compose up -d
npm install
npm run dev
```

**Android Emulator:** gunakan `http://10.0.2.2:3000/v1` atau `adb reverse tcp:3000 tcp:3000`.

Semua response menggunakan wrapper `BaseApiResponse<T>`:

```json
{
  "success": true,
  "message": "OK",
  "data": { ... },
  "meta": {
    "page": 1,
    "per_page": 10,
    "total": 100,
    "total_pages": 10
  }
}
```

## Auth

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| POST | `/auth/login` | Login (email, password) |
| POST | `/auth/logout` | Logout |
| POST | `/auth/refresh` | Refresh JWT token |
| POST | `/auth/forgot-password` | Kirim link reset password |
| GET | `/auth/profile` | Profil user saat ini |

## Dashboard

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | `/dashboard/summary` | Total petani, lahan, polis, klaim |
| GET | `/dashboard/charts` | Data grafik bulanan |

## Petani

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | `/petani?page&limit&search` | List petani (paginated) |
| GET | `/petani/:id` | Detail petani |
| POST | `/petani` | Create petani |
| PUT | `/petani/:id` | Update petani |
| DELETE | `/petani/:id` | Delete petani |

**Body create/update:**
```json
{
  "nik": "3201010101010001",
  "nama": "Budi Santoso",
  "alamat": "Jl. Raya No. 1",
  "no_hp": "081234567890",
  "kelompok_tani": "Tani Makmur"
}
```

## Lahan

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | `/lahan?page&limit&search` | List lahan |
| GET | `/lahan/:id` | Detail lahan |
| POST | `/lahan` | Create lahan |
| PUT | `/lahan/:id` | Update lahan |
| DELETE | `/lahan/:id` | Delete lahan |

**Body:**
```json
{
  "kode_lahan": "LH-001",
  "nama_lahan": "Sawah A",
  "luas": 2.5,
  "lokasi": "Subang, Jawa Barat",
  "koordinat": "-6.123,107.456"
}
```

## Asuransi

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | `/asuransi?page&limit&search` | List polis |
| GET | `/asuransi/:id` | Detail polis |
| POST | `/asuransi` | Pendaftaran asuransi |
| PUT | `/asuransi/:id` | Update polis |
| DELETE | `/asuransi/:id` | Hapus polis |

**Status workflow:** `draft`, `submitted`, `verified`, `approved`, `rejected`

## Klaim

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | `/klaim?page&limit&search` | List klaim |
| GET | `/klaim/:id` | Detail klaim |
| POST | `/klaim` | Pengajuan klaim |
| PUT | `/klaim/:id` | Update klaim |
| DELETE | `/klaim/:id` | Hapus klaim |

**Status workflow:** `draft`, `submitted`, `survey`, `approved`, `rejected`

## Laporan

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| POST | `/laporan/export` | Export laporan |

**Body:**
```json
{
  "type": "petani",
  "start_date": "2026-01-01",
  "end_date": "2026-06-30",
  "status": "approved",
  "format": "pdf"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "file_name": "laporan-petani.pdf",
    "download_url": "https://api.siap.local/files/..."
  }
}
```

## Pengguna

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | `/pengguna?page&limit&search` | List user |
| GET | `/pengguna/:id` | Detail user |
| POST | `/pengguna` | Create user |
| PUT | `/pengguna/:id` | Update user |
| DELETE | `/pengguna/:id` | Delete user |

**Role values:** `admin`, `operator`, `verifikator`, `petani`

## HTTP Error Codes

| Code | Handling |
|------|----------|
| 400 | Bad request — validasi gagal |
| 401 | Unauthorized — redirect login / refresh token |
| 403 | Forbidden — role tidak cukup |
| 404 | Not found |
| 422 | Validation error |
| 500 | Server error |

Handled di `NetworkExceptionHandler` → `Failure` → UI snackbar/dialog.
