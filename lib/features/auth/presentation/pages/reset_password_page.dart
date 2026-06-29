import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_text_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, required this.token});

  final String token;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_passwordController.text != _confirmController.text) {
      UiFeedback.showSnackBar(
        context,
        message: 'Konfirmasi password tidak cocok',
        isError: true,
      );
      return;
    }

    setState(() => _loading = true);
    try {
      await sl<AuthRemoteDataSource>().resetPassword(
        token: widget.token,
        password: _passwordController.text,
      );
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Password Diperbarui'),
          content: const Text('Password berhasil diubah. Silakan login.'),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                context.go(RouteNames.login);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      );
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
      appBar: AppBar(title: const Text('Reset Password')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                controller: _passwordController,
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
                label: 'Simpan Password',
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
