import 'package:flutter/material.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/features/auth/domain/entities/user.dart';

class NavigationItem {
  const NavigationItem({
    required this.label,
    required this.icon,
    required this.route,
    required this.module,
    this.includeInMobileBottomNav = false,
  });

  final String label;
  final IconData icon;
  final String route;
  final AppModule module;

  /// Hanya item utama yang tampil di bottom navigation mobile.
  final bool includeInMobileBottomNav;

  bool isVisibleFor(UserRole role) => AppPermissions.canViewMenu(role, module);
}
