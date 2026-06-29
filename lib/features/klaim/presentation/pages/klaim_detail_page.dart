import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/workflow_badge.dart';

class KlaimDetailPage extends StatelessWidget {
  const KlaimDetailPage({super.key, required this.klaim});

  final Klaim klaim;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Klaim'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final updated = await context.push<bool>(
                RouteNames.klaimEdit(klaim.id),
                extra: klaim,
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
              WorkflowBadge.klaim(klaim.status),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ListTile(
            leading: const Icon(Icons.receipt_long_outlined),
            title: const Text('Nomor Klaim'),
            subtitle: Text(klaim.nomorKlaim),
          ),
          ListTile(
            leading: const Icon(Icons.policy_outlined),
            title: const Text('Polis'),
            subtitle: Text(klaim.polisNomor),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Deskripsi Kerusakan'),
            subtitle: Text(klaim.deskripsi),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_outlined),
            title: const Text('Tanggal Dibuat'),
            subtitle: Text(Formatter.dateTime(klaim.createdAt)),
          ),
          const Divider(height: AppSpacing.xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              'Bukti Kerusakan (${klaim.buktiKerusakan.length})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          if (klaim.buktiKerusakan.isEmpty)
            const Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Text('Belum ada bukti kerusakan.'),
            )
          else
            ...klaim.buktiKerusakan.map(
              (bukti) => ListTile(
                leading: const Icon(Icons.image_outlined),
                title: Text(bukti),
              ),
            ),
        ],
      ),
    );
  }
}
