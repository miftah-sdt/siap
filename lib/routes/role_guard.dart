import 'package:siap/features/auth/domain/entities/user.dart';

class RoleGuard {
  const RoleGuard._();

  static bool canAccess({
    required UserRole userRole,
    required List<UserRole>? allowedRoles,
  }) {
    if (allowedRoles == null || allowedRoles.isEmpty) return true;
    return allowedRoles.contains(userRole);
  }

  static bool isAdmin(UserRole role) => role == UserRole.admin;

  static bool canManageUsers(UserRole role) =>
      role == UserRole.admin || role == UserRole.operator;
}
