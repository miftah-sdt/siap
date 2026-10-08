import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/network/ssl_pinning_config.dart';
import 'package:siap/core/network/ssl_pinning_validator.dart';

void main() {
  group('SslPinningValidator', () {
    test('normalizeSha256Fingerprint matches Cloudflare tunnel cert', () {
      const opensslOutput =
          'SHA256 Fingerprint=33:85:C1:73:E2:89:6F:B8:09:E2:6A:CD:B5:1A:97:3E:5E:B4:F0:0B:0E:49:44:8B:0B:C8:7C:17:43:E3:31:25';
      expect(
        normalizeSha256Fingerprint(opensslOutput),
        SslPinningConfig.cloudflareTunnelPins.first,
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

    test('forApiHost enables pinning for Cloudflare tunnel host', () {
      final config = SslPinningConfig.forApiHost(
        enabled: true,
        apiBaseUrl:
            'https://weblog-preparing-packing-came.trycloudflare.com/v1',
      );

      expect(config.enabled, isTrue);
      expect(
        config.shouldPinHost(SslPinningConfig.cloudflareTunnelHost),
        isTrue,
      );
      expect(
        config.pinsForHost(SslPinningConfig.cloudflareTunnelHost),
        SslPinningConfig.cloudflareTunnelPins,
      );
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
        apiBaseUrl:
            'https://weblog-preparing-packing-came.trycloudflare.com/v1',
      );

      expect(config.enabled, isFalse);
    });
  });
}
