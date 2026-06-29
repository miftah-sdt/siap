import 'package:flutter/material.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/core/auth/role_context.dart';

class PermissionFab extends StatelessWidget {
  const PermissionFab({
    super.key,
    required this.module,
    required this.onPressed,
    this.label = 'Tambah',
  });

  final AppModule module;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    if (!AppPermissions.can(
      context.userRole,
      module,
      PermissionAction.create,
    )) {
      return const SizedBox.shrink();
    }

    return FloatingActionButton.extended(
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      label: Text(label),
    );
  }
}
