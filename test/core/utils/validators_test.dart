import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/utils/validators.dart';

void main() {
  group('Validators.email', () {
    test('returns null for valid email', () {
      expect(Validators.email('user@example.com'), isNull);
      expect(Validators.email('admin@siap.local'), isNull);
    });

    test('returns error for empty email', () {
      expect(Validators.email(''), isNotNull);
    });

    test('returns error for invalid format', () {
      expect(Validators.email('not-an-email'), isNotNull);
    });
  });

  group('Validators.password', () {
    test('returns null for valid password', () {
      expect(Validators.password('password123'), isNull);
    });

    test('returns error when too short', () {
      expect(Validators.password('short'), isNotNull);
    });
  });

  group('Validators.nik', () {
    test('returns null for 16 digit NIK', () {
      expect(Validators.nik('3201010101010001'), isNull);
    });

    test('returns error for non-numeric NIK', () {
      expect(Validators.nik('320101010101000A'), isNotNull);
    });
  });

  group('Validators.luas', () {
    test('returns null for positive number', () {
      expect(Validators.luas('2.5'), isNull);
    });

    test('returns error for zero or negative', () {
      expect(Validators.luas('0'), isNotNull);
    });
  });
}
