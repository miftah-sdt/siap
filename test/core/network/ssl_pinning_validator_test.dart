import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/network/ssl_pinning_config.dart';
import 'package:siap/core/network/ssl_pinning_validator.dart';

void main() {
  group('SslPinningValidator', () {
    test('normalizeSha256Fingerprint matches Railway production cert', () {
      const opensslOutput =
          'SHA256 Fingerprint=D0:97:19:86:FD:B1:9F:E9:36:DA:41:E2:0D:FF:F6:6C:ED:97:54:C1:BA:65:66:0D:D7:B8:05:CD:69:B7:B1:31';
      expect(
        normalizeSha256Fingerprint(opensslOutput),
        SslPinningConfig.railwayApiPins.first,
      );
    });

    test('normalizeSha256Fingerprint removes colons and prefix', () {
      const raw =
          'SHA256 Fingerprint=D0:97:19:86:FD:B1:9F:E9:36:DA:41:E2:0D:FF:F6:6C';
      expect(
        normalizeSha256Fingerprint(raw),
        'd0971986fdb19fe936da41e20dfff66c',
      );
    });

    test('forApiHost enables pinning for Railway production host', () {
      final config = SslPinningConfig.forApiHost(
        enabled: true,
        apiBaseUrl: 'https://siap-api-production.up.railway.app/v1',
      );

      expect(config.enabled, isTrue);
      expect(config.shouldPinHost(SslPinningConfig.railwayApiHost), isTrue);
      expect(config.pinsForHost(SslPinningConfig.railwayApiHost), isNotEmpty);
    });

    test('forApiHost disables pinning for localhost', () {
      final config = SslPinningConfig.forApiHost(
        enabled: true,
        apiBaseUrl: 'http://localhost:3000/v1',
      );

      expect(config.enabled, isFalse);
    });

    test('forApiHost disables pinning when globally disabled', () {
      final config = SslPinningConfig.forApiHost(
        enabled: false,
        apiBaseUrl: 'https://siap-api-production.up.railway.app/v1',
      );

      expect(config.enabled, isFalse);
    });
  });
}
