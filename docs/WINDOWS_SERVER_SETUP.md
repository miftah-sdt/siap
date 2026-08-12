# Setup Windows Server 2022 di VMware — Oracle Database & SQL Server

Panduan langkah demi langkah untuk membuat VM **Windows Server 2022** di **VMware Workstation / Player**, lalu menginstal:

| Komponen | Versi disarankan (support WS 2022) | Port default |
|----------|--------------------------------------|--------------|
| **Oracle Database** | 21c XE *(ringan)* atau 19c RU ≥19.13 / 21c RU ≥21.4 | 1521 |
| **Microsoft SQL Server** | SQL Server **2022** Developer *(dev)* atau Express *(ringan)* | 1433 |
| **SQL Server Management Studio (SSMS)** | Terbaru dari Microsoft | — |

> **Catatan RAM 8 GB:** Menjalankan Windows Server + Oracle + SQL Server sekaligus **memungkinkan untuk lab/dev**, asalkan Oracle memakai **XE** atau SGA dibatasi, dan SQL Server **max memory** dibatasi. Untuk produksi, naikkan RAM VM menjadi **16 GB+**.

---

## Daftar isi

1. [Arsitektur & alokasi resource](#1-arsitektur--alokasi-resource)
2. [Prasyarat di host (PC VMware)](#2-prasyarat-di-host-pc-vmware)
3. [Unduh ISO & installer](#3-unduh-iso--installer)
4. [Buat VM di VMware (8 GB / 4 vCPU / 100 GB SSD)](#4-buat-vm-di-vmware-8-gb--4-vcpu--100-gb-ssd)
5. [Instal Windows Server 2022](#5-instal-windows-server-2022)
6. [Konfigurasi awal setelah instal](#6-konfigurasi-awal-setelah-instal)
7. [Persiapan sebelum install database](#7-persiapan-sebelum-install-database)
8. [Install Oracle Database](#8-install-oracle-database)
9. [Install Microsoft SQL Server 2022](#9-install-microsoft-sql-server-2022)
10. [Install SSMS & tools](#10-install-ssms--tools)
11. [Firewall & koneksi dari client](#11-firewall--koneksi-dari-client)
12. [Verifikasi end-to-end](#12-verifikasi-end-to-end)
13. [Backup & snapshot VMware](#13-backup--snapshot-vmware)
14. [Troubleshooting](#14-troubleshooting)

---

## 1. Arsitektur & alokasi resource

### Spesifikasi VM (sesuai permintaan)

| Resource | Nilai VM | Catatan |
|----------|----------|---------|
| RAM | **8 GB** | Host fisik disarankan **≥ 12 GB** (sisanya untuk Windows host + VMware overhead) |
| vCPU | **4** | 2 socket × 2 core, atau 1 × 4 — cukup untuk lab |
| Disk | **100 GB SSD** | Thin provisioning OK di VMware; thick untuk performa lebih stabil |
| OS | Windows Server 2022 Standard/Datacenter | **Desktop Experience** (bukan Server Core) — installer Oracle/SQL butuh GUI |
| Jaringan | NAT atau Bridged | Bridged = IP LAN langsung; NAT = akses internet mudah |

### Alokasi memori disarankan (8 GB total)

```
Windows Server 2022 idle     ~ 2.0 – 2.5 GB
Oracle XE 21c (SGA+PGA)      ~ 2.0 GB (batas resmi XE)
SQL Server 2022 (max memory) ~ 2.0 GB (set manual)
Buffer / aplikasi            ~ 1.0 – 1.5 GB
─────────────────────────────────────────────
Total                        ~ 7.0 – 8.0 GB
```

Jika memakai **Oracle 19c/21c full edition** (bukan XE), batasi memory saat `CREATE DATABASE` atau lewat `ALTER SYSTEM` — lihat [bagian 8](#8-install-oracle-database).

### Layout disk 100 GB (disarankan)

| Partisi | Ukuran | Isi |
|---------|--------|-----|
| **C:** | 60 GB | OS, program files, pagefile |
| **D:** | 40 GB | Data Oracle (`oradata`), SQL Server (`MSSQL`), backup |

---

## 2. Prasyarat di host (PC VMware)

| Item | Minimum |
|------|---------|
| VMware Workstation 17+ / Player 17+ / ESXi 7+ | Virtualisasi Intel VT-x / AMD-V **enabled** di BIOS |
| RAM host | 12 GB (8 GB untuk VM + 4 GB host) |
| Ruang disk host | ≥ 120 GB kosong (100 GB VM + ISO + installer) |
| CPU host | 4 core fisik (hypervisor butuh headroom) |

### Aktifkan virtualisasi di BIOS

1. Restart PC → masuk BIOS/UEFI (Del / F2 / F10).
2. Enable **Intel VT-x** atau **AMD-V** dan **VT-d** (opsional).
3. Save & exit.

### Cek di Windows host

```powershell
systeminfo | findstr /i "Hyper-V"
# "A hypervisor has been detected" = OK untuk VMware nested jika diperlukan
```

---

## 3. Unduh ISO & installer

### Windows Server 2022

1. Buka [Microsoft Evaluation Center — Windows Server 2022](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022).
2. Pilih **ISO** → unduh (≈ 5 GB).
3. Evaluation: **180 hari** (bisa diperpanjang dengan `slmgr /rearm` hingga batas Microsoft).

Atau gunakan ISO dari volume license / MSDN jika sudah berlisensi.

### Oracle Database

Pilih **satu** opsi sesuai kebutuhan:

| Opsi | Unduh | Cocok untuk 8 GB? |
|------|-------|-------------------|
| **A — Oracle Database 21c XE** *(disarankan lab)* | [Oracle XE 21c for Windows x64](https://www.oracle.com/database/technologies/appdev/xe.html) | ✅ Ya (batas 2 GB RAM DB) |
| **B — Oracle Database 19c** | [Oracle 19c for Windows x64](https://www.oracle.com/database/technologies/oracle19c-windows-downloads.html) — **RU ≥ 19.13** | ⚠️ Perlu batasi memory |
| **C — Oracle Database 21c** | [Oracle 21c for Windows x64](https://www.oracle.com/database/technologies/oracle21c-windows-downloads.html) — **RU ≥ 21.4** | ⚠️ Perlu batasi memory |

> Windows Server 2022 didukung resmi Oracle mulai **19c RU 19.13+** dan **21c RU 21.4+** ([Oracle docs](https://docs.oracle.com/en/database/oracle/oracle-database/19/ntdbi/operating-system-checklist-oracle-database-installation-microsoft-windows.html)).

### Microsoft SQL Server 2022

| Komponen | URL | Lisensi |
|----------|-----|---------|
| **SQL Server 2022 Developer** | [Download SQL Server 2022](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) | Gratis (dev/test only) |
| **SQL Server 2022 Express** | Halaman yang sama | Gratis (production OK, batas 10 GB/db) |
| **SSMS** | [Download SSMS](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms) | Gratis |

SQL Server 2022 **resmi support** Windows Server 2022 ([Microsoft docs](https://learn.microsoft.com/en-us/sql/sql-server/install/hardware-and-software-requirements-for-installing-sql-server-2022)).

---

## 4. Buat VM di VMware (8 GB / 4 vCPU / 100 GB SSD)

Langkah berikut untuk **VMware Workstation Pro/Player**. ESXi: buat VM dengan parameter serupa (datastore 100 GB, guest OS Windows Server 2022).

### 4.1 Create New Virtual Machine

1. **File → New Virtual Machine** → **Custom (advanced)** → Next.
2. **Hardware compatibility:** Workstation 17.x → Next.
3. **Installer disc image file (iso):** pilih ISO Windows Server 2022 → Next.
4. **Guest OS:** Microsoft Windows → **Windows Server 2022 x64** → Next.
5. **Virtual machine name:** `WinServer2022-DB` (sesuaikan).
6. **firmware:** UEFI *(disarankan)* → Next.
7. **Processors:**
   - Number of processors: **1**
   - Number of cores per processor: **4**
   - ✅ *Optional:* centang **Virtualize Intel VT-x/EPT or AMD-V/RVI** hanya jika perlu nested VM.
8. **Memory:** **8192 MB (8 GB)** → Next.
9. **Network:** NAT *(default)* atau Bridged → Next.
10. **I/O Controller:** LSI Logic SAS (default) → Next.
11. **Disk:** **Create a new virtual disk** → Next.
12. **Disk size:** **100 GB** → ✅ **Store virtual disk as a single file** (atau split jika perlu pindah file) → Next.
13. Finish.

### 4.2 Customize Hardware (sebelum power on)

Klik **Customize Hardware…**:

| Setting | Nilai |
|---------|-------|
| **Memory** | 8192 MB |
| **Processors** | 4 cores |
| **New CD/DVD** | ISO Windows Server 2022 |
| **Network Adapter** | NAT / Bridged |
| **USB** | disconnect jika tidak perlu |
| **Display** | accelerate 3D graphics OFF (server) |

**Advanced (disk):**

- Workstation: **Independent, persistent** *(opsional, untuk snapshot konsisten)*.
- ESXi: pilih datastore SSD, **Thin** OK.

### 4.3 Opsi VMX tambahan (opsional, performa)

Tutup VMware, edit file `WinServer2022-DB.vmx`, tambahkan jika belum ada:

```ini
mainMem.useNamedFile = "FALSE"
MemTrimRate = "0"
prefvmx.useRecommendedLockedMemSize = "TRUE"
```

> `MemTrimRate=0` mengurangi ballooning memory — berguna saat Oracle/SQL sensitif terhadap paging.

---

## 5. Instal Windows Server 2022

### 5.1 Boot & setup wizard

1. **Power on** VM.
2. Tekan key jika diminta boot dari DVD.
3. **Language:** English / Indonesian → **Install Now**.
4. **Edition:** pilih **Windows Server 2022 Standard/Datacenter (Desktop Experience)** — **bukan** Server Core.
5. **License:** accept → pilih edition (Evaluation OK).
6. **Installation type:** **Custom: Install Windows only (advanced)**.
7. **Disk partitioning:**

   **Opsi sederhana (satu partisi):**

   - Pilih Unallocated 100 GB → **New** → Apply → Next.

   **Opsi disarankan (dua partisi):**

   | Partisi | Ukuran | Label |
   |---------|--------|-------|
   | System | 60000 MB | OS (C:) |
   | Primary | sisa (~40 GB) | Data (D:) |

8. Tunggu instalasi (15–30 menit, beberapa reboot).
9. **Administrator password:** buat password kuat → Finish.

### 5.2 First login

1. Login sebagai `Administrator`.
2. **Server Manager** terbuka otomatis.
3. Jika diminta **Network discovery** → **Yes** (private network).

### 5.3 Install VMware Tools

1. VM menu → **Install VMware Tools**.
2. Di guest, buka DVD → jalankan `setup64.exe`.
3. Typical install → Finish → **Restart**.

Setelah reboot, resolusi layar normal dan mouse lancar.

---

## 6. Konfigurasi awal setelah instal

### 6.1 Rename & timezone

```powershell
# PowerShell as Administrator
Rename-Computer -NewName "WS2022-DB01" -Restart
```

Setelah reboot:

```powershell
Set-TimeZone -Id "SE Asia Standard Time"   # WIB (UTC+7)
```

### 6.2 IP statis (jika Bridged / lab LAN)

```powershell
# Lihat interface
Get-NetAdapter

# Contoh: Ethernet0, IP 192.168.88.50
New-NetIPAddress -InterfaceAlias "Ethernet0" `
  -IPAddress 192.168.88.50 -PrefixLength 24 -DefaultGateway 192.168.88.1
Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" `
  -ServerAddresses 192.168.88.1,8.8.8.8
```

Ganti IP/gateway sesuai jaringan kantor.

### 6.3 Windows Update

```powershell
Install-Module PSWindowsUpdate -Force -SkipPublisherCheck
Get-WindowsUpdate -AcceptAll -Install -AutoReboot
```

Atau: **Settings → Windows Update → Check for updates** (ulangi hingga bersih).

### 6.4 Aktifkan fitur Windows

```powershell
# .NET Framework 3.5 (beberapa tool legacy)
Install-WindowsFeature NET-Framework-Core -Source D:\sources\sxs

# Containers / Hyper-V (opsional)
# Install-WindowsFeature Hyper-V -IncludeManagementTools -Restart
```

> Untuk SQL Server 2022, **.NET 4.7.2+** sudah included di WS 2022 — cukup pastikan Windows Update terbaru.

### 6.5 Pagefile (disarankan untuk DB server)

1. **System Properties → Advanced → Performance Settings → Advanced → Virtual memory**.
2. Uncheck **Automatically manage**.
3. **C:\** pagefile: **Initial 4096 MB, Maximum 8192 MB**.
4. **D:\** *(jika ada)*: optional secondary pagefile 2048–4096 MB.
5. OK → Restart.

### 6.6 Buat folder data di D:

```powershell
New-Item -ItemType Directory -Force -Path "D:\Oracle","D:\Oracle\oradata","D:\SQLData","D:\SQLLog","D:\Backup"
```

### 6.7 Nonaktifkan IE Enhanced Security (lab)

Server Manager → **Local Server** → **IE Enhanced Security Configuration** → **Off** (Administrators).

---

## 7. Persiapan sebelum install database

### 7.1 Checklist pra-instal

- [ ] Windows Update selesai, minimal 1× reboot
- [ ] VMware Tools terpasang
- [ ] Partisi D: siap
- [ ] Akun Administrator + password dokumentasi
- [ ] ISO/installer Oracle & SQL sudah di-copy ke VM (shared folder / ISO mount)

### 7.2 Copy installer ke VM

**Opsi A — Shared folder VMware:**

VM Settings → Options → Shared Folders → Always enabled → map folder host berisi installer.

Di guest:

```powershell
# Biasanya di Z: atau \\vmware-host\Shared Folders\...
Copy-Item "Z:\installers\*" -Destination "D:\Installers\" -Recurse
```

**Opsi B — Mount ISO kedua** ke CD/DVD virtual.

### 7.3 Visual C++ Redistributable

Oracle & SQL biasanya menginstal sendiri. Jika error, unduh dan instal:

- [Microsoft Visual C++ 2015–2022 Redistributable (x64)](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist)

### 7.4 Hosts file (opsional, akses mudah)

```powershell
Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -Value @"

192.168.88.50   ws2022-db01
192.168.88.50   oracle.local
192.168.88.50   mssql.local
"@
```

---

## 8. Install Oracle Database

### Opsi A — Oracle Database 21c XE *(disarankan untuk RAM 8 GB)*

#### Langkah instalasi

1. Ekstrak/ jalankan `Oracle Database 21c Express Edition.exe`.
2. Ikuti wizard:
   - **Destination folder:** `D:\Oracle\product\21c\dbhomeXE`
   - **Password SYS/SYSTEM/PDBADMIN:** catat password (mis. `OracleLab2026!`)
   - **Port:** **1521** (default)
   - **Character set:** AL32UTF8
3. Finish → tunggu database service **OracleServiceXE** running.

#### Verifikasi

```powershell
Get-Service | Where-Object { $_.Name -like "Oracle*" }

# SQL*Plus
cd "D:\Oracle\product\21c\dbhomeXE\bin"
.\sqlplus.exe system/OracleLab2026!@localhost:1521/XEPDB1
```

```sql
SELECT name, open_mode FROM v$database;
SELECT sys_context('USERENV','CON_PDB_NAME') FROM dual;
EXIT;
```

#### Listener

```powershell
lsnrctl status
# Jika down:
lsnrctl start
```

#### Batas XE (resmi)

| Limit | Nilai |
|-------|-------|
| RAM database | 2 GB |
| CPU | 2 threads |
| User data | 12 GB |

---

### Opsi B — Oracle Database 19c / 21c (Enterprise/Standard installer)

> Gunakan **Release Update ≥ 19.13** (19c) atau **≥ 21.4** (21c) agar support Windows Server 2022.

#### 8.1 Prasyarat Oracle (Windows)

1. Buat akun Windows **`oracle`** (Administrators **tidak** wajib; disarankan admin lokal):

```powershell
$pass = ConvertTo-SecureString "OracleSvc2026!" -AsPlainText -Force
New-LocalUser -Name "oracle" -Password $pass -FullName "Oracle Software Owner"
Add-LocalGroupMember -Group "Administrators" -Member "oracle"
```

2. Edit **`C:\Windows\System32\drivers\etc\hosts`** — pastikan hostname resolve:

```
127.0.0.1   WS2022-DB01
```

3. **Disable UAC** untuk instalasi *(lab only)* atau jalankan installer as Administrator:

```powershell
# Lab only — kembalikan setelah instal
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
  -Name "EnableLUA" -Value 0
Restart-Computer
```

#### 8.2 Instalasi GUI (setup.exe)

1. Login sebagai `oracle` atau Administrator.
2. Mount ZIP 19c/21c → jalankan **`setup.exe`** as Admin.
3. **Configuration:** **Server class** (single instance).
4. **Installation Type:** Enterprise/Standard atau **Custom** untuk path D:.
5. **Oracle base:** `D:\Oracle\app\oracle`
6. **Software location:** `D:\Oracle\product\19.0.0\dbhome_1`
7. **Database edition:** Enterprise / Standard / Personal (sesuai lisensi).
8. **Global database name:** `ORCL`, **SID:** `ORCL`
9. **Character set:** AL32UTF8
10. **Password:** policy Oracle → catat password SYS/SYSTEM.
11. **Create as Container database:** optional (19c+ CDB/PDB).
12. Selesai instalasi → jalankan **Database Configuration Assistant** jika perlu.

#### 8.3 Batasi memory Oracle (penting di VM 8 GB)

Setelah DB created, via SQL*Plus SYS:

```sql
ALTER SYSTEM SET memory_target=0 SCOPE=SPFILE;
ALTER SYSTEM SET memory_max_target=0 SCOPE=SPFILE;
ALTER SYSTEM SET sga_target=1500M SCOPE=SPFILE;
ALTER SYSTEM SET pga_aggregate_target=500M SCOPE=SPFILE;
ALTER SYSTEM SET processes=300 SCOPE=SPFILE;
SHUTDOWN IMMEDIATE;
STARTUP;
```

#### 8.4 Windows service Oracle

```powershell
Get-Service Oracle*
Set-Service -Name "OracleServiceORCL" -StartupType Automatic
Set-Service -Name "OracleOraDB19Home1TNSListener" -StartupType Automatic
```

*(Nama service sesuaikan versi/home.)*

---

## 9. Install Microsoft SQL Server 2022

### 9.1 Pilih edition

| Edition | RAM minimum | Cocok 8 GB VM |
|---------|-------------|---------------|
| **Developer** | 1 GB (rec. 4 GB) | ✅ Full fitur dev — **batasi max memory** |
| **Express** | 512 MB (rec. 1 GB) | ✅ Paling ringan |
| **Standard/Enterprise** | 1 GB+ | ⚠️ Perlu lisensi + batasi memory |

### 9.2 Instalasi (GUI)

1. Jalankan **`setup.exe`** dari ISO/folder SQL Server 2022.
2. **Installation → New SQL Server stand-alone installation**.
3. **Product key:** Developer (gratis) atau Express.
4. **License terms:** Accept.
5. **Global Rules / Microsoft Update:** Next (install updates disarankan).
6. **Install Setup Files / Install Rules:** fix warning jika ada (restart pending → reboot dulu).
7. **Feature Selection:**

   | Feature | Centang |
   |---------|---------|
   | Database Engine Services | ✅ |
   | Full-Text (opsional) | ☐ |
   | Integration Services (opsional) | ☐ |
   | Machine Learning (opsional, berat) | ☐ |

8. **Instance Configuration:**
   - Default instance **`MSSQLSERVER`** atau named **`SQL2022`**
   - Instance ID: default

9. **Server Configuration:**
   - **SQL Server Database Engine:** NT Service\MSSQLSERVER → **Automatic**
   - Collation: **SQL_Latin1_General_CP1_CI_AS** (default) atau sesuai kebutuhan

10. **Database Engine Configuration:**
    - **Authentication:** **Mixed Mode** *(SQL + Windows)* — disarankan lab
    - **SA password:** catat (mis. `SqlLab2026!`)
    - **Add current user** sebagai admin

11. **Data directories** — arahkan ke D::

    | Path | Folder |
    |------|--------|
    | Data root directory | `D:\SQLData` |
    | User database directory | `D:\SQLData` |
    | Log directory | `D:\SQLLog` |
    | Backup directory | `D:\Backup` |

12. **TempDB:** 4 files × 256 MB (default OK untuk lab).
13. **Max Degree of Parallelism:** 2–4 (sesuai 4 vCPU).
14. **Memory:** centang **Recommended** dulu — kita batasi manual setelah instal.
15. Install → selesai (~10–20 menit).

### 9.3 Batasi memory SQL Server (penting — Oracle + SQL di VM yang sama)

Buka **SSMS** atau **`sqlcmd`:**

```sql
-- Developer/Standard/Enterprise: batasi 2 GB untuk coexistence dengan Oracle
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'max server memory (MB)', 2048;
RECONFIGURE;
```

**Express Edition** otomatis dibatasi ~1 GB engine RAM — tidak perlu `sp_configure`.

### 9.4 Enable TCP/IP

1. **SQL Server Configuration Manager** (Start → cari).
2. **SQL Server Network Configuration → Protocols for MSSQLSERVER**.
3. Enable **TCP/IP** → Properties → IP Addresses:
   - **IPAll → TCP Port:** `1433`
   - Clear **TCP Dynamic Ports** (kosongkan).
4. Restart service **SQL Server (MSSQLSERVER)**.

```powershell
Restart-Service MSSQLSERVER
Get-Service MSSQLSERVER
```

### 9.5 Verifikasi sqlcmd

```powershell
sqlcmd -S localhost -U sa -P "SqlLab2026!" -Q "SELECT @@VERSION"
```

---

## 10. Install SSMS & tools

1. Unduh **SSMS-Setup-ENU.exe** dari Microsoft.
2. Install default path → selesai.
3. Buka **SSMS** → Connect:
   - Server: `localhost` atau `WS2022-DB01`
   - Auth: SQL Server Authentication / Windows Authentication

### Oracle SQL Developer (opsional)

- [Download SQL Developer](https://www.oracle.com/database/sqldeveloper/technologies/download/)
- Install di VM atau di PC client
- Connection: `localhost:1521/XEPDB1` (XE) atau `localhost:1521/ORCLPDB1`

---

## 11. Firewall & koneksi dari client

### 11.1 Buka port di Windows Firewall

```powershell
# Oracle Listener
New-NetFirewallRule -DisplayName "Oracle 1521" -Direction Inbound `
  -Protocol TCP -LocalPort 1521 -Action Allow

# SQL Server
New-NetFirewallRule -DisplayName "SQL Server 1433" -Direction Inbound `
  -Protocol TCP -LocalPort 1433 -Action Allow

# SQL Browser (optional, named instance)
New-NetFirewallRule -DisplayName "SQL Browser 1434 UDP" -Direction Inbound `
  -Protocol UDP -LocalPort 1434 -Action Allow
```

### 11.2 Uji dari PC lain di LAN

```powershell
# Dari client Windows
Test-NetConnection 192.168.88.50 -Port 1521
Test-NetConnection 192.168.88.50 -Port 1433
```

**SQL Server client:**

```powershell
sqlcmd -S 192.168.88.50,1433 -U sa -P "SqlLab2026!" -Q "SELECT GETDATE()"
```

**Oracle client** (butuh Oracle Instant Client di PC client):

```bash
sqlplus system/OracleLab2026!@192.168.88.50:1521/XEPDB1
```

---

## 12. Verifikasi end-to-end

### Checklist selesai

| No | Uji | Perintah / harapan |
|----|-----|-------------------|
| 1 | Windows activated / evaluation OK | `slmgr /xpr` |
| 2 | VMware Tools running | icon di tray |
| 3 | Oracle service running | `Get-Service Oracle*` → Running |
| 4 | Oracle listener | `lsnrctl status` → READY |
| 5 | SQL service running | `Get-Service MSSQLSERVER` → Running |
| 6 | SQL TCP 1433 | `Test-NetConnection localhost -Port 1433` → True |
| 7 | Oracle TCP 1521 | `Test-NetConnection localhost -Port 1521` → True |
| 8 | RAM tidak swap berlebihan | Task Manager → Memory < 90% |
| 9 | Koneksi remote | Test dari PC lain |

### Monitor resource

```powershell
# Memory
Get-Counter '\Memory\Available MBytes'

# Service status
Get-Service Oracle*,MSSQL* | Format-Table Name,Status,StartType -AutoSize
```

---

## 13. Backup & snapshot VMware

### Snapshot sebelum install DB

1. Shutdown VM (clean state).
2. VM → **Snapshot → Take Snapshot**.
3. Name: `Clean Windows Server 2022 — pre DB`.
4. ✅ Snapshot the virtual machine's memory: OFF (hemat disk).

### Snapshot setelah masing-masing DB

- `After Oracle XE installed`
- `After SQL Server 2022 installed`

### Export VM

**Workstation:** File → Export to OVF/OVA (untuk archive).

---

## 14. Troubleshooting

| Masalah | Penyebab | Solusi |
|---------|--------|--------|
| VM lambat / freeze | RAM host kurang | Tutup app host; naikkan RAM host; batasi max memory SQL & Oracle |
| Oracle installer gagal prereq | Hostname / loopback | Tambah `127.0.0.1 hostname` di `hosts`; disable UAC sementara |
| `ORA-12541: TNS:no listener` | Listener off | `lsnrctl start`; cek port 1521 firewall |
| SQL "pending restart" | Windows update pending | Reboot VM → jalankan setup lagi |
| SQL TCP connection refused | TCP/IP disabled | Enable TCP/IP di SQL Configuration Manager; restart MSSQLSERVER |
| `Login failed for user sa` | Mixed mode off | Re-run setup / enable mixed mode via SSMS |
| Disk C: penuh | Data default di C: | Pindah data Oracle/SQL ke D:; cleanup `C:\Windows\Temp` |
| Evaluation expired | 180 hari habis | `slmgr /rearm` (max 3×) atau aktivasi lisensi |
| Oracle + SQL OOM | Total RAM > 8 GB | Stop salah satu service saat tidak dipakai; atau naikkan VM RAM |
| VMware "VT-x not available" | BIOS / Hyper-V conflict | Disable Hyper-V di host: `bcdedit /set hypervisorlaunchtype off` + reboot |

### Stop/start service (hemat RAM)

```powershell
# Stop SQL saat fokus Oracle
Stop-Service MSSQLSERVER -Force

# Stop Oracle saat fokus SQL
Stop-Service OracleServiceXE -Force   # atau OracleServiceORCL
```

### Log penting

| Komponen | Lokasi log |
|----------|------------|
| SQL Server | `D:\SQLLog\ERRORLOG` atau `C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Log\` |
| Oracle alert | `D:\Oracle\diag\rdbms\...\trace\alert_*.log` |
| Windows Setup | `C:\Windows\Panther\` |

---

## Ringkasan perintah cepat

```powershell
# Status semua DB service
Get-Service Oracle*,MSSQL* | ft Name,Status -AutoSize

# Test port
Test-NetConnection localhost -Port 1521
Test-NetConnection localhost -Port 1433

# SQL quick test
sqlcmd -S localhost -U sa -P "SqlLab2026!" -Q "SELECT name FROM sys.databases"

# Oracle XE quick test (sesuaikan path & password)
& "D:\Oracle\product\21c\dbhomeXE\bin\sqlplus.exe" -S system/OracleLab2026!@localhost:1521/XEPDB1 @echo SELECT 1 FROM dual;
```

---

## Referensi resmi

| Topik | URL |
|-------|-----|
| Windows Server 2022 | [Microsoft Docs](https://learn.microsoft.com/en-us/windows-server/get-started/windows-server-2022) |
| Oracle — OS checklist Windows | [Oracle 19c docs](https://docs.oracle.com/en/database/oracle/oracle-database/19/ntdbi/operating-system-checklist-oracle-database-installation-microsoft-windows.html) |
| Oracle 21c XE | [Oracle XE download](https://www.oracle.com/database/technologies/appdev/xe.html) |
| SQL Server 2022 requirements | [Microsoft Learn](https://learn.microsoft.com/en-us/sql/sql-server/install/hardware-and-software-requirements-for-installing-sql-server-2022) |
| SQL Server install guide | [Microsoft Learn](https://learn.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server) |
| VMware Workstation docs | [Broadcom VMware](https://techdocs.broadcom.com/us/en/vmware-cis/desktop-workstation-pro/17-0.html) |

---

## Dokumen terkait di repo SIAP

| Dokumen | Isi |
|---------|-----|
| [UBUNTU_SERVER_SETUP.md](./UBUNTU_SERVER_SETUP.md) | Server Ubuntu + PostgreSQL + Docker (stack SIAP) |
| [SETUP.md](./SETUP.md) | Setup development Flutter lokal |
