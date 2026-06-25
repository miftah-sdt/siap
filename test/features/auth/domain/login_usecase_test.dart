import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/auth/domain/repositories/auth_repository.dart';
import 'package:siap/features/auth/domain/usecases/login_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late LoginUseCase useCase;

  setUp(() {
    repository = MockAuthRepository();
    useCase = LoginUseCase(repository);
  });

  test('LoginUseCase returns user on success', () async {
    const user = User(
      id: '1',
      name: 'Test',
      email: 'test@email.com',
      role: UserRole.admin,
    );

    when(
      () => repository.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => const Success(user));

    final result = await useCase(
      const LoginParams(email: 'test@email.com', password: 'password123'),
    );

    expect(result, isA<Success<User>>());
    expect((result as Success<User>).data.email, 'test@email.com');
  });

  test('LoginUseCase returns failure on error', () async {
    when(
      () => repository.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer(
      (_) async => const ErrorResult(AuthFailure(message: 'Login gagal')),
    );

    final result = await useCase(
      const LoginParams(email: 'test@email.com', password: 'wrong'),
    );

    expect(result, isA<ErrorResult<User>>());
    expect((result as ErrorResult).failure.message, 'Login gagal');
  });
}
