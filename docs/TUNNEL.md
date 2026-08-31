# Cek URL Cloudflare Tunnel — SIAP API

Container `siap-tunnel` di server (`apps-server`, `/opt/siap/api`) adalah **quick tunnel** Cloudflare. URL-nya `https://….trycloudflare.com` — **acak**, dan **berganti setiap kali tunnel di-restart**. Jangan andalkan URL lama di dokumen atau Postman.

Panduan yang sama ada di repo API: [miftah-sdt/api TUNNEL.md](https://github.com/miftah-sdt/api/blob/main/TUNNEL.md).

Di `docker ps`, tunnel **tidak punya PORTS**. Itu normal: cloudflared keluar ke Cloudflare, bukan membuka port di host.

```
siap-api      0.0.0.0:3000->3000/tcp     ← API lokal
siap-tunnel   (tanpa port)               ← URL publik ada di log
```

---

## 1. Ambil URL dari log

SSH ke server:

```bash
cd /opt/siap/api
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' | grep -E 'siap-(api|tunnel)'
```

**Perintah utama:**

```bash
docker logs siap-tunnel 2>&1 | grep trycloudflare.com
```

Hanya URL terakhir:

```bash
docker logs siap-tunnel 2>&1 \
  | grep -oE 'https://[a-z0-9-]+\.trycloudflare.com' \
  | tail -1
```

Simpan ke variabel:

```bash
TUNNEL=$(docker logs siap-tunnel 2>&1 \
  | grep -oE 'https://[a-z0-9-]+\.trycloudflare.com' \
  | tail -1)
echo "API    : $TUNNEL"
echo "Health : $TUNNEL/health"
echo "Base v1: $TUNNEL/v1"
```

Ikuti log live (Ctrl+C untuk berhenti):

```bash
docker logs -f siap-tunnel
```

---

## 2. Uji URL

Lokal di server (tanpa tunnel):

```bash
curl -sS http://127.0.0.1:3000/health
```

Lewat tunnel:

```bash
curl -sS "$TUNNEL/health"
```

Respons sehat:

```json
{"status":"ok","service":"siap-api","database":"connected"}
```

| Path | Artinya |
|------|---------|
| `/health` | Healthcheck (tanpa `/v1`) |
| `/v1` | Base URL Flutter / Postman / secret `SIAP_API_URL` |
| `/v1/auth/login` | Login |

Kalau lokal 200 tapi `$TUNNEL/health` gagal → masalah di tunnel/network, bukan di API.

---

## 3. Setelah URL ketemu

Pakai **URL yang baru diambil**, bukan yang tertulis di dokumen lama.

| Tempat | Nilai |
|--------|--------|
| Browser / curl | `https://….trycloudflare.com/health` |
| Flutter, Postman, GitHub secret `SIAP_API_URL` | `https://….trycloudflare.com/v1` |

```bash
flutter run --dart-define=API_BASE_URL=https://….trycloudflare.com/v1
```

---

## 4. Troubleshooting

### Log kosong / tidak ada `trycloudflare.com`

```bash
docker restart siap-tunnel
sleep 8
docker logs siap-tunnel 2>&1 | grep trycloudflare.com
```

Restart **mengganti URL**. Update Flutter / secret / Postman.

### `Unable to reach the origin` / `dial tcp 172.x.x.x:3000: connection refused`

cloudflared sudah **mengunci IP lama** hostname `api`. Setelah `siap-api` di-recreate, IP berganti; tunnel yang sudah lama jalan masih men-dial IP lama.

```bash
curl -sS http://127.0.0.1:3000/health
cd /opt/siap/api
docker compose up -d --force-recreate tunnel
sleep 8
docker logs siap-tunnel 2>&1 | grep trycloudflare.com
```

Restart **mengganti** URL `*.trycloudflare.com`. Update Flutter / Postman / secret `SIAP_API_URL`.

### `lookup api ... server misbehaving`

Tunnel tidak satu Docker network dengan `siap-api`.

```bash
docker inspect siap-api --format '{{range $k,$v := .NetworkSettings.Networks}}{{$k}} {{end}}'
docker inspect siap-tunnel --format '{{range $k,$v := .NetworkSettings.Networks}}{{$k}} {{end}}'
docker network connect api_default siap-tunnel
docker restart siap-tunnel
```

Atau recreate lewat compose (URL baru):

```bash
cd /opt/siap/api
docker stop siap-tunnel && docker rm siap-tunnel
docker compose up -d tunnel
docker logs siap-tunnel 2>&1 | grep trycloudflare.com
```

### `siap-api` tidak jalan

Tunnel mengarah ke `http://api:3000`. Kalau API down, URL tunnel tetap ada tapi `/health` gagal.

```bash
docker logs siap-api --tail 80
cd /opt/siap/api && docker compose up -d api
```

---

## 5. Ringkas (copy-paste)

```bash
docker logs siap-tunnel 2>&1 | grep -oE 'https://[a-z0-9-]+\.trycloudflare.com' | tail -1

curl -sS http://127.0.0.1:3000/health
curl -sS "$(docker logs siap-tunnel 2>&1 | grep -oE 'https://[a-z0-9-]+\.trycloudflare.com' | tail -1)/health"
```
