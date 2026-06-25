import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:siap/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:siap/features/auth/data/models/auth_response_model.dart';
import 'package:siap/features/auth/data/models/login_request_model.dart';
import 'package:siap/features/auth/data/models/user_model.dart';
import 'package:siap/features/auth/data/repositories/auth_repository_impl.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

void main() {
  late MockAuthRemoteDataSource remote;
  late MockAuthLocalDataSource local;
  late AuthRepositoryImpl repository;

  const authResponse = AuthResponseModel(
    accessToken: 'access',
    refreshToken: 'refresh',
    user: UserModel(
      id: '1',
      name: 'Admin',
      email: 'admin@siap.local',
      role: 'admin',
    ),
  );

  setUpAll(() {
    registerFallbackValue(
      const LoginRequestModel(email: 'a@b.com', password: 'password'),
    );
    registerFallbackValue(authResponse);
  });

  setUp(() {
    remote = MockAuthRemoteDataSource();
    local = MockAuthLocalDataSource();
    repository = AuthRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
    );
  });

  group('AuthRepositoryImpl.login', () {
    test('returns user and saves auth on success', () async {
      when(() => remote.login(any())).thenAnswer((_) async => authResponse);
      when(() => local.saveAuth(any())).thenAnswer((_) async {});

      final result = await repository.login(
        email: 'admin@siap.local',
        password: 'password123',
      );

      expect(result, isA<Success>());
      expect((result as Success).data.email, 'admin@siap.local');
      verify(() => local.saveAuth(authResponse)).called(1);
    });

    test('returns AuthFailure on AppException', () async {
      when(() => remote.login(any())).thenThrow(
        const AuthException(message: 'Invalid credentials', statusCode: 401),
      );

      final result = await repository.login(
        email: 'admin@siap.local',
        password: 'wrong',
      );

      expect(result, isA<ErrorResult>());
      expect((result as ErrorResult).failure, isA<AuthFailure>());
    });
  });

  group('AuthRepositoryImpl.logout', () {
    test('clears local session even when remote fails', () async {
      when(
        () => remote.logout(),
      ).thenThrow(const NetworkException(message: 'Offline'));
      when(() => local.clearAuth()).thenAnswer((_) async {});

      final result = await repository.logout();

      expect(result, isA<ErrorResult>());
      verify(() => local.clearAuth()).called(1);
    });
  });
}
