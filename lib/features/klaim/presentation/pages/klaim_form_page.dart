import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/models/select_option.dart';
import 'package:siap/core/services/lookup_service.dart';
import 'package:siap/core/services/notification_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/utils/validators.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_form_bloc.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_form_event.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_form_state.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_select_field.dart';
import 'package:siap/shared/widgets/app_text_field.dart';
import 'package:siap/shared/widgets/attachment_picker_section.dart';

class KlaimFormPage extends StatefulWidget {
  const KlaimFormPage({super.key, this.klaim});

  final Klaim? klaim;

  @override
  State<KlaimFormPage> createState() => _KlaimFormPageState();
}

class _KlaimFormPageState extends State<KlaimFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nomorKlaimController;
  late final TextEditingController _deskripsiController;
  final List<String> _buktiKerusakan = [];

  List<SelectOption> _polisOptions = [];
  String? _selectedPolisId;
  bool _loadingPolis = true;

  LookupService get _lookup => sl<LookupService>();

  @override
  void initState() {
    super.initState();
    _nomorKlaimController = TextEditingController(
      text: widget.klaim?.nomorKlaim,
    );
    _deskripsiController = TextEditingController(text: widget.klaim?.deskripsi);
    _selectedPolisId = widget.klaim?.polisId;
    if (widget.klaim != null) {
      _buktiKerusakan.addAll(widget.klaim!.buktiKerusakan);
    }
    context.read<KlaimFormBloc>().add(
      KlaimFormEvent.started(klaim: widget.klaim),
    );
    _loadPolisOptions();
  }

  Future<void> _loadPolisOptions() async {
    setState(() => _loadingPolis = true);
    try {
      final options = await _lookup.getPolisOptions(
        statuses: const ['approved', 'verified', 'submitted'],
      );
      if (!mounted) return;
      setState(() {
        _polisOptions = options;
        _loadingPolis = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loadingPolis = false);
      UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
    }
  }

  SelectOption? get _selectedPolis {
    if (_selectedPolisId == null) return null;
    return _polisOptions.where((o) => o.id == _selectedPolisId).firstOrNull;
  }

  @override
  void dispose() {
    _nomorKlaimController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final polis = _selectedPolis;
    if (polis == null) return;

    final nomorPolis = polis.extra?['nomor_polis'] ?? polis.label;
    context.read<KlaimFormBloc>().add(
      KlaimFormEvent.submitted(
        nomorKlaim: _nomorKlaimController.text.trim(),
        polisId: polis.id,
        polisNomor: nomorPolis,
        deskripsi: _deskripsiController.text.trim(),
        buktiKerusakan: List.unmodifiable(_buktiKerusakan),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.klaim != null;
    final selectedPolis = _selectedPolis;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Klaim' : 'Pengajuan Klaim')),
      body: BlocConsumer<KlaimFormBloc, KlaimFormState>(
        listener: (context, state) {
          if (state is KlaimFormSuccess) {
            sl<NotificationService>().notifyKlaimSubmitted(
              _nomorKlaimController.text.trim(),
            );
            UiFeedback.showSnackBar(
              context,
              message: isEdit
                  ? 'Data klaim berhasil diperbarui.'
                  : 'Pengajuan klaim berhasil dikirim.',
            );
            context.pop(true);
          }
          if (state is KlaimFormError) {
            UiFeedback.showSnackBar(
              context,
              message: state.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is KlaimFormLoading;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextField(
                    controller: _nomorKlaimController,
                    label: 'Nomor Klaim',
                    validator: (v) =>
                        Validators.required(v, field: 'Nomor Klaim'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppSelectField(
                    label: 'Polis Asuransi',
                    prefixIcon: Icons.description_outlined,
                    options: _polisOptions,
                    value: _selectedPolisId,
                    isLoading: _loadingPolis,
                    enabled: !isLoading,
                    hint: _polisOptions.isEmpty && !_loadingPolis
                        ? 'Belum ada polis tersedia'
                        : 'Pilih nomor polis',
                    onChanged: (value) =>
                        setState(() => _selectedPolisId = value),
                    validator: (v) =>
                        Validators.required(v, field: 'Polis Asuransi'),
                  ),
                  if (!_loadingPolis && _polisOptions.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.sm),
                      child: Text(
                        'Ajukan akseptasi asuransi terlebih dahulu.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  if (selectedPolis != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.info_outline),
                        title: Text(selectedPolis.label),
                        subtitle: Text(selectedPolis.subtitle ?? ''),
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _deskripsiController,
                    label: 'Deskripsi Kerusakan',
                    maxLines: 4,
                    validator: (v) =>
                        Validators.required(v, field: 'Deskripsi'),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AttachmentPickerSection(
                    title: 'Bukti Kerusakan',
                    hint: 'Ambil foto dari kamera atau unggah bukti kerusakan.',
                    attachments: _buktiKerusakan,
                    enableCamera: true,
                    onChanged: (files) => setState(() {
                      _buktiKerusakan
                        ..clear()
                        ..addAll(files);
                    }),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AppButton(
                    label: isEdit ? 'Simpan Perubahan' : 'Ajukan Klaim',
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
