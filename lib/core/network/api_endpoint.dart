class ApiEndpoint {
  const ApiEndpoint._();

  // Auth
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String changePassword = '/auth/change-password';
  static const String registerPetani = '/auth/register-petani';
  static const String profile = '/auth/profile';

  // Dashboard
  static const String dashboardSummary = '/dashboard/summary';
  static const String dashboardCharts = '/dashboard/charts';

  // Petani
  static const String petani = '/petani';
  static String petaniDetail(String id) => '/petani/$id';
  static String petaniApprove(String id) => '/petani/$id/approve';
  static String petaniReject(String id) => '/petani/$id/reject';

  // Lahan
  static const String lahan = '/lahan';
  static String lahanDetail(String id) => '/lahan/$id';

  // Asuransi
  static const String asuransi = '/asuransi';
  static String asuransiDetail(String id) => '/asuransi/$id';
  static String asuransiWorkflow(String id, String action) =>
      '/asuransi/$id/workflow/$action';

  // Klaim
  static const String klaim = '/klaim';
  static String klaimDetail(String id) => '/klaim/$id';
  static String klaimWorkflow(String id, String action) =>
      '/klaim/$id/workflow/$action';

  // Laporan
  static const String laporan = '/laporan';
  static const String laporanExport = '/laporan/export';
  static const String laporanExportDetail = '/laporan/export-detail';

  // Files
  static const String fileUpload = '/files/upload';

  // RFI phase 2
  static const String underwritingScore = '/underwriting/score';
  static const String optAlerts = '/opt/alerts';
  static const String askrindoPolicies = '/askrindo/policies';

  // Pengguna
  static const String pengguna = '/pengguna';
  static String penggunaDetail(String id) => '/pengguna/$id';
}
