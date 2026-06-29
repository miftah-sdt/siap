import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/routes/route_names.dart';

void main() {
  group('AppPermissions menu access', () {
    test('admin can access all menus', () {
      for (final module in AppModule.values) {
        expect(
          AppPermissions.canViewMenu(UserRole.admin, module),
          isTrue,
          reason: 'admin → $module',
        );
      }
    });

    test('petani only sees limited menus', () {
      expect(
        AppPermissions.canViewMenu(UserRole.petani, AppModule.dashboard),
        isTrue,
      );
      expect(
        AppPermissions.canViewMenu(UserRole.petani, AppModule.asuransi),
        isTrue,
      );
      expect(
        AppPermissions.canViewMenu(UserRole.petani, AppModule.klaim),
        isTrue,
      );
      expect(
        AppPermissions.canViewMenu(UserRole.petani, AppModule.monitoring),
        isTrue,
      );
      expect(
        AppPermissions.canViewMenu(UserRole.petani, AppModule.petani),
        isFalse,
      );
      expect(
        AppPermissions.canViewMenu(UserRole.petani, AppModule.lahan),
        isFalse,
      );
      expect(
        AppPermissions.canViewMenu(UserRole.petani, AppModule.laporan),
        isFalse,
      );
      expect(
        AppPermissions.canViewMenu(UserRole.petani, AppModule.pengguna),
        isFalse,
      );
    });

    test('verifikator can view master data but not manage users', () {
      expect(
        AppPermissions.canViewMenu(UserRole.verifikator, AppModule.petani),
        isTrue,
      );
      expect(
        AppPermissions.canViewMenu(UserRole.verifikator, AppModule.lahan),
        isTrue,
      );
      expect(
        AppPermissions.canViewMenu(UserRole.verifikator, AppModule.laporan),
        isTrue,
      );
      expect(
        AppPermissions.canViewMenu(UserRole.verifikator, AppModule.pengguna),
        isFalse,
      );
    });
  });

  group('AppPermissions actions', () {
    test('verifikator can edit asuransi/klaim but not create petani', () {
      expect(
        AppPermissions.can(
          UserRole.verifikator,
          AppModule.asuransi,
          PermissionAction.edit,
        ),
        isTrue,
      );
      expect(
        AppPermissions.can(
          UserRole.verifikator,
          AppModule.petani,
          PermissionAction.create,
        ),
        isFalse,
      );
      expect(
        AppPermissions.can(
          UserRole.verifikator,
          AppModule.petani,
          PermissionAction.edit,
        ),
        isFalse,
      );
    });

    test('only admin can delete petani and create pengguna', () {
      expect(
        AppPermissions.can(
          UserRole.admin,
          AppModule.petani,
          PermissionAction.delete,
        ),
        isTrue,
      );
      expect(
        AppPermissions.can(
          UserRole.operator,
          AppModule.petani,
          PermissionAction.delete,
        ),
        isFalse,
      );
      expect(
        AppPermissions.can(
          UserRole.admin,
          AppModule.pengguna,
          PermissionAction.create,
        ),
        isTrue,
      );
      expect(
        AppPermissions.can(
          UserRole.operator,
          AppModule.pengguna,
          PermissionAction.create,
        ),
        isFalse,
      );
    });

    test('petani can create klaim and asuransi', () {
      expect(
        AppPermissions.can(
          UserRole.petani,
          AppModule.klaim,
          PermissionAction.create,
        ),
        isTrue,
      );
      expect(
        AppPermissions.can(
          UserRole.petani,
          AppModule.asuransi,
          PermissionAction.create,
        ),
        isTrue,
      );
      expect(
        AppPermissions.can(
          UserRole.petani,
          AppModule.klaim,
          PermissionAction.delete,
        ),
        isFalse,
      );
    });
  });

  group('AppPermissions route guard', () {
    test('blocks petani from petani module routes', () {
      expect(
        AppPermissions.redirectIfDenied(UserRole.petani, RouteNames.petani),
        RouteNames.dashboard,
      );
      expect(
        AppPermissions.redirectIfDenied(
          UserRole.petani,
          RouteNames.petaniCreate,
        ),
        RouteNames.dashboard,
      );
    });

    test('allows operator to create lahan', () {
      expect(
        AppPermissions.redirectIfDenied(
          UserRole.operator,
          RouteNames.lahanCreate,
        ),
        isNull,
      );
    });

    test('blocks verifikator from pengguna routes', () {
      expect(
        AppPermissions.redirectIfDenied(
          UserRole.verifikator,
          RouteNames.pengguna,
        ),
        RouteNames.dashboard,
      );
    });
  });
}
