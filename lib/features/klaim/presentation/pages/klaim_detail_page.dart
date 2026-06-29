import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/core/auth/role_context.dart';
import 'package:siap/core/auth/workflow_permissions.dart';
import 'package:siap/core/services/report_export_service.dart';
import 'package:siap/core/services/workflow_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/helpers/report_download_helper.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/permission_edit_action.dart';
import 'package:siap/shared/widgets/workflow_action_bar.dart';
import 'package:siap/shared/widgets/workflow_badge.dart';

class KlaimDetailPage extends StatefulWidget {
  const KlaimDetailPage({super.key, required this.klaim});

  final Klaim klaim;

  @override
  State<KlaimDetailPage> createState() => _KlaimDetailPageState();
}

class _KlaimDetailPageState extends State<KlaimDetailPage> {
  late Klaim _klaim;
  bool _workflowLoading = false;
  bool _reportLoading = false;

  @override
  void initState() {
    super.initState();
    _klaim = widget.klaim;
  }

  Future<void> _runWorkflow(WorkflowAction action) async {
    if (action == WorkflowAction.reject) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Tolak Klaim'),
          content: const Text('Yakin ingin menolak pengajuan klaim ini?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Tolak'),
            ),
          ],
        ),
      );
      if (confirmed != true) return;
    }

    setState(() => _workflowLoading = true);
    try {
      final updated = await sl<WorkflowService>().transitionKlaim(
        id: _klaim.id,
        action: action.apiPath,
      );
      if (!mounted) return;
      setState(() {
        _klaim = updated;
        _workflowLoading = false;
      });
      UiFeedback.showSnackBar(
        context,
        message: 'Status diperbarui: ${updated.status.label}',
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _workflowLoading = false);
      UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
    }
  }

  Future<void> _downloadDetailReport(ExportFormat format) async {
    setState(() => _reportLoading = true);
    try {
      final result = await sl<ReportExportService>().exportDetail(
        type: 'klaim',
        id: _klaim.id,
        format: format,
      );
      if (!mounted) return;
      setState(() => _reportLoading = false);
      await ReportDownloadHelper.exportAndDownload(
        context: context,
        result: result,
        successTitle: 'Laporan Klaim Terunduh',
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _reportLoading = false);
      UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canViewLaporan = AppPermissions.canViewMenu(
      context.userRole,
      AppModule.laporan,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Klaim'),
        actions: [
          PermissionEditAction(
            module: AppModule.klaim,
            onPressed: () async {
              final updated = await context.push<bool>(
                RouteNames.klaimEdit(_klaim.id),
                extra: _klaim,
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
              WorkflowBadge.klaim(_klaim.status),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          WorkflowActionBar.klaim(
            status: _klaim.status,
            isLoading: _workflowLoading,
            onAction: _runWorkflow,
          ),
          const SizedBox(height: AppSpacing.lg),
          ListTile(
            leading: const Icon(Icons.receipt_long_outlined),
            title: const Text('Nomor Klaim'),
            subtitle: Text(_klaim.nomorKlaim),
          ),
          ListTile(
            leading: const Icon(Icons.policy_outlined),
            title: const Text('Polis'),
            subtitle: Text(_klaim.polisNomor),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Deskripsi Kerusakan'),
            subtitle: Text(_klaim.deskripsi),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_outlined),
            title: const Text('Tanggal Dibuat'),
            subtitle: Text(Formatter.dateTime(_klaim.createdAt)),
          ),
          if (canViewLaporan) ...[
            const Divider(height: AppSpacing.xl),
            Text(
              'Unduh Laporan Detail',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'PDF',
                    icon: Icons.picture_as_pdf_outlined,
                    onPressed: _reportLoading
                        ? null
                        : () => _downloadDetailReport(ExportFormat.pdf),
                    isLoading: _reportLoading,
                    isExpanded: true,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: AppButton(
                    label: 'Excel',
                    icon: Icons.table_chart_outlined,
                    variant: AppButtonVariant.secondary,
                    onPressed: _reportLoading
                        ? null
                        : () => _downloadDetailReport(ExportFormat.excel),
                    isLoading: _reportLoading,
                    isExpanded: true,
                  ),
                ),
              ],
            ),
          ],
          const Divider(height: AppSpacing.xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              'Bukti Kerusakan (${_klaim.buktiKerusakan.length})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          if (_klaim.buktiKerusakan.isEmpty)
            const Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Text('Belum ada bukti kerusakan.'),
            )
          else
            ..._klaim.buktiKerusakan.map(
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
