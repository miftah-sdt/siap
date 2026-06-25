import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/exception_mapper.dart';

void main() {
  group('mapExceptionToFailure', () {
    test('maps NetworkException to NetworkFailure', () {
      const exception = NetworkException(message: 'Timeout', code: 'TIMEOUT');
      final failure = mapExceptionToFailure(exception);

      expect(failure, isA<NetworkFailure>());
      expect(failure.message, 'Timeout');
    });

    test('maps AuthException to AuthFailure', () {
      const exception = AuthException(message: 'Unauthorized', statusCode: 401);
      final failure = mapExceptionToFailure(exception);

      expect(failure, isA<AuthFailure>());
      expect(failure.code, 401);
    });

    test('maps unknown AppException to UnknownFailure', () {
      const exception = AppException(message: 'Unknown');
      final failure = mapExceptionToFailure(exception);

      expect(failure, isA<UnknownFailure>());
    });
  });
}
