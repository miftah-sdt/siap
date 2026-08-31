import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/network/ssl_pinning_config.dart';
import 'package:siap/core/network/ssl_pinning_validator.dart';

void main() {
  group('SslPinningValidator', () {
    test('normalizeSha256Fingerprint matches Cloudflare tunnel cert', () {
      const opensslOutput =
          'SHA256 Fingerprint=6F:AA:DA:4D:E8:40:82:B4:25:6F:B6:0F:5F:61:72:F3:E1:C5:EE:5E:29:4B:27:75:B3:67:12:02:78:C6:5A:D5';
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
