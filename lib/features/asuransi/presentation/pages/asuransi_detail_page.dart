import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/services/rfi_remote_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/asuransi/presentation/widgets/askrindo_sync_panel.dart';
import 'package:siap/features/asuransi/presentation/widgets/underwriting_score_card.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/routes/route_names.dart';
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
        _asuransi = Asuransi(
          id: _asuransi.id,
          nomorPolis: _asuransi.nomorPolis,
          petaniId: _asuransi.petaniId,
          petaniNama: _asuransi.petaniNama,
          lahanId: _asuransi.lahanId,
          lahanNama: _asuransi.lahanNama,
          status: _asuransi.status,
          documents: _asuransi.documents,
          createdAt: _asuransi.createdAt,
          riskScore: score.riskScore,
          riskLevel: score.riskLevel,
          scoreFactors: score.factors,
          scoredAt: score.scoredAt,
          askrindoRef: _asuransi.askrindoRef,
          askrindoStatus: _asuransi.askrindoStatus,
        );
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _scoring = false);
      UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
    }
  }

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
            subtitle: Text('${_asuransi.petaniNama} (${_asuransi.petaniId})'),
          ),
          ListTile(
            leading: const Icon(Icons.landscape_outlined),
            title: const Text('Lahan'),
            subtitle: Text('${_asuransi.lahanNama} (${_asuransi.lahanId})'),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_outlined),
            title: const Text('Tanggal Dibuat'),
            subtitle: Text(Formatter.dateTime(_asuransi.createdAt)),
          ),
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
