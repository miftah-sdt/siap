lib/features/
├── auth/
├── dashboard/
├── petani/
├── lahan/
├── asuransi/
├── klaim/
├── laporan/
└── pengguna/

Each feature follows:
  data/ (datasources, models, repositories)
  domain/ (entities, repositories, usecases)
  presentation/ (bloc, pages, widgets)

Routes:
  /lahan, /lahan/create, /lahan/:id, /lahan/:id/edit
  /asuransi, /asuransi/create, /asuransi/:id, /asuransi/:id/edit
  /klaim, /klaim/create, /klaim/:id, /klaim/:id/edit
  /laporan
  /pengguna, /pengguna/create, /pengguna/:id, /pengguna/:id/edit

Role access:
  Lahan, Petani, Laporan: admin, operator, verifikator
  Asuransi, Klaim: admin, operator, verifikator, petani
  Pengguna: admin, operator
