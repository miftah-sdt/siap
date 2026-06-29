import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:siap/features/auth/presentation/bloc/auth_state.dart';

extension RoleContext on BuildContext {
  UserRole get userRole {
    final authState = read<AuthBloc>().state;
    if (authState is AuthAuthenticated) return authState.user.role;
    return UserRole.petani;
  }
}
