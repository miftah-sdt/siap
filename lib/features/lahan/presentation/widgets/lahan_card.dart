import 'package:flutter/material.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';

class LahanCard extends StatelessWidget {
  const LahanCard({super.key, required this.lahan, this.onTap, this.onDelete});

  final Lahan lahan;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(
            lahan.namaLahan.isNotEmpty ? lahan.namaLahan[0].toUpperCase() : '?',
          ),
        ),
        title: Text(lahan.namaLahan),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Petani: ${lahan.petaniNama}'),
            Text('Kode: ${lahan.kodeLahan}'),
            Text('Luas: ${Formatter.decimal(lahan.luas)} ha'),
            Text('Lokasi: ${lahan.lokasi}'),
          ],
        ),
        isThreeLine: true,
        trailing: onDelete != null
            ? IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: onDelete,
              )
            : null,
        contentPadding: const EdgeInsets.all(AppSpacing.md),
      ),
    );
  }
}
