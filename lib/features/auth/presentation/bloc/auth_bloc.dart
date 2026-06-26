import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:siap/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:siap/features/auth/domain/usecases/login_usecase.dart';
import 'package:siap/features/auth/domain/usecases/logout_usecase.dart';
import 'package:siap/features/auth/presentation/bloc/auth_event.dart';
import 'package:siap/features/auth/presentation/bloc/auth_state.dart';

import 'package:siap/routes/auth_router_refresh.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
    AuthRouterRefresh? authRouterRefresh,
  }) : _loginUseCase = loginUseCase,
       _logoutUseCase = logoutUseCase,
       _forgotPasswordUseCase = forgotPasswordUseCase,
       _getCurrentUserUseCase = getCurrentUserUseCase,
       _authRouterRefresh = authRouterRefresh,
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
  final AuthRouterRefresh? _authRouterRefresh;

  void _notifyRouter() => _authRouterRefresh?.notifyAuthChanged();

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
          _notifyRouter();
        } else {
          emit(const AuthState.unauthenticated());
          _notifyRouter();
        }
      case ErrorResult():
        emit(const AuthState.unauthenticated());
        _notifyRouter();
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
        _notifyRouter();
      case ErrorResult(:final failure):
        emit(AuthState.error(failure.message));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _logoutUseCase(const NoParams());
    emit(const AuthState.unauthenticated());
    _notifyRouter();
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
