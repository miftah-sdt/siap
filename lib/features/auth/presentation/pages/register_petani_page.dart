import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/services/registration_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/utils/validators.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_text_field.dart';

class RegisterPetaniPage extends StatefulWidget {
  const RegisterPetaniPage({super.key});

  @override
  State<RegisterPetaniPage> createState() => _RegisterPetaniPageState();
}

class _RegisterPetaniPageState extends State<RegisterPetaniPage> {
  final _formKey = GlobalKey<FormState>();
  final _nikController = TextEditingController();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _noHpController = TextEditingController();
  final _kelompokController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _nikController.dispose();
    _namaController.dispose();
    _alamatController.dispose();
    _noHpController.dispose();
    _kelompokController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_passwordController.text != _confirmPasswordController.text) {
      UiFeedback.showSnackBar(
        context,
        message: 'Konfirmasi password tidak cocok',
        isError: true,
      );
      return;
    }

    setState(() => _loading = true);
    try {
      await sl<RegistrationService>().registerPetani(
        nik: _nikController.text.trim(),
        nama: _namaController.text.trim(),
        alamat: _alamatController.text.trim(),
        noHp: _noHpController.text.trim(),
        kelompokTani: _kelompokController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Pendaftaran Berhasil'),
          content: const Text(
            'Akun Anda menunggu persetujuan admin/verifikator. '
            'Anda dapat login setelah disetujui.',
          ),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                context.go(RouteNames.login);
              },
              child: const Text('Ke Halaman Login'),
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
      appBar: AppBar(title: const Text('Daftar Petani')),
      body: SingleChildScrollView(
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
              const SizedBox(height: AppSpacing.lg),
              AppTextField(
                controller: _emailController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                controller: _passwordController,
                label: 'Password',
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
                controller: _confirmPasswordController,
                label: 'Konfirmasi Password',
                obscureText: true,
                validator: (v) =>
                    Validators.required(v, field: 'Konfirmasi Password'),
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: 'Daftar',
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
