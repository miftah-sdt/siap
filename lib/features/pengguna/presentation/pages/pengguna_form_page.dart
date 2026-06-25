import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/utils/validators.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_form_bloc.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_form_event.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_form_state.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_text_field.dart';

class PenggunaFormPage extends StatefulWidget {
  const PenggunaFormPage({super.key, this.pengguna});

  final Pengguna? pengguna;

  @override
  State<PenggunaFormPage> createState() => _PenggunaFormPageState();
}

class _PenggunaFormPageState extends State<PenggunaFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late UserRole _selectedRole;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.pengguna?.name);
    _emailController = TextEditingController(text: widget.pengguna?.email);
    _selectedRole = widget.pengguna?.role ?? UserRole.operator;
    _isActive = widget.pengguna?.isActive ?? true;
    context.read<PenggunaFormBloc>().add(
      PenggunaFormEvent.started(pengguna: widget.pengguna),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<PenggunaFormBloc>().add(
      PenggunaFormEvent.submitted(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        role: _selectedRole,
        isActive: _isActive,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.pengguna != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Pengguna' : 'Tambah Pengguna')),
      body: BlocConsumer<PenggunaFormBloc, PenggunaFormState>(
        listener: (context, state) {
          if (state is PenggunaFormSuccess) {
            UiFeedback.showSnackBar(
              context,
              message: isEdit
                  ? 'Data pengguna berhasil diperbarui.'
                  : 'Data pengguna berhasil ditambahkan.',
            );
            context.pop(true);
          }
          if (state is PenggunaFormError) {
            UiFeedback.showSnackBar(
              context,
              message: state.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is PenggunaFormLoading;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    controller: _nameController,
                    label: 'Nama',
                    validator: (v) => Validators.required(v, field: 'Nama'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _emailController,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  DropdownButtonFormField<UserRole>(
                    value: _selectedRole,
                    decoration: const InputDecoration(
                      labelText: 'Role',
                      prefixIcon: Icon(Icons.admin_panel_settings_outlined),
                    ),
                    items: UserRole.values
                        .map(
                          (role) => DropdownMenuItem(
                            value: role,
                            child: Text(role.label),
                          ),
                        )
                        .toList(),
                    onChanged: isLoading
                        ? null
                        : (value) {
                            if (value != null) {
                              setState(() => _selectedRole = value);
                            }
                          },
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SwitchListTile(
                    title: const Text('Status Aktif'),
                    subtitle: Text(
                      _isActive
                          ? 'Pengguna dapat login ke sistem'
                          : 'Pengguna tidak dapat login',
                    ),
                    value: _isActive,
                    onChanged: isLoading
                        ? null
                        : (value) => setState(() => _isActive = value),
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
