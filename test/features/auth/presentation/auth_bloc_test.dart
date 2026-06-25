import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:siap/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:siap/features/auth/domain/usecases/login_usecase.dart';
import 'package:siap/features/auth/domain/usecases/logout_usecase.dart';
import 'package:siap/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:siap/features/auth/presentation/bloc/auth_event.dart';
import 'package:siap/features/auth/presentation/bloc/auth_state.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockLogoutUseCase extends Mock implements LogoutUseCase {}

class MockForgotPasswordUseCase extends Mock implements ForgotPasswordUseCase {}

class MockGetCurrentUserUseCase extends Mock implements GetCurrentUserUseCase {}

void main() {
  late MockLoginUseCase loginUseCase;
  late MockLogoutUseCase logoutUseCase;
  late MockForgotPasswordUseCase forgotPasswordUseCase;
  late MockGetCurrentUserUseCase getCurrentUserUseCase;

  setUpAll(() {
    registerFallbackValue(
      const LoginParams(email: 'test@email.com', password: 'password'),
    );
  });

  setUp(() {
    loginUseCase = MockLoginUseCase();
    logoutUseCase = MockLogoutUseCase();
    forgotPasswordUseCase = MockForgotPasswordUseCase();
    getCurrentUserUseCase = MockGetCurrentUserUseCase();
  });

  blocTest<AuthBloc, AuthState>(
    'emits authenticated when login succeeds',
    build: () => AuthBloc(
      loginUseCase: loginUseCase,
      logoutUseCase: logoutUseCase,
      forgotPasswordUseCase: forgotPasswordUseCase,
      getCurrentUserUseCase: getCurrentUserUseCase,
    ),
    act: (bloc) {
      when(() => loginUseCase(any())).thenAnswer(
        (_) async => const Success(
          User(
            id: '1',
            name: 'Admin',
            email: 'admin@siap.local',
            role: UserRole.admin,
          ),
        ),
      );
      bloc.add(
        const AuthEvent.loginSubmitted(
          email: 'admin@siap.local',
          password: 'password123',
        ),
      );
    },
    expect: () => [const AuthState.loading(), isA<AuthAuthenticated>()],
  );
}
