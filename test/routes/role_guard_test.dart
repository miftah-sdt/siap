import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/routes/role_guard.dart';

void main() {
  group('RoleGuard', () {
    test('canAccess returns true when allowedRoles is null', () {
      expect(
        RoleGuard.canAccess(userRole: UserRole.petani, allowedRoles: null),
        isTrue,
      );
    });

    test('canAccess returns true for allowed role', () {
      expect(
        RoleGuard.canAccess(
          userRole: UserRole.admin,
          allowedRoles: const [UserRole.admin, UserRole.operator],
        ),
        isTrue,
      );
    });

    test('canAccess returns false for disallowed role', () {
      expect(
        RoleGuard.canAccess(
          userRole: UserRole.petani,
          allowedRoles: const [UserRole.admin],
        ),
        isFalse,
      );
    });

    test('canManageUsers uses pengguna menu permission', () {
      expect(RoleGuard.canManageUsers(UserRole.admin), isTrue);
      expect(RoleGuard.canManageUsers(UserRole.operator), isTrue);
      expect(RoleGuard.canManageUsers(UserRole.verifikator), isFalse);
      expect(RoleGuard.canManageUsers(UserRole.petani), isFalse);
    });

    test('redirectIfDenied delegates to AppPermissions', () {
      expect(
        RoleGuard.redirectIfDenied(
          userRole: UserRole.petani,
          location: RouteNames.laporan,
        ),
        RouteNames.dashboard,
      );
    });
  });
}
