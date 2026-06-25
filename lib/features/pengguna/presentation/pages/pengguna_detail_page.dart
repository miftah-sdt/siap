import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';
import 'package:siap/routes/route_names.dart';

class PenggunaDetailPage extends StatelessWidget {
  const PenggunaDetailPage({super.key, required this.pengguna});

  final Pengguna pengguna;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengguna'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final updated = await context.push<bool>(
                RouteNames.penggunaEdit(pengguna.id),
                extra: pengguna,
              );
              if (updated == true && context.mounted) {
                context.pop(true);
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Nama'),
            subtitle: Text(pengguna.name),
          ),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: const Text('Email'),
            subtitle: Text(pengguna.email),
          ),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings_outlined),
            title: const Text('Role'),
            subtitle: Text(pengguna.role.label),
          ),
          ListTile(
            leading: Icon(
              pengguna.isActive
                  ? Icons.check_circle_outline
                  : Icons.cancel_outlined,
            ),
            title: const Text('Status'),
            subtitle: Text(pengguna.isActive ? 'Aktif' : 'Nonaktif'),
          ),
        ],
      ),
    );
  }
}
