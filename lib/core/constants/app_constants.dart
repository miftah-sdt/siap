class AppConstants {
  const AppConstants._();

  static const String appName = 'SIAP';
  static const String appFullName = 'Sistem Informasi Asuransi Pertanian';

  // Storage keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userSessionKey = 'user_session';
  static const String userRoleKey = 'user_role';
  static const String userPetaniIdKey = 'user_petani_id';
  static const String themeModeKey = 'theme_mode';

  // Pagination
  static const int defaultPageSize = 10;
  static const int maxPageSize = 100;

  // Validation
  static const int minPasswordLength = 8;
  static const int nikLength = 16;

  // Responsive breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
}
