class ApiEndpoint {
  const ApiEndpoint._();

  // Auth
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String profile = '/auth/profile';

  // Dashboard
  static const String dashboardSummary = '/dashboard/summary';
  static const String dashboardCharts = '/dashboard/charts';

  // Petani
  static const String petani = '/petani';
  static String petaniDetail(String id) => '/petani/$id';

  // Lahan
  static const String lahan = '/lahan';
  static String lahanDetail(String id) => '/lahan/$id';

  // Asuransi
  static const String asuransi = '/asuransi';
  static String asuransiDetail(String id) => '/asuransi/$id';

  // Klaim
  static const String klaim = '/klaim';
  static String klaimDetail(String id) => '/klaim/$id';

  // Laporan
  static const String laporan = '/laporan';
  static const String laporanExport = '/laporan/export';

  // Files
  static const String fileUpload = '/files/upload';

  // Pengguna
  static const String pengguna = '/pengguna';
  static String penggunaDetail(String id) => '/pengguna/$id';
}
