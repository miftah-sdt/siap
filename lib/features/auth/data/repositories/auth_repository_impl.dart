import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/exception_mapper.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:siap/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:siap/features/auth/data/models/login_request_model.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  }) : _remote = remoteDataSource,
       _local = localDataSource;

  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;

  @override
  Future<Result<User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remote.login(
        LoginRequestModel(email: email, password: password),
      );
      await _local.saveAuth(response);
      return Success(response.user.toEntity());
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _remote.logout();
      await _local.clearAuth();
      return const Success(null);
    } on AppException catch (e) {
      await _local.clearAuth();
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      await _local.clearAuth();
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> forgotPassword({required String email}) async {
    try {
      await _remote.forgotPassword(email);
      return const Success(null);
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<User?>> getCurrentUser() async {
    try {
      final cached = _local.getCachedUser();
      if (cached != null) return Success(cached);

      final profile = await _remote.getProfile();
      final user = profile.toEntity();
      await _local.saveUser(user);
      return Success(user);
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }
}
