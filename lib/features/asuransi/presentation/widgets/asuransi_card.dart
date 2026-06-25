import 'package:flutter/material.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/shared/widgets/workflow_badge.dart';

class AsuransiCard extends StatelessWidget {
  const AsuransiCard({
    super.key,
    required this.asuransi,
    this.onTap,
    this.onDelete,
  });

  final Asuransi asuransi;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Icon(
            Icons.verified_user_outlined,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(asuransi.nomorPolis),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Petani: ${asuransi.petaniNama}'),
            Text('Lahan: ${asuransi.lahanNama}'),
            Text('Dibuat: ${Formatter.date(asuransi.createdAt)}'),
            const SizedBox(height: AppSpacing.xs),
            WorkflowBadge.asuransi(asuransi.status),
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
