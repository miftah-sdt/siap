import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';
import 'package:siap/routes/route_names.dart';

class LahanDetailPage extends StatelessWidget {
  const LahanDetailPage({super.key, required this.lahan});

  final Lahan lahan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Lahan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final updated = await context.push<bool>(
                RouteNames.lahanEdit(lahan.id),
                extra: lahan,
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
            leading: const Icon(Icons.qr_code_outlined),
            title: const Text('Kode Lahan'),
            subtitle: Text(lahan.kodeLahan),
          ),
          ListTile(
            leading: const Icon(Icons.landscape_outlined),
            title: const Text('Nama Lahan'),
            subtitle: Text(lahan.namaLahan),
          ),
          ListTile(
            leading: const Icon(Icons.square_foot_outlined),
            title: const Text('Luas'),
            subtitle: Text('${Formatter.decimal(lahan.luas)} ha'),
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Lokasi'),
            subtitle: Text(lahan.lokasi),
          ),
          ListTile(
            leading: const Icon(Icons.map_outlined),
            title: const Text('Koordinat'),
            subtitle: Text(lahan.koordinat ?? '-'),
          ),
        ],
      ),
    );
  }
}
