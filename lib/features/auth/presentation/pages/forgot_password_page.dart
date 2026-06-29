import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/utils/validators.dart';
import 'package:siap/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:siap/features/auth/presentation/bloc/auth_event.dart';
import 'package:siap/features/auth/presentation/bloc/auth_state.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      AuthEvent.forgotPasswordSubmitted(email: _emailController.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lupa Password')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthForgotPasswordSent) {
            UiFeedback.showSnackBar(
              context,
              message: 'Link reset password telah dikirim ke email Anda.',
            );
            context.pop();
          }
          if (state is AuthError) {
            UiFeedback.showSnackBar(
              context,
              message: state.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Masukkan email terdaftar. Kami akan mengirimkan '
                    'link reset password ke email Anda jika terdaftar.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppTextField(
                    controller: _emailController,
                    label: 'Email',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppButton(
                    label: 'Kirim Link Reset',
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
