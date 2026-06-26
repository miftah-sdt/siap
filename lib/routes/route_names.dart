class RouteNames {
  const RouteNames._();

  static const String splash = '/';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String petani = '/petani';
  static const String petaniCreate = '/petani/create';

  static String petaniDetail(String id) => '/petani/$id';
  static String petaniEdit(String id) => '/petani/$id/edit';
  static const String lahan = '/lahan';
  static const String lahanCreate = '/lahan/create';

  static String lahanDetail(String id) => '/lahan/$id';
  static String lahanEdit(String id) => '/lahan/$id/edit';

  static const String asuransi = '/asuransi';
  static const String asuransiCreate = '/asuransi/create';

  static String asuransiDetail(String id) => '/asuransi/$id';
  static String asuransiEdit(String id) => '/asuransi/$id/edit';

  static const String klaim = '/klaim';
  static const String klaimCreate = '/klaim/create';

  static String klaimDetail(String id) => '/klaim/$id';
  static String klaimEdit(String id) => '/klaim/$id/edit';

  static const String laporan = '/laporan';

  static const String monitoring = '/monitoring';

  static const String pengguna = '/pengguna';
  static const String penggunaCreate = '/pengguna/create';

  static String penggunaDetail(String id) => '/pengguna/$id';
  static String penggunaEdit(String id) => '/pengguna/$id/edit';
}
