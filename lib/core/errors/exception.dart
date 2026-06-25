class AppException implements Exception {
  const AppException({required this.message, this.code, this.statusCode});

  final String message;
  final String? code;
  final int? statusCode;

  @override
  String toString() =>
      'AppException(message: $message, code: $code, statusCode: $statusCode)';
}

class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.code,
    super.statusCode,
  });
}

class ServerException extends AppException {
  const ServerException({required super.message, super.code, super.statusCode});
}

class AuthException extends AppException {
  const AuthException({required super.message, super.code, super.statusCode});
}

class CacheException extends AppException {
  const CacheException({required super.message, super.code, super.statusCode});
}
