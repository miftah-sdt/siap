import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/utils/validators.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';
import 'package:siap/features/petani/presentation/bloc/petani_form_bloc.dart';
import 'package:siap/features/petani/presentation/bloc/petani_form_event.dart';
import 'package:siap/features/petani/presentation/bloc/petani_form_state.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_text_field.dart';

class PetaniFormPage extends StatefulWidget {
  const PetaniFormPage({super.key, this.petani});

  final Petani? petani;

  @override
  State<PetaniFormPage> createState() => _PetaniFormPageState();
}

class _PetaniFormPageState extends State<PetaniFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nikController;
  late final TextEditingController _namaController;
  late final TextEditingController _alamatController;
  late final TextEditingController _noHpController;
  late final TextEditingController _kelompokController;

  @override
  void initState() {
    super.initState();
    _nikController = TextEditingController(text: widget.petani?.nik);
    _namaController = TextEditingController(text: widget.petani?.nama);
    _alamatController = TextEditingController(text: widget.petani?.alamat);
    _noHpController = TextEditingController(text: widget.petani?.noHp);
    _kelompokController = TextEditingController(
      text: widget.petani?.kelompokTani,
    );
    context.read<PetaniFormBloc>().add(
      PetaniFormEvent.started(petani: widget.petani),
    );
  }

  @override
  void dispose() {
    _nikController.dispose();
    _namaController.dispose();
    _alamatController.dispose();
    _noHpController.dispose();
    _kelompokController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<PetaniFormBloc>().add(
      PetaniFormEvent.submitted(
        nik: _nikController.text.trim(),
        nama: _namaController.text.trim(),
        alamat: _alamatController.text.trim(),
        noHp: _noHpController.text.trim(),
        kelompokTani: _kelompokController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.petani != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Petani' : 'Tambah Petani')),
      body: BlocConsumer<PetaniFormBloc, PetaniFormState>(
        listener: (context, state) {
          if (state is PetaniFormSuccess) {
            UiFeedback.showSnackBar(
              context,
              message: isEdit
                  ? 'Data petani berhasil diperbarui.'
                  : 'Data petani berhasil ditambahkan.',
            );
            context.pop(true);
          }
          if (state is PetaniFormError) {
            UiFeedback.showSnackBar(
              context,
              message: state.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is PetaniFormLoading;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    controller: _nikController,
                    label: 'NIK',
                    keyboardType: TextInputType.number,
                    validator: Validators.nik,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _namaController,
                    label: 'Nama',
                    validator: (v) => Validators.required(v, field: 'Nama'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _alamatController,
                    label: 'Alamat',
                    maxLines: 3,
                    validator: (v) => Validators.required(v, field: 'Alamat'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _noHpController,
                    label: 'No HP',
                    keyboardType: TextInputType.phone,
                    validator: Validators.phone,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _kelompokController,
                    label: 'Kelompok Tani',
                    validator: (v) =>
                        Validators.required(v, field: 'Kelompok Tani'),
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
