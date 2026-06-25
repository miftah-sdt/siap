import 'package:flutter/material.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';

class PenggunaCard extends StatelessWidget {
  const PenggunaCard({
    super.key,
    required this.pengguna,
    this.onTap,
    this.onDelete,
  });

  final Pengguna pengguna;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(
            pengguna.name.isNotEmpty ? pengguna.name[0].toUpperCase() : '?',
          ),
        ),
        title: Text(pengguna.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pengguna.email),
            Text('Role: ${pengguna.role.label}'),
            Text(
              pengguna.isActive ? 'Status: Aktif' : 'Status: Nonaktif',
              style: TextStyle(
                color: pengguna.isActive
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.error,
              ),
            ),
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
