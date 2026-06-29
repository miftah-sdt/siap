import 'package:flutter/material.dart';
import 'package:siap/features/auth/domain/entities/user.dart';

class NavigationItem {
  const NavigationItem({
    required this.label,
    required this.icon,
    required this.route,
    this.allowedRoles,
    this.includeInMobileBottomNav = false,
  });

  final String label;
  final IconData icon;
  final String route;
  final List<UserRole>? allowedRoles;

  /// Hanya item utama yang tampil di bottom navigation mobile.
  final bool includeInMobileBottomNav;

  bool isVisibleFor(UserRole role) {
    if (allowedRoles == null || allowedRoles!.isEmpty) return true;
    return allowedRoles!.contains(role);
  }
}
