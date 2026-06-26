import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
  late final TextEditingController _petaniIdController;
  late final TextEditingController _petaniNamaController;
  late final TextEditingController _lahanIdController;
  late final TextEditingController _lahanNamaController;
  final List<String> _documents = [];

  @override
  void initState() {
    super.initState();
    _nomorPolisController = TextEditingController(
      text: widget.asuransi?.nomorPolis,
    );
    _petaniIdController = TextEditingController(
      text: widget.asuransi?.petaniId,
    );
    _petaniNamaController = TextEditingController(
      text: widget.asuransi?.petaniNama,
    );
    _lahanIdController = TextEditingController(text: widget.asuransi?.lahanId);
    _lahanNamaController = TextEditingController(
      text: widget.asuransi?.lahanNama,
    );
    if (widget.asuransi != null) {
      _documents.addAll(widget.asuransi!.documents);
    }
    context.read<AsuransiFormBloc>().add(
      AsuransiFormEvent.started(asuransi: widget.asuransi),
    );
  }

  @override
  void dispose() {
    _nomorPolisController.dispose();
    _petaniIdController.dispose();
    _petaniNamaController.dispose();
    _lahanIdController.dispose();
    _lahanNamaController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AsuransiFormBloc>().add(
      AsuransiFormEvent.submitted(
        nomorPolis: _nomorPolisController.text.trim(),
        petaniId: _petaniIdController.text.trim(),
        petaniNama: _petaniNamaController.text.trim(),
        lahanId: _lahanIdController.text.trim(),
        lahanNama: _lahanNamaController.text.trim(),
        documents: List.unmodifiable(_documents),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.asuransi != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Asuransi' : 'Daftar Asuransi')),
      body: BlocConsumer<AsuransiFormBloc, AsuransiFormState>(
        listener: (context, state) {
          if (state is AsuransiFormSuccess) {
            sl<NotificationService>().notifyAsuransiRegistered(
              _nomorPolisController.text.trim(),
            );
            UiFeedback.showSnackBar(
              context,
              message: isEdit
                  ? 'Data asuransi berhasil diperbarui.'
                  : 'Pendaftaran asuransi berhasil.',
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
                  AppTextField(
                    controller: _petaniIdController,
                    label: 'ID Petani',
                    validator: (v) =>
                        Validators.required(v, field: 'ID Petani'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _petaniNamaController,
                    label: 'Nama Petani',
                    validator: (v) =>
                        Validators.required(v, field: 'Nama Petani'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _lahanIdController,
                    label: 'ID Lahan',
                    validator: (v) => Validators.required(v, field: 'ID Lahan'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _lahanNamaController,
                    label: 'Nama Lahan',
                    validator: (v) =>
                        Validators.required(v, field: 'Nama Lahan'),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AttachmentPickerSection(
                    title: 'Dokumen',
                    hint: 'Unggah KTP, surat tanah, atau dokumen pendukung.',
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
                    label: isEdit ? 'Simpan Perubahan' : 'Simpan',
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
