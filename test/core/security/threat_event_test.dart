import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/security/threat_event.dart';

void main() {
  group('ThreatEvent', () {
    test('fromMap maps DoveRunner broadcast payload', () {
      final event = ThreatEvent.fromMap({
        'threat_code': 'D10001',
        'code': 10001,
        'message': 'Root access detected',
        'category': 'rooted_device',
        'severity': 'critical',
        'platform': 'android',
        'will_kill_app': false,
        'detected_at': '2026-07-08T08:30:00.000Z',
        'extra': {'source': 'doverunner_broadcast'},
      });

      expect(event.threatCode, 'D10001');
      expect(event.code, 10001);
      expect(event.category, 'rooted_device');
      expect(event.willKillApp, isFalse);
      expect(event.extra?['source'], 'doverunner_broadcast');
    });

    test('parses numeric code from threat_code when code missing', () {
      final event = ThreatEvent.fromMap({
        'threat_code': 'D11001',
        'message': 'Emulator detected',
        'category': 'android_emulator',
        'platform': 'android',
        'detected_at': '2026-07-08T08:30:00.000Z',
      });

      expect(event.code, 11001);
      expect(event.threatCode, 'D11001');
    });

    test('dedupeKey buckets timestamp every 5 seconds', () {
      final event = ThreatEvent(
        threatCode: 'D10001',
        code: 10001,
        message: 'Root',
        category: 'rooted_device',
        platform: 'android',
        detectedAt: DateTime.utc(2026, 7, 8, 8, 30, 3),
      );

      final sameBucket = ThreatEvent(
        threatCode: 'D10001',
        code: 10001,
        message: 'Root',
        category: 'rooted_device',
        platform: 'android',
        detectedAt: DateTime.utc(2026, 7, 8, 8, 30, 4),
      );

      final nextBucket = ThreatEvent(
        threatCode: 'D10001',
        code: 10001,
        message: 'Root',
        category: 'rooted_device',
        platform: 'android',
        detectedAt: DateTime.utc(2026, 7, 8, 8, 30, 6),
      );

      expect(event.dedupeKey, sameBucket.dedupeKey);
      expect(event.dedupeKey, isNot(nextBucket.dedupeKey));
    });

    test('fromMap maps D13001 usb debugging threat', () {
      final event = ThreatEvent.fromMap({
        'threat_code': 'D13001',
        'code': 13001,
        'message': 'USB debugging enabled',
        'category': 'usb_debugging',
        'severity': 'low',
        'platform': 'android',
        'will_kill_app': false,
        'detected_at': '2026-07-20T10:20:57.000Z',
      });

      expect(event.threatCode, 'D13001');
      expect(event.code, 13001);
      expect(event.category, 'usb_debugging');
    });

    test('toApiPayload includes threat_code for API', () {
      final event = ThreatEvent(
        threatCode: 'D13002',
        code: 13002,
        message: 'USB debugging enabled',
        category: 'usb_debugging',
        platform: 'android',
        detectedAt: DateTime.utc(2026, 7, 8, 8, 30),
      );

      final payload = event.toApiPayload(userId: 'user-1', appVersion: '1.0.0');

      expect(payload['code'], 13002);
      expect(payload['threat_code'], 'D13002');
      expect(payload['user_id'], 'user-1');
      expect(payload['app_version'], '1.0.0');
    });
  });
}
