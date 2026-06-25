import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';
import 'package:siap/routes/route_names.dart';

class PetaniDetailPage extends StatelessWidget {
  const PetaniDetailPage({super.key, required this.petani});

  final Petani petani;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Petani'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final updated = await context.push<bool>(
                RouteNames.petaniEdit(petani.id),
                extra: petani,
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
            leading: const Icon(Icons.badge_outlined),
            title: const Text('NIK'),
            subtitle: Text(petani.nik),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Nama'),
            subtitle: Text(petani.nama),
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Alamat'),
            subtitle: Text(petani.alamat),
          ),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: const Text('No HP'),
            subtitle: Text(Formatter.phone(petani.noHp)),
          ),
          ListTile(
            leading: const Icon(Icons.groups_outlined),
            title: const Text('Kelompok Tani'),
            subtitle: Text(petani.kelompokTani),
          ),
        ],
      ),
    );
  }
}
