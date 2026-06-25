import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:siap/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:siap/features/auth/domain/usecases/login_usecase.dart';
import 'package:siap/features/auth/domain/usecases/logout_usecase.dart';
import 'package:siap/features/auth/presentation/bloc/auth_event.dart';
import 'package:siap/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
  }) : _loginUseCase = loginUseCase,
       _logoutUseCase = logoutUseCase,
       _forgotPasswordUseCase = forgotPasswordUseCase,
       _getCurrentUserUseCase = getCurrentUserUseCase,
       super(const AuthState.initial()) {
    on<AuthCheckStatus>(_onCheckStatus);
    on<AuthLoginSubmitted>(_onLoginSubmitted);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthForgotPasswordSubmitted>(_onForgotPasswordSubmitted);
  }

  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  Future<void> _onCheckStatus(
    AuthCheckStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _getCurrentUserUseCase(const NoParams());

    switch (result) {
      case Success(:final data):
        if (data != null) {
          emit(AuthState.authenticated(data));
        } else {
          emit(const AuthState.unauthenticated());
        }
      case ErrorResult():
        emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onLoginSubmitted(
    AuthLoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );

    switch (result) {
      case Success(:final data):
        emit(AuthState.authenticated(data));
      case ErrorResult(:final failure):
        emit(AuthState.error(failure.message));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    await _logoutUseCase(const NoParams());
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onForgotPasswordSubmitted(
    AuthForgotPasswordSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _forgotPasswordUseCase(
      ForgotPasswordParams(email: event.email),
    );

    switch (result) {
      case Success():
        emit(const AuthState.forgotPasswordSent());
      case ErrorResult(:final failure):
        emit(AuthState.error(failure.message));
    }
  }
}
