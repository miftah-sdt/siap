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
import 'package:siap/shared/widgets/app_search_select_field.dart';
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

  SelectOption? _selectedPolis;

  LookupService get _lookup => sl<LookupService>();

  @override
  void initState() {
    super.initState();
    _nomorKlaimController = TextEditingController(
      text: widget.klaim?.nomorKlaim,
    );
    _deskripsiController = TextEditingController(text: widget.klaim?.deskripsi);
    final existing = widget.klaim;
    if (existing != null) {
      _selectedPolis = SelectOption(
        id: existing.polisId,
        label: existing.polisNomor,
        extra: {'nomor_polis': existing.polisNomor},
      );
      _buktiKerusakan.addAll(existing.buktiKerusakan);
    }
    context.read<KlaimFormBloc>().add(
      KlaimFormEvent.started(klaim: widget.klaim),
    );
  }

  Future<List<SelectOption>> _searchPolis(String query) {
    return _lookup.getPolisOptions(
      statuses: const ['approved', 'verified', 'submitted'],
      search: query,
    );
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
                  AppSearchSelectField(
                    label: 'Polis Asuransi',
                    prefixIcon: Icons.description_outlined,
                    hint: 'Cari nomor polis atau nama petani',
                    value: _selectedPolis,
                    enabled: !isLoading,
                    onSearch: _searchPolis,
                    onChanged: (option) =>
                        setState(() => _selectedPolis = option),
                    validator: (v) =>
                        Validators.required(v, field: 'Polis Asuransi'),
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
