import 'package:flutter/material.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/core/auth/role_context.dart';

class PermissionEditAction extends StatelessWidget {
  const PermissionEditAction({
    super.key,
    required this.module,
    required this.onPressed,
  });

  final AppModule module;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (!AppPermissions.can(context.userRole, module, PermissionAction.edit)) {
      return const SizedBox.shrink();
    }

    return IconButton(
      icon: const Icon(Icons.edit_outlined),
      tooltip: 'Ubah',
      onPressed: onPressed,
    );
  }
}
