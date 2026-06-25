import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';

Failure mapExceptionToFailure(AppException exception) {
  return switch (exception) {
    NetworkException() => NetworkFailure(
      message: exception.message,
      code: exception.statusCode,
    ),
    AuthException() => AuthFailure(
      message: exception.message,
      code: exception.statusCode,
    ),
    ServerException() => ServerFailure(
      message: exception.message,
      code: exception.statusCode,
    ),
    CacheException() => CacheFailure(
      message: exception.message,
      code: exception.statusCode,
    ),
    _ => UnknownFailure(message: exception.message, code: exception.statusCode),
  };
}
