import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/models/select_option.dart';
import 'package:siap/core/services/lookup_service.dart';
import 'package:siap/core/services/notification_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/utils/validators.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_bloc.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_event.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_state.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_select_field.dart';
import 'package:siap/shared/widgets/app_text_field.dart';
import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/services/rfi_remote_service.dart';
import 'package:siap/features/asuransi/presentation/widgets/underwriting_score_card.dart';
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

  List<SelectOption> _petaniOptions = [];
  List<SelectOption> _lahanOptions = [];
  String? _selectedPetaniId;
  String? _selectedLahanId;
  bool _loadingPetani = true;
  bool _loadingLahan = false;
  bool _scoring = false;
  UnderwritingScore? _score;

  LookupService get _lookup => sl<LookupService>();

  @override
  void initState() {
    super.initState();
    _nomorPolisController = TextEditingController(
      text: widget.asuransi?.nomorPolis,
    );
    _selectedPetaniId = widget.asuransi?.petaniId;
    _selectedLahanId = widget.asuransi?.lahanId;
    if (widget.asuransi != null) {
      _documents.addAll(widget.asuransi!.documents);
      if (widget.asuransi!.riskScore != null) {
        _score = UnderwritingScore(
          riskScore: widget.asuransi!.riskScore!,
          riskLevel: widget.asuransi!.riskLevel ?? 'sedang',
          factors: widget.asuransi!.scoreFactors,
          scoredAt: widget.asuransi!.scoredAt,
        );
      }
    }
    context.read<AsuransiFormBloc>().add(
      AsuransiFormEvent.started(asuransi: widget.asuransi),
    );
    _initOptions();
  }

  Future<void> _initOptions() async {
    await _loadPetaniOptions();
    if (_selectedPetaniId != null) {
      await _loadLahanOptions(_selectedPetaniId!);
    }
  }

  Future<void> _loadPetaniOptions() async {
    setState(() => _loadingPetani = true);
    try {
      final options = await _lookup.getPetaniOptions();
      if (!mounted) return;
      setState(() {
        _petaniOptions = options;
        _loadingPetani = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loadingPetani = false);
      UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
    }
  }

  Future<void> _loadLahanOptions(String petaniId) async {
    setState(() => _loadingLahan = true);
    try {
      final options = await _lookup.getLahanOptions(petaniId: petaniId);
      if (!mounted) return;
      setState(() {
        _lahanOptions = options;
        _loadingLahan = false;
        if (_selectedLahanId != null &&
            !options.any((o) => o.id == _selectedLahanId)) {
          _selectedLahanId = null;
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loadingLahan = false);
      UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
    }
  }

  void _onPetaniChanged(String? petaniId) {
    setState(() {
      _selectedPetaniId = petaniId;
      _selectedLahanId = null;
      _lahanOptions = [];
    });
    if (petaniId != null) {
      _loadLahanOptions(petaniId);
    }
  }

  String? _labelFor(List<SelectOption> options, String? id) {
    if (id == null) return null;
    return options.where((o) => o.id == id).map((o) => o.label).firstOrNull;
  }

  Future<void> _calculateScore() async {
    if (_selectedLahanId == null) {
      UiFeedback.showSnackBar(
        context,
        message: 'Pilih lahan terlebih dahulu.',
        isError: true,
      );
      return;
    }
    setState(() => _scoring = true);
    try {
      final score = await sl<RfiRemoteService>().scoreLahan(_selectedLahanId!);
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

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final petaniNama = _labelFor(_petaniOptions, _selectedPetaniId);
    final lahanNama = _labelFor(_lahanOptions, _selectedLahanId);
    if (petaniNama == null || lahanNama == null) return;

    context.read<AsuransiFormBloc>().add(
      AsuransiFormEvent.submitted(
        nomorPolis: _nomorPolisController.text.trim(),
        petaniId: _selectedPetaniId!,
        petaniNama: petaniNama,
        lahanId: _selectedLahanId!,
        lahanNama: lahanNama,
        documents: List.unmodifiable(_documents),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.asuransi != null;

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
                  AppSelectField(
                    label: 'Petani',
                    prefixIcon: Icons.person_outline,
                    options: _petaniOptions,
                    value: _selectedPetaniId,
                    isLoading: _loadingPetani,
                    enabled: !isLoading,
                    onChanged: _onPetaniChanged,
                    validator: (v) => Validators.required(v, field: 'Petani'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppSelectField(
                    label: 'Lahan',
                    prefixIcon: Icons.landscape_outlined,
                    options: _lahanOptions,
                    value: _selectedLahanId,
                    isLoading: _loadingLahan,
                    enabled: !isLoading && _selectedPetaniId != null,
                    hint: _selectedPetaniId == null
                        ? 'Pilih petani terlebih dahulu'
                        : 'Pilih lahan',
                    onChanged: (value) {
                      setState(() {
                        _selectedLahanId = value;
                        _score = null;
                      });
                    },
                    validator: (v) => Validators.required(v, field: 'Lahan'),
                  ),
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
