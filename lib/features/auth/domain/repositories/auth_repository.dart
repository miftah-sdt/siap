import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Result<User>> login({required String email, required String password});

  Future<Result<void>> logout();

  Future<Result<void>> forgotPassword({required String email});

  Future<Result<User?>> getCurrentUser();
}
