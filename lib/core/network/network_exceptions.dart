import 'package:dio/dio.dart';
import 'package:siap/core/errors/exception.dart';

class NetworkExceptionHandler {
  const NetworkExceptionHandler._();

  static AppException handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'Koneksi timeout. Periksa jaringan Anda.',
          code: 'TIMEOUT',
        );
      case DioExceptionType.connectionError:
        return const NetworkException(
          message: 'Tidak dapat terhubung ke server.',
          code: 'CONNECTION_ERROR',
        );
      case DioExceptionType.cancel:
        return const NetworkException(
          message: 'Permintaan dibatalkan.',
          code: 'CANCELLED',
        );
      case DioExceptionType.badResponse:
        return _handleBadResponse(error);
      case DioExceptionType.badCertificate:
        return const NetworkException(
          message:
              'Sertifikat server tidak valid atau tidak cocok dengan pin keamanan.',
          code: 'BAD_CERTIFICATE',
        );
      case DioExceptionType.unknown:
        return NetworkException(
          message: error.message ?? 'Terjadi kesalahan jaringan.',
          code: 'UNKNOWN',
        );
    }
  }

  static AppException _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final message =
        _extractMessage(error.response?.data) ?? _defaultMessage(statusCode);

    return switch (statusCode) {
      400 => ServerException(
        message: message,
        code: 'BAD_REQUEST',
        statusCode: statusCode,
      ),
      401 => AuthException(
        message: message,
        code: 'UNAUTHORIZED',
        statusCode: statusCode,
      ),
      403 => AuthException(
        message: message,
        code: 'FORBIDDEN',
        statusCode: statusCode,
      ),
      404 => ServerException(
        message: message,
        code: 'NOT_FOUND',
        statusCode: statusCode,
      ),
      422 => ServerException(
        message: message,
        code: 'VALIDATION_ERROR',
        statusCode: statusCode,
      ),
      500 || 502 || 503 => ServerException(
        message: message,
        code: 'SERVER_ERROR',
        statusCode: statusCode,
      ),
      _ => ServerException(
        message: message,
        code: 'HTTP_ERROR',
        statusCode: statusCode,
      ),
    };
  }

  static String? _extractMessage(dynamic data) {
    if (data is! Map<String, dynamic>) return null;

    final message = data['message'] ?? data['error'];
    if (message is String) return message;
    if (message is Map) {
      for (final value in message.values) {
        if (value is String) return value;
      }
    }
    return null;
  }

  static String _defaultMessage(int? statusCode) {
    return switch (statusCode) {
      400 => 'Permintaan tidak valid.',
      401 => 'Sesi berakhir. Silakan login kembali.',
      403 => 'Anda tidak memiliki akses.',
      404 => 'Data tidak ditemukan.',
      422 => 'Data yang dikirim tidak valid.',
      500 => 'Terjadi kesalahan pada server.',
      _ => 'Terjadi kesalahan. Coba lagi.',
    };
  }
}
