import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/config/env.dart';

void main() {
  group('Env API base URL repair', () {
    test('repairs CI-mangled Railway URL', () {
      // Simulates broken compile-time override from GitHub Actions shell.
      const broken = 'https:siap-api-production.up.railway.appv1';
      final repaired = Env.sanitizeApiBaseUrlForTest(broken);
      expect(repaired, 'https://siap-api-production.up.railway.app/v1');
    });

    test('accepts valid https URL unchanged', () {
      const valid = 'https://siap-api-production.up.railway.app/v1';
      expect(Env.sanitizeApiBaseUrlForTest(valid), valid);
    });

    test('returns null for empty or invalid URL', () {
      expect(Env.sanitizeApiBaseUrlForTest(''), isNull);
      expect(Env.sanitizeApiBaseUrlForTest('not-a-url'), isNull);
    });
  });
}
