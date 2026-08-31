import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/config/env.dart';

void main() {
  group('Env API base URL repair', () {
    test('repairs CI-mangled Cloudflare URL', () {
      // Simulates broken compile-time override from GitHub Actions shell.
      const broken = 'https:weblog-preparing-packing-came.trycloudflare.comv1';
      final repaired = Env.sanitizeApiBaseUrlForTest(broken);
      expect(
        repaired,
        'https://weblog-preparing-packing-came.trycloudflare.com/v1',
      );
    });

    test('accepts valid https URL unchanged', () {
      const valid =
          'https://weblog-preparing-packing-came.trycloudflare.com/v1';
      expect(Env.sanitizeApiBaseUrlForTest(valid), valid);
    });

    test('returns null for empty or invalid URL', () {
      expect(Env.sanitizeApiBaseUrlForTest(''), isNull);
      expect(Env.sanitizeApiBaseUrlForTest('not-a-url'), isNull);
    });
  });
}
