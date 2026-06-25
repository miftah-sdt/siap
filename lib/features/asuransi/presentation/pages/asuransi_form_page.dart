import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/utils/validators.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_bloc.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_event.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_state.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_text_field.dart';

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
  late final TextEditingController _documentController;
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
    _documentController = TextEditingController();
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
    _documentController.dispose();
    super.dispose();
  }

  void _addDocument() {
    final name = _documentController.text.trim();
    if (name.isEmpty) return;
    setState(() {
      _documents.add(name);
      _documentController.clear();
    });
  }

  void _removeDocument(int index) {
    setState(() => _documents.removeAt(index));
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
                  Text(
                    'Dokumen',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: _documentController,
                          label: 'Nama Dokumen',
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) => _addDocument(),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.sm),
                        child: IconButton.filled(
                          onPressed: _addDocument,
                          icon: const Icon(Icons.add),
                          tooltip: 'Tambah Dokumen',
                        ),
                      ),
                    ],
                  ),
                  if (_documents.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.sm),
                    ...List.generate(_documents.length, (index) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: AppSpacing.xs),
                        child: ListTile(
                          leading: const Icon(Icons.description_outlined),
                          title: Text(_documents[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => _removeDocument(index),
                          ),
                        ),
                      );
                    }),
                  ],
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
