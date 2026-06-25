import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/workflow_badge.dart';

class AsuransiDetailPage extends StatelessWidget {
  const AsuransiDetailPage({super.key, required this.asuransi});

  final Asuransi asuransi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Asuransi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final updated = await context.push<bool>(
                RouteNames.asuransiEdit(asuransi.id),
                extra: asuransi,
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
          Row(
            children: [
              Text('Status', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: AppSpacing.md),
              WorkflowBadge.asuransi(asuransi.status),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ListTile(
            leading: const Icon(Icons.policy_outlined),
            title: const Text('Nomor Polis'),
            subtitle: Text(asuransi.nomorPolis),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Petani'),
            subtitle: Text('${asuransi.petaniNama} (${asuransi.petaniId})'),
          ),
          ListTile(
            leading: const Icon(Icons.landscape_outlined),
            title: const Text('Lahan'),
            subtitle: Text('${asuransi.lahanNama} (${asuransi.lahanId})'),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_outlined),
            title: const Text('Tanggal Dibuat'),
            subtitle: Text(Formatter.dateTime(asuransi.createdAt)),
          ),
          const Divider(height: AppSpacing.xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              'Dokumen (${asuransi.documents.length})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          if (asuransi.documents.isEmpty)
            const Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Text('Belum ada dokumen.'),
            )
          else
            ...asuransi.documents.map(
              (doc) => ListTile(
                leading: const Icon(Icons.description_outlined),
                title: Text(doc),
              ),
            ),
        ],
      ),
    );
  }
}
