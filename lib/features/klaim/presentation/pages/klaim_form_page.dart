import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/utils/validators.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_form_bloc.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_form_event.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_form_state.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_text_field.dart';

class KlaimFormPage extends StatefulWidget {
  const KlaimFormPage({super.key, this.klaim});

  final Klaim? klaim;

  @override
  State<KlaimFormPage> createState() => _KlaimFormPageState();
}

class _KlaimFormPageState extends State<KlaimFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nomorKlaimController;
  late final TextEditingController _polisIdController;
  late final TextEditingController _polisNomorController;
  late final TextEditingController _deskripsiController;
  late final TextEditingController _buktiController;
  final List<String> _buktiKerusakan = [];

  @override
  void initState() {
    super.initState();
    _nomorKlaimController = TextEditingController(
      text: widget.klaim?.nomorKlaim,
    );
    _polisIdController = TextEditingController(text: widget.klaim?.polisId);
    _polisNomorController = TextEditingController(
      text: widget.klaim?.polisNomor,
    );
    _deskripsiController = TextEditingController(text: widget.klaim?.deskripsi);
    _buktiController = TextEditingController();
    if (widget.klaim != null) {
      _buktiKerusakan.addAll(widget.klaim!.buktiKerusakan);
    }
    context.read<KlaimFormBloc>().add(
      KlaimFormEvent.started(klaim: widget.klaim),
    );
  }

  @override
  void dispose() {
    _nomorKlaimController.dispose();
    _polisIdController.dispose();
    _polisNomorController.dispose();
    _deskripsiController.dispose();
    _buktiController.dispose();
    super.dispose();
  }

  void _addBukti() {
    final name = _buktiController.text.trim();
    if (name.isEmpty) return;
    setState(() {
      _buktiKerusakan.add(name);
      _buktiController.clear();
    });
  }

  void _removeBukti(int index) {
    setState(() => _buktiKerusakan.removeAt(index));
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<KlaimFormBloc>().add(
      KlaimFormEvent.submitted(
        nomorKlaim: _nomorKlaimController.text.trim(),
        polisId: _polisIdController.text.trim(),
        polisNomor: _polisNomorController.text.trim(),
        deskripsi: _deskripsiController.text.trim(),
        buktiKerusakan: List.unmodifiable(_buktiKerusakan),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.klaim != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Klaim' : 'Ajukan Klaim')),
      body: BlocConsumer<KlaimFormBloc, KlaimFormState>(
        listener: (context, state) {
          if (state is KlaimFormSuccess) {
            UiFeedback.showSnackBar(
              context,
              message: isEdit
                  ? 'Data klaim berhasil diperbarui.'
                  : 'Pengajuan klaim berhasil.',
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
                  AppTextField(
                    controller: _polisIdController,
                    label: 'ID Polis',
                    validator: (v) => Validators.required(v, field: 'ID Polis'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _polisNomorController,
                    label: 'Nomor Polis',
                    validator: (v) =>
                        Validators.required(v, field: 'Nomor Polis'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _deskripsiController,
                    label: 'Deskripsi Kerusakan',
                    maxLines: 4,
                    validator: (v) =>
                        Validators.required(v, field: 'Deskripsi'),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Bukti Kerusakan',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: _buktiController,
                          label: 'Nama Bukti',
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) => _addBukti(),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.sm),
                        child: IconButton.filled(
                          onPressed: _addBukti,
                          icon: const Icon(Icons.add),
                          tooltip: 'Tambah Bukti',
                        ),
                      ),
                    ],
                  ),
                  if (_buktiKerusakan.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.sm),
                    ...List.generate(_buktiKerusakan.length, (index) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: AppSpacing.xs),
                        child: ListTile(
                          leading: const Icon(Icons.image_outlined),
                          title: Text(_buktiKerusakan[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => _removeBukti(index),
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
