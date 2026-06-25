import 'package:flutter/material.dart';
import 'package:siap/features/auth/domain/entities/user.dart';

class NavigationItem {
  const NavigationItem({
    required this.label,
    required this.icon,
    required this.route,
    this.allowedRoles,
  });

  final String label;
  final IconData icon;
  final String route;
  final List<UserRole>? allowedRoles;

  bool isVisibleFor(UserRole role) {
    if (allowedRoles == null || allowedRoles!.isEmpty) return true;
    return allowedRoles!.contains(role);
  }
}
