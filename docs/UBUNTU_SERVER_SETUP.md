# Setup Ubuntu Server 26.04 LTS — SIAP (Docker, PostgreSQL, Flutter, SSL)

Panduan ini menjelaskan cara menyiapkan **Ubuntu Server 26.04 LTS (Resolute Raccoon)** sebagai server kantor untuk menjalankan:

| Komponen | Teknologi | Virtual domain |
|----------|-----------|----------------|
| **Backend (BE)** | Node.js Express + PostgreSQL | `https://api.siap.local` |
| **Frontend (FE)** | Flutter Web (build release) | `https://siap.local` |
| **Database** | PostgreSQL 16 (Docker) | internal `localhost:5432` |
| **Reverse proxy + SSL** | Nginx + sertifikat self-signed | — |

> **Catatan:** Virtual domain `*.siap.local` hanya bisa diakses dari jaringan kantor setelah DNS lokal atau file `hosts` dikonfigurasi di setiap PC/client.

---

## Daftar isi

1. [Arsitektur](#1-arsitektur)
2. [Prasyarat server](#2-prasyarat-server)
3. [Instalasi awal Ubuntu](#3-instalasi-awal-ubuntu)
4. [Install Docker & Docker Compose](#4-install-docker--docker-compose)
5. [Install PostgreSQL (via Docker)](#5-install-postgresql-via-docker)
6. [Install Node.js](#6-install-nodejs)
7. [Install Flutter SDK (build Web & APK)](#7-install-flutter-sdk-build-web--apk)
8. [Virtual domain & SSL self-signed](#8-virtual-domain--ssl-self-signed)
9. [Deploy Backend SIAP (API)](#9-deploy-backend-siap-api)
10. [Build & deploy Frontend SIAP (Flutter Web)](#10-build--deploy-frontend-siap-flutter-web)
11. [Build APK (opsional)](#11-build-apk-opsional)
12. [Service otomatis (systemd)](#12-service-otomatis-systemd)
13. [Firewall](#13-firewall)
14. [Verifikasi end-to-end](#14-verifikasi-end-to-end)
15. [Update & redeploy](#15-update--redeploy)
16. [Troubleshooting](#16-troubleshooting)

---

## 1. Arsitektur

```
┌─────────────────────────────────────────────────────────────────┐
│  Client (browser / HP di jaringan kantor)                       │
│  hosts: siap.local → 192.168.88.100                             │
│         api.siap.local → 192.168.88.100                         │
└───────────────────────────┬─────────────────────────────────────┘
                            │ HTTPS (self-signed)
                            ▼
┌─────────────────────────────────────────────────────────────────┐
│  Ubuntu Server 26.04 LTS  (mis. 192.168.88.100)                │
│                                                                 │
│  ┌──────────────┐    ┌─────────────────────────────────────┐   │
│  │ Nginx :443   │───▶│ /var/www/siap/web  (Flutter build)  │   │
│  │ siap.local   │    └─────────────────────────────────────┘   │
│  └──────────────┘                                               │
│  ┌──────────────┐    ┌─────────────────────────────────────┐   │
│  │ Nginx :443   │───▶│ Node.js API :3000  (siap-api)       │   │
│  │ api.siap.local│   └──────────────┬──────────────────────┘   │
│  └──────────────┘                   │                           │
│                                     ▼                           │
│                          ┌─────────────────────┐               │
│                          │ Docker: PostgreSQL  │               │
│                          │ :5432 (siap-postgres)│              │
│                          └─────────────────────┘               │
└─────────────────────────────────────────────────────────────────┘
```

**Repo GitHub:**

| Proyek | URL |
|--------|-----|
| API (BE) | https://github.com/miftah-sdt/api |
| Flutter (FE) | https://github.com/miftah-sdt/siap |

---

## 2. Prasyarat server

| Item | Minimum | Disarankan |
|------|---------|------------|
| OS | Ubuntu Server **26.04 LTS** | — |
| CPU | 2 core | 4 core |
| RAM | 4 GB | 8 GB (untuk `flutter build` + Docker) |
| Disk | 40 GB | 80 GB SSD |
| Jaringan | IP statis di LAN | DHCP reservation di router |

Contoh IP server (sesuaikan jaringan Anda):

```
IP server   : 192.168.88.100
Gateway     : 192.168.88.1
Subnet      : 192.168.88.0/24
```

---

## 3. Instalasi awal Ubuntu

Login sebagai user dengan sudo, lalu:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
  curl wget git unzip zip \
  build-essential pkg-config \
  libgtk-3-dev liblzma-dev \
  nginx ufw ca-certificates gnupg lsb-release \
  openjdk-17-jdk-headless
```

Buat user deploy (opsional, disarankan):

```bash
sudo adduser siap
sudo usermod -aG sudo siap
# login ulang sebagai user siap
```

Buat struktur direktori:

```bash
sudo mkdir -p /opt/siap/{api,flutter,ssl,scripts}
sudo mkdir -p /var/www/siap/web
sudo chown -R $USER:$USER /opt/siap
```

---

## 4. Install Docker & Docker Compose

Ikuti metode resmi Docker (plugin Compose sudah termasuk):

```bash
# Hapus versi lama jika ada
sudo apt remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true

# Key & repository
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Jalankan Docker tanpa sudo
sudo usermod -aG docker $USER
newgrp docker

# Verifikasi
docker --version
docker compose version
docker run --rm hello-world
```

---

## 5. Install PostgreSQL (via Docker)

SIAP API sudah menyediakan `docker-compose.yml` untuk PostgreSQL.

```bash
cd /opt/siap
git clone git@github.com:miftah-sdt/api.git
cd api

# Jalankan PostgreSQL
docker compose up -d

# Cek status
docker compose ps
docker logs siap-postgres --tail 20
```

Konfigurasi default dari `docker-compose.yml`:

| Variabel | Nilai |
|----------|-------|
| User | `siap` |
| Password | `siap` |
| Database | `siap` |
| Port | `5432` |

Connection string:

```
postgresql://siap:siap@localhost:5432/siap
```

> **Produksi:** ganti password di `docker-compose.yml` dan `.env` API. Jangan pakai `siap/siap` di lingkungan publik.

### (Opsional) PostgreSQL native tanpa Docker

Jika ingin PostgreSQL terinstall langsung di OS:

```bash
sudo apt install -y postgresql postgresql-contrib
sudo -u postgres psql -c "CREATE USER siap WITH PASSWORD 'GANTI_PASSWORD_KUAT';"
sudo -u postgres psql -c "CREATE DATABASE siap OWNER siap;"
```

Ubah `DATABASE_URL` di `.env` API sesuai kredensial tersebut.

---

## 6. Install Node.js

API SIAP membutuhkan **Node.js ≥ 18**. Disarankan **Node.js 20 LTS**:

```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

node -v   # v20.x
npm -v
```

---

## 7. Install Flutter SDK (build Web & APK)

### 7.1 Clone Flutter stable

```bash
cd /opt/siap
git clone https://github.com/flutter/flutter.git -b stable --depth 1
echo 'export PATH="/opt/siap/flutter/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

flutter --version
flutter doctor
```

### 7.2 Dependensi build Linux (Web + Android)

```bash
sudo apt install -y \
  clang cmake ninja-build \
  libstdc++-12-dev

# Terima lisensi Android (untuk build APK)
yes | flutter doctor --android-licenses
```

### 7.3 Clone repo Flutter SIAP

```bash
cd /opt/siap
git clone https://github.com/miftah-sdt/siap.git
cd siap
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

---

## 8. Virtual domain & SSL self-signed

### 8.1 Tentukan domain virtual

| Domain | Fungsi |
|--------|--------|
| `siap.local` | Frontend Flutter Web |
| `api.siap.local` | Backend REST API |

Ganti `.local` jika kantor punya domain internal, mis. `siap.kantor.internal`.

### 8.2 DNS lokal (pilih salah satu)

**Opsi A — File hosts di setiap PC client (paling cepat)**

Di Windows (`C:\Windows\System32\drivers\etc\hosts`), Linux, atau macOS:

```
192.168.88.100  siap.local
192.168.88.100  api.siap.local
```

**Opsi B — DNS di router / Pi-hole / dnsmasq**

Tambahkan A record:

```
siap.local      → 192.168.88.100
api.siap.local  → 192.168.88.100
```

**Opsi C — hosts di server sendiri (untuk testing curl di server)**

```bash
echo "127.0.0.1 siap.local api.siap.local" | sudo tee -a /etc/hosts
```

### 8.3 Generate sertifikat SSL self-signed

```bash
sudo mkdir -p /opt/siap/ssl
cd /opt/siap/ssl

# CA + sertifikat wildcard *.siap.local (valid 825 hari)
sudo openssl req -x509 -nodes -days 825 -newkey rsa:4096 \
  -keyout siap-ca.key \
  -out siap-ca.crt \
  -subj "/C=ID/ST=Jakarta/L=Jakarta/O=Kantor/CN=SIAP Local CA"

sudo openssl req -nodes -newkey rsa:4096 \
  -keyout siap.local.key \
  -out siap.local.csr \
  -subj "/C=ID/ST=Jakarta/L=Jakarta/O=Kantor/CN=siap.local"

sudo tee siap.local.ext > /dev/null <<'EOF'
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = siap.local
DNS.2 = api.siap.local
DNS.3 = *.siap.local
IP.1 = 192.168.88.100
IP.2 = 127.0.0.1
EOF

sudo openssl x509 -req -in siap.local.csr \
  -CA siap-ca.crt -CAkey siap-ca.key -CAcreateserial \
  -out siap.local.crt -days 825 \
  -extfile siap.local.ext

sudo chmod 600 siap.local.key
sudo chmod 644 siap.local.crt siap-ca.crt
```

> Sesuaikan `IP.1` dengan IP server Anda.

### 8.4 (Disarankan) Install CA ke client agar browser tidak warning

Salin `siap-ca.crt` ke PC client, lalu:

- **Windows:** double-click → Install Certificate → Local Machine → Trusted Root Certification Authorities
- **Ubuntu desktop:** `sudo cp siap-ca.crt /usr/local/share/ca-certificates/siap-local.crt && sudo update-ca-certificates`
- **Android:** Settings → Security → Install certificate (untuk APK dengan HTTPS self-signed, lihat bagian build APK)

### 8.5 Konfigurasi Nginx

```bash
sudo tee /etc/nginx/sites-available/siap > /dev/null <<'EOF'
# Redirect HTTP → HTTPS
server {
    listen 80;
    server_name siap.local api.siap.local;
    return 301 https://$host$request_uri;
}

# Frontend — Flutter Web
server {
    listen 443 ssl http2;
    server_name siap.local;

    ssl_certificate     /opt/siap/ssl/siap.local.crt;
    ssl_certificate_key /opt/siap/ssl/siap.local.key;

    root /var/www/siap/web;
    index index.html;

    # Flutter web SPA routing
    location / {
        try_files $uri $uri/ /index.html;
    }

    # Cache static assets
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff2?)$ {
        expires 7d;
        add_header Cache-Control "public, immutable";
    }
}

# Backend — API reverse proxy
server {
    listen 443 ssl http2;
    server_name api.siap.local;

    ssl_certificate     /opt/siap/ssl/siap.local.crt;
    ssl_certificate_key /opt/siap/ssl/siap.local.key;

    client_max_body_size 20M;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

sudo ln -sf /etc/nginx/sites-available/siap /etc/nginx/sites-enabled/siap
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl enable nginx
sudo systemctl reload nginx
```

---

## 9. Deploy Backend SIAP (API)

### 9.1 Environment production

```bash
cd /opt/siap/api
cp .env.example .env
nano .env
```

Isi `.env` untuk server kantor:

```env
PORT=3000
NODE_ENV=production
DATABASE_URL=postgresql://siap:siap@localhost:5432/siap
JWT_SECRET=GANTI_DENGAN_STRING_ACAK_MIN_32_KARAKTER
JWT_ACCESS_EXPIRES=1h
JWT_REFRESH_EXPIRES=7d
CORS_ORIGIN=https://siap.local
APP_URL=https://siap.local
```

> Jangan set `DATABASE_SSL=true` untuk PostgreSQL lokal/Docker di LAN.

Generate `JWT_SECRET` acak:

```bash
openssl rand -base64 48
```

### 9.2 Install dependensi & migrasi database

```bash
cd /opt/siap/api
npm ci --omit=dev
npm run db:migrate
npm run db:seed
```

API otomatis menjalankan migrate + seed saat `npm start` (lihat `src/index.js`), tetapi menjalankan manual di atas memudahkan debugging.

### 9.3 Jalankan API (uji manual)

```bash
npm start
```

Di terminal lain:

```bash
curl http://localhost:3000/health
curl https://api.siap.local/health -k
```

Respon yang diharapkan:

```json
{"status":"ok","service":"siap-api","database":"connected"}
```

Test login:

```bash
curl -X POST https://api.siap.local/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@siap.local","password":"password123"}' \
  -k
```

**Akun demo:**

| Email | Password |
|-------|----------|
| admin@siap.local | password123 |
| operator@siap.local | password123 |

---

## 10. Build & deploy Frontend SIAP (Flutter Web)

### 10.1 Build release

```bash
cd /opt/siap/siap

flutter pub get
dart run build_runner build --delete-conflicting-outputs

flutter build web --release \
  --base-href "/" \
  --dart-define=API_BASE_URL=https://api.siap.local/v1 \
  --dart-define=ENABLE_SSL_PINNING=false
```

| Flag | Alasan |
|------|--------|
| `--base-href "/"` | Deploy di root domain `siap.local`, bukan subpath GitHub Pages |
| `API_BASE_URL=...` | Arahkan FE ke API HTTPS lokal |
| `ENABLE_SSL_PINNING=false` | Self-signed cert tidak cocok dengan SSL pinning production |

### 10.2 Deploy ke Nginx

```bash
sudo rsync -av --delete build/web/ /var/www/siap/web/
sudo chown -R www-data:www-data /var/www/siap/web
sudo systemctl reload nginx
```

### 10.3 Script deploy FE (opsional)

```bash
tee /opt/siap/scripts/deploy-fe.sh > /dev/null <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail
cd /opt/siap/siap
git pull origin main
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter build web --release \
  --base-href "/" \
  --dart-define=API_BASE_URL=https://api.siap.local/v1 \
  --dart-define=ENABLE_SSL_PINNING=false
sudo rsync -av --delete build/web/ /var/www/siap/web/
sudo chown -R www-data:www-data /var/www/siap/web
sudo systemctl reload nginx
echo "Frontend deployed → https://siap.local"
SCRIPT

chmod +x /opt/siap/scripts/deploy-fe.sh
```

---

## 11. Build APK (opsional)

Build APK di server Ubuntu (untuk distribusi internal):

```bash
cd /opt/siap/siap

flutter build apk --release \
  --dart-define=API_BASE_URL=https://api.siap.local/v1 \
  --dart-define=ENABLE_SSL_PINNING=false
```

Output:

```
build/app/outputs/flutter-apk/app-release.apk
```

Salin ke folder download Nginx (opsional):

```bash
sudo mkdir -p /var/www/siap/web/downloads
sudo cp build/app/outputs/flutter-apk/app-release.apk /var/www/siap/web/downloads/siap.apk
```

URL download: `https://siap.local/downloads/siap.apk`

> **Android + HTTPS self-signed:** instal `siap-ca.crt` di perangkat, atau gunakan HTTP API khusus dev (tidak disarankan produksi).

---

## 12. Service otomatis (systemd)

### 12.1 API sebagai systemd service

```bash
sudo tee /etc/systemd/system/siap-api.service > /dev/null <<'EOF'
[Unit]
Description=SIAP REST API
After=network.target docker.service
Wants=docker.service

[Service]
Type=simple
User=siap
WorkingDirectory=/opt/siap/api
EnvironmentFile=/opt/siap/api/.env
ExecStart=/usr/bin/node src/index.js
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable siap-api
sudo systemctl start siap-api
sudo systemctl status siap-api
```

### 12.2 PostgreSQL Docker auto-start

Docker Compose dengan `restart: unless-stopped` sudah cukup. Pastikan Docker enabled:

```bash
sudo systemctl enable docker
```

### 12.3 Perintah service berguna

```bash
# API
sudo systemctl restart siap-api
sudo journalctl -u siap-api -f

# PostgreSQL
cd /opt/siap/api && docker compose restart

# Nginx
sudo systemctl reload nginx
```

---

## 13. Firewall

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status
```

> Port `3000` dan `5432` **tidak** perlu dibuka ke luar — hanya diakses via Nginx (443) dan localhost.

---

## 14. Verifikasi end-to-end

Checklist setelah setup:

```bash
# 1. PostgreSQL
docker compose -f /opt/siap/api/docker-compose.yml ps

# 2. API lokal
curl -s http://localhost:3000/health | jq

# 3. API via HTTPS + domain
curl -sk https://api.siap.local/health | jq

# 4. Frontend
curl -skI https://siap.local | head -5

# 5. CORS (dari browser)
# Buka https://siap.local → login admin@siap.local / password123
```

| Layanan | URL |
|---------|-----|
| Web | https://siap.local |
| API | https://api.siap.local |
| API base (`/v1`) | https://api.siap.local/v1 |
| Health | https://api.siap.local/health |
| APK (jika di-deploy) | https://siap.local/downloads/siap.apk |

---

## 15. Update & redeploy

### Update API

```bash
cd /opt/siap/api
git pull origin main
npm ci --omit=dev
sudo systemctl restart siap-api
```

### Update Frontend

```bash
/opt/siap/scripts/deploy-fe.sh
```

### Backup database

```bash
docker exec siap-postgres pg_dump -U siap siap > ~/siap-backup-$(date +%F).sql
```

Restore:

```bash
cat siap-backup-2026-07-13.sql | docker exec -i siap-postgres psql -U siap -d siap
```

---

## 16. Troubleshooting

| Masalah | Penyebab umum | Solusi |
|---------|---------------|--------|
| `database: disconnected` | PostgreSQL belum jalan | `docker compose up -d` di `/opt/siap/api` |
| Browser "Your connection is not private" | Self-signed belum di-trust | Install `siap-ca.crt` di client |
| CORS error di web | `CORS_ORIGIN` salah | Set `CORS_ORIGIN=https://siap.local` di `.env`, restart API |
| Halaman putih / 404 asset | `base-href` salah | Build dengan `--base-href "/"` |
| APK tidak connect ke API | SSL pinning / cert | Build dengan `ENABLE_SSL_PINNING=false`, instal CA di HP |
| `flutter build` gagal di server | RAM kurang | Tambah swap: `sudo fallocate -l 4G /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile` |
| Nginx 502 Bad Gateway | API tidak jalan | `sudo systemctl status siap-api` |
| Domain tidak resolve | hosts/DNS belum set | Tambah entri hosts di client |
| Port 5432 bentrok | PostgreSQL native + Docker | Hentikan salah satu: `sudo systemctl stop postgresql` |

### Log penting

```bash
sudo journalctl -u siap-api -n 100 --no-pager
sudo tail -f /var/log/nginx/error.log
docker logs siap-postgres --tail 50
```

### Test koneksi DB manual

```bash
docker exec -it siap-postgres psql -U siap -d siap -c '\dt'
```

---

## Ringkasan perintah cepat

```bash
# Start semua stack
cd /opt/siap/api && docker compose up -d
sudo systemctl start siap-api
sudo systemctl start nginx

# Build & deploy FE
/opt/siap/scripts/deploy-fe.sh

# Health check
curl -sk https://api.siap.local/health
```

---

## Referensi

- [docs/DEPLOY.md](./DEPLOY.md) — deploy cloud (Neon + Railway + GitHub Pages)
- [docs/SETUP.md](./SETUP.md) — setup development lokal
- [docs/API.md](./API.md) — referensi endpoint API
- Repo API: https://github.com/miftah-sdt/api
- Repo Flutter: https://github.com/miftah-sdt/siap
