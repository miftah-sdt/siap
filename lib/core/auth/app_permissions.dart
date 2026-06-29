import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/routes/route_names.dart';

/// Modul fitur SIAP untuk kontrol akses berbasis role.
enum AppModule {
  dashboard,
  petani,
  lahan,
  asuransi,
  klaim,
  monitoring,
  laporan,
  pengguna,
}

/// Aksi yang dapat dibatasi per modul.
enum PermissionAction { view, create, edit, delete }

/// Matriks akses role → menu & aksi CRUD.
///
/// | Modul       | Admin | Operator | Verifikator | Petani      |
/// |-------------|-------|----------|-------------|-------------|
/// | Dashboard   | ✓     | ✓        | ✓           | ✓           |
/// | Petani      | CRUD  | CRU      | R           | —           |
/// | Lahan       | CRUD  | CRU      | R           | —           |
/// | Akseptasi   | CRUD  | CRU      | RU          | CR          |
/// | Klaim       | CRUD  | CRU      | RU          | CR          |
/// | Monitoring  | ✓     | ✓        | ✓           | ✓           |
/// | Laporan     | ✓     | ✓        | ✓           | —           |
/// | Pengguna    | CRUD  | CRU      | —           | —           |
class AppPermissions {
  const AppPermissions._();

  static bool can(UserRole role, AppModule module, PermissionAction action) {
    return switch (action) {
      PermissionAction.view => canViewMenu(role, module),
      PermissionAction.create => _canCreate(role, module),
      PermissionAction.edit => _canEdit(role, module),
      PermissionAction.delete => _canDelete(role, module),
    };
  }

  static bool canViewMenu(UserRole role, AppModule module) {
    return switch (module) {
      AppModule.dashboard => true,
      AppModule.petani =>
        role == UserRole.admin ||
            role == UserRole.operator ||
            role == UserRole.verifikator,
      AppModule.lahan =>
        role == UserRole.admin ||
            role == UserRole.operator ||
            role == UserRole.verifikator ||
            role == UserRole.petani,
      AppModule.asuransi || AppModule.klaim || AppModule.monitoring => true,
      AppModule.laporan => role != UserRole.petani,
      AppModule.pengguna => role == UserRole.admin || role == UserRole.operator,
    };
  }

  static bool _canCreate(UserRole role, AppModule module) {
    return switch (module) {
      AppModule.petani ||
      AppModule.lahan => role == UserRole.admin || role == UserRole.operator,
      AppModule.asuransi || AppModule.klaim =>
        role == UserRole.admin ||
            role == UserRole.operator ||
            role == UserRole.petani,
      AppModule.pengguna => role == UserRole.admin,
      _ => false,
    };
  }

  static bool _canEdit(UserRole role, AppModule module) {
    return switch (module) {
      AppModule.petani ||
      AppModule.lahan => role == UserRole.admin || role == UserRole.operator,
      AppModule.asuransi || AppModule.klaim =>
        role == UserRole.admin ||
            role == UserRole.operator ||
            role == UserRole.verifikator,
      AppModule.pengguna => role == UserRole.admin || role == UserRole.operator,
      _ => false,
    };
  }

  static bool _canDelete(UserRole role, AppModule module) {
    return switch (module) {
      AppModule.petani || AppModule.pengguna => role == UserRole.admin,
      AppModule.lahan ||
      AppModule.asuransi ||
      AppModule.klaim => role == UserRole.admin || role == UserRole.operator,
      _ => false,
    };
  }

  static AppModule? moduleForRoute(String location) {
    if (location.startsWith(RouteNames.dashboard)) {
      return AppModule.dashboard;
    }
    if (location.startsWith(RouteNames.petani)) return AppModule.petani;
    if (location.startsWith(RouteNames.lahan)) return AppModule.lahan;
    if (location.startsWith(RouteNames.asuransi)) return AppModule.asuransi;
    if (location.startsWith(RouteNames.klaim)) return AppModule.klaim;
    if (location.startsWith(RouteNames.monitoring)) {
      return AppModule.monitoring;
    }
    if (location.startsWith(RouteNames.laporan)) return AppModule.laporan;
    if (location.startsWith(RouteNames.pengguna)) return AppModule.pengguna;
    return null;
  }

  /// Redirect ke dashboard jika role tidak punya akses ke [location].
  static String? redirectIfDenied(UserRole role, String location) {
    final module = moduleForRoute(location);
    if (module == null) return null;

    if (location.endsWith('/create')) {
      return can(role, module, PermissionAction.create)
          ? null
          : RouteNames.dashboard;
    }

    if (location.contains('/edit')) {
      return can(role, module, PermissionAction.edit)
          ? null
          : RouteNames.dashboard;
    }

    return canViewMenu(role, module) ? null : RouteNames.dashboard;
  }
}
