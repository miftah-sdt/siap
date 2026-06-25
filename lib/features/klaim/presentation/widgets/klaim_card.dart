import 'package:flutter/material.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/shared/widgets/workflow_badge.dart';

class KlaimCard extends StatelessWidget {
  const KlaimCard({super.key, required this.klaim, this.onTap, this.onDelete});

  final Klaim klaim;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Icon(
            Icons.report_problem_outlined,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(klaim.nomorKlaim),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Polis: ${klaim.polisNomor}'),
            Text(klaim.deskripsi, maxLines: 2, overflow: TextOverflow.ellipsis),
            Text('Dibuat: ${Formatter.date(klaim.createdAt)}'),
            const SizedBox(height: AppSpacing.xs),
            WorkflowBadge.klaim(klaim.status),
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
