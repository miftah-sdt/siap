import 'package:flutter/material.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';

class PetaniCard extends StatelessWidget {
  const PetaniCard({
    super.key,
    required this.petani,
    this.onTap,
    this.onDelete,
  });

  final Petani petani;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(
            petani.nama.isNotEmpty ? petani.nama[0].toUpperCase() : '?',
          ),
        ),
        title: Text(petani.nama),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIK: ${petani.nik}'),
            Text('Kelompok: ${petani.kelompokTani}'),
            Text('HP: ${Formatter.phone(petani.noHp)}'),
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
