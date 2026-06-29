import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/core/auth/role_context.dart';
import 'package:siap/core/auth/workflow_permissions.dart';
import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/services/report_export_service.dart';
import 'package:siap/core/services/rfi_remote_service.dart';
import 'package:siap/core/services/workflow_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/asuransi/presentation/widgets/askrindo_sync_panel.dart';
import 'package:siap/features/asuransi/presentation/widgets/underwriting_score_card.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/helpers/report_download_helper.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/permission_edit_action.dart';
import 'package:siap/shared/widgets/workflow_action_bar.dart';
import 'package:siap/shared/widgets/workflow_badge.dart';

class AsuransiDetailPage extends StatefulWidget {
  const AsuransiDetailPage({super.key, required this.asuransi});

  final Asuransi asuransi;

  @override
  State<AsuransiDetailPage> createState() => _AsuransiDetailPageState();
}

class _AsuransiDetailPageState extends State<AsuransiDetailPage> {
  late Asuransi _asuransi;
  UnderwritingScore? _score;
  bool _scoring = false;
  bool _workflowLoading = false;
  bool _reportLoading = false;

  @override
  void initState() {
    super.initState();
    _asuransi = widget.asuransi;
    if (_asuransi.riskScore != null) {
      _score = UnderwritingScore(
        riskScore: _asuransi.riskScore!,
        riskLevel: _asuransi.riskLevel ?? 'sedang',
        factors: _asuransi.scoreFactors,
        scoredAt: _asuransi.scoredAt,
      );
    }
  }

  Future<void> _calculateScore() async {
    setState(() => _scoring = true);
    try {
      final score = await sl<RfiRemoteService>().scoreAsuransi(_asuransi.id);
      if (!mounted) return;
      setState(() {
        _score = score;
        _scoring = false;
        _asuransi = _copyAsuransi(
          riskScore: score.riskScore,
          riskLevel: score.riskLevel,
          scoreFactors: score.factors,
          scoredAt: score.scoredAt,
        );
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _scoring = false);
      UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
    }
  }

  Asuransi _copyAsuransi({
    AsuransiStatus? status,
    int? riskScore,
    String? riskLevel,
    List<ScoreFactor>? scoreFactors,
    String? scoredAt,
  }) {
    return Asuransi(
      id: _asuransi.id,
      nomorPolis: _asuransi.nomorPolis,
      petaniId: _asuransi.petaniId,
      petaniNama: _asuransi.petaniNama,
      lahanId: _asuransi.lahanId,
      lahanNama: _asuransi.lahanNama,
      status: status ?? _asuransi.status,
      documents: _asuransi.documents,
      createdAt: _asuransi.createdAt,
      riskScore: riskScore ?? _asuransi.riskScore,
      riskLevel: riskLevel ?? _asuransi.riskLevel,
      scoreFactors: scoreFactors ?? _asuransi.scoreFactors,
      scoredAt: scoredAt ?? _asuransi.scoredAt,
      askrindoRef: _asuransi.askrindoRef,
      askrindoStatus: _asuransi.askrindoStatus,
    );
  }

  Future<void> _runWorkflow(WorkflowAction action) async {
    if (action == WorkflowAction.reject) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Tolak Asuransi'),
          content: const Text('Yakin ingin menolak pengajuan asuransi ini?'),
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
      final updated = await sl<WorkflowService>().transitionAsuransi(
        id: _asuransi.id,
        action: action.apiPath,
      );
      if (!mounted) return;
      setState(() {
        _asuransi = updated;
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
        type: 'asuransi',
        id: _asuransi.id,
        format: format,
      );
      if (!mounted) return;
      setState(() => _reportLoading = false);
      await ReportDownloadHelper.exportAndDownload(
        context: context,
        result: result,
        successTitle: 'Laporan Asuransi Terunduh',
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
        title: const Text('Detail Asuransi'),
        actions: [
          PermissionEditAction(
            module: AppModule.asuransi,
            onPressed: () async {
              final updated = await context.push<bool>(
                RouteNames.asuransiEdit(_asuransi.id),
                extra: _asuransi,
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
              WorkflowBadge.asuransi(_asuransi.status),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          WorkflowActionBar.asuransi(
            status: _asuransi.status,
            isLoading: _workflowLoading,
            onAction: _runWorkflow,
          ),
          const SizedBox(height: AppSpacing.lg),
          UnderwritingScoreCard(
            score: _score,
            isLoading: _scoring,
            onCalculate: _calculateScore,
          ),
          const SizedBox(height: AppSpacing.lg),
          AskrindoSyncPanel(
            asuransiId: _asuransi.id,
            askrindoRef: _asuransi.askrindoRef,
            askrindoStatus: _asuransi.askrindoStatus,
          ),
          const SizedBox(height: AppSpacing.lg),
          ListTile(
            leading: const Icon(Icons.policy_outlined),
            title: const Text('Nomor Polis'),
            subtitle: Text(_asuransi.nomorPolis),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Petani'),
            subtitle: Text(_asuransi.petaniNama),
          ),
          ListTile(
            leading: const Icon(Icons.landscape_outlined),
            title: const Text('Lahan'),
            subtitle: Text(_asuransi.lahanNama),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_outlined),
            title: const Text('Tanggal Dibuat'),
            subtitle: Text(Formatter.dateTime(_asuransi.createdAt)),
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
              'Dokumen (${_asuransi.documents.length})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          if (_asuransi.documents.isEmpty)
            const Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Text('Belum ada dokumen.'),
            )
          else
            ..._asuransi.documents.map(
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
