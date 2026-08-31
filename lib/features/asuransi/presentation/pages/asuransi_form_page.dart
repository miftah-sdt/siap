import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/models/select_option.dart';
import 'package:siap/core/services/lookup_service.dart';
import 'package:siap/core/services/notification_service.dart';
import 'package:siap/core/services/rfi_remote_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/utils/validators.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_bloc.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_event.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_state.dart';
import 'package:siap/features/asuransi/presentation/widgets/underwriting_score_card.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_search_select_field.dart';
import 'package:siap/shared/widgets/app_text_field.dart';
import 'package:siap/shared/widgets/attachment_picker_section.dart';

class AsuransiFormPage extends StatefulWidget {
  const AsuransiFormPage({super.key, this.asuransi});

  final Asuransi? asuransi;

  @override
  State<AsuransiFormPage> createState() => _AsuransiFormPageState();
}

class _AsuransiFormPageState extends State<AsuransiFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nomorPolisController;
  final List<String> _documents = [];

  SelectOption? _selectedLahan;
  bool _loadingLahan = true;
  bool _scoring = false;
  UnderwritingScore? _score;

  LookupService get _lookup => sl<LookupService>();

  @override
  void initState() {
    super.initState();
    _nomorPolisController = TextEditingController(
      text: widget.asuransi?.nomorPolis,
    );
    final existing = widget.asuransi;
    if (existing != null) {
      _selectedLahan = SelectOption(
        id: existing.lahanId,
        label: '${existing.petaniNama} — ${existing.lahanNama}',
        extra: {
          'nama_lahan': existing.lahanNama,
          'petani_id': existing.petaniId,
          'petani_nama': existing.petaniNama,
        },
      );
      _documents.addAll(existing.documents);
      if (existing.riskScore != null) {
        _score = UnderwritingScore(
          riskScore: existing.riskScore!,
          riskLevel: existing.riskLevel ?? 'sedang',
          factors: existing.scoreFactors,
          scoredAt: existing.scoredAt,
        );
      }
    }
    context.read<AsuransiFormBloc>().add(
      AsuransiFormEvent.started(asuransi: widget.asuransi),
    );
    _loadSelectedLahan();
  }

  Future<void> _loadSelectedLahan() async {
    final lahanId = _selectedLahan?.id;
    if (lahanId != null) {
      try {
        final option = await _lookup.getLahanById(lahanId);
        if (mounted) setState(() => _selectedLahan = option);
      } catch (_) {}
    }
    if (mounted) setState(() => _loadingLahan = false);
  }

  Future<List<SelectOption>> _searchLahan(String query) {
    return _lookup.getLahanOptions(search: query);
  }

  Future<void> _calculateScore() async {
    if (_selectedLahan?.id == null) {
      UiFeedback.showSnackBar(
        context,
        message: 'Pilih lahan terlebih dahulu.',
        isError: true,
      );
      return;
    }
    setState(() => _scoring = true);
    try {
      final score = await sl<RfiRemoteService>().scoreLahan(_selectedLahan!.id);
      if (!mounted) return;
      setState(() {
        _score = score;
        _scoring = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _scoring = false);
      UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
    }
  }

  @override
  void dispose() {
    _nomorPolisController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    var lahan = _selectedLahan;
    if (lahan == null) return;

    var petaniId = lahan.extra?['petani_id'];
    var petaniNama = lahan.extra?['petani_nama'];
    var lahanNama = lahan.extra?['nama_lahan'] ?? lahan.label;

    if (petaniId == null ||
        petaniId.isEmpty ||
        petaniNama == null ||
        petaniNama.isEmpty) {
      try {
        lahan = await _lookup.getLahanById(lahan.id);
        if (!mounted) return;
        petaniId = lahan.extra?['petani_id'];
        petaniNama = lahan.extra?['petani_nama'];
        lahanNama = lahan.extra?['nama_lahan'] ?? lahan.label;
      } catch (_) {}
    }

    if (petaniId == null ||
        petaniId.isEmpty ||
        petaniNama == null ||
        petaniNama.isEmpty) {
      UiFeedback.showSnackBar(
        context,
        message: 'Data petani pada lahan tidak lengkap.',
        isError: true,
      );
      return;
    }

    context.read<AsuransiFormBloc>().add(
      AsuransiFormEvent.submitted(
        nomorPolis: _nomorPolisController.text.trim(),
        petaniId: petaniId,
        petaniNama: petaniNama,
        lahanId: lahan!.id,
        lahanNama: lahanNama,
        documents: List.unmodifiable(_documents),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.asuransi != null;
    final selectedLahan = _selectedLahan;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Akseptasi' : 'Pengajuan Asuransi'),
      ),
      body: BlocConsumer<AsuransiFormBloc, AsuransiFormState>(
        listener: (context, state) {
          if (state is AsuransiFormSuccess) {
            sl<NotificationService>().notifyAsuransiRegistered(
              _nomorPolisController.text.trim(),
            );
            UiFeedback.showSnackBar(
              context,
              message: isEdit
                  ? 'Pengajuan asuransi berhasil diperbarui.'
                  : 'Pengajuan asuransi berhasil dikirim.',
            );
            context.pop(true);
          }
          if (state is AsuransiFormError) {
            UiFeedback.showSnackBar(
              context,
              message: state.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AsuransiFormLoading;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextField(
                    controller: _nomorPolisController,
                    label: 'Nomor Polis',
                    validator: (v) =>
                        Validators.required(v, field: 'Nomor Polis'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppSearchSelectField(
                    label: 'Lahan Petani',
                    prefixIcon: Icons.landscape_outlined,
                    hint: 'Cari nama petani atau nama lahan',
                    value: _selectedLahan,
                    isLoading: _loadingLahan,
                    enabled: !isLoading,
                    onSearch: _searchLahan,
                    onChanged: (option) => setState(() {
                      _selectedLahan = option;
                      _score = null;
                    }),
                    validator: (v) =>
                        Validators.required(v, field: 'Lahan Petani'),
                  ),
                  if (selectedLahan != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.info_outline),
                        title: Text(selectedLahan.label),
                        subtitle: Text(selectedLahan.subtitle ?? ''),
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.lg),
                  UnderwritingScoreCard(
                    score: _score,
                    isLoading: _scoring,
                    onCalculate: _calculateScore,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AttachmentPickerSection(
                    title: 'Dokumen Pendukung',
                    hint: 'Unggah KTP, surat tanah, atau dokumen akseptasi.',
                    attachments: _documents,
                    enableCamera: true,
                    onChanged: (files) => setState(() {
                      _documents
                        ..clear()
                        ..addAll(files);
                    }),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AppButton(
                    label: isEdit ? 'Simpan Perubahan' : 'Ajukan Asuransi',
                    onPressed: isLoading ? null : _submit,
                    isLoading: isLoading,
                    isExpanded: true,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
