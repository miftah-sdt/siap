import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_text_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_newController.text != _confirmController.text) {
      UiFeedback.showSnackBar(
        context,
        message: 'Konfirmasi password tidak cocok',
        isError: true,
      );
      return;
    }

    setState(() => _loading = true);
    try {
      await sl<AuthRemoteDataSource>().changePassword(
        currentPassword: _currentController.text,
        newPassword: _newController.text,
      );
      if (!mounted) return;
      UiFeedback.showSnackBar(context, message: 'Password berhasil diubah');
      context.pop();
    } catch (e) {
      if (!mounted) return;
      UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ganti Password')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                controller: _currentController,
                label: 'Password Lama',
                obscureText: true,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Password lama wajib diisi' : null,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                controller: _newController,
                label: 'Password Baru',
                obscureText: true,
                validator: (v) {
                  if (v == null || v.length < 6) {
                    return 'Password minimal 6 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                controller: _confirmController,
                label: 'Konfirmasi Password Baru',
                obscureText: true,
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: 'Simpan',
                onPressed: _loading ? null : _submit,
                isLoading: _loading,
                isExpanded: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
