import 'package:flutter/foundation.dart';
import 'package:siap/core/security/appsealing_platform_channel.dart';
import 'package:siap/core/security/threat_event.dart';
import 'package:siap/core/security/threat_report_service.dart';

/// Orkestrator: AppSealing callback (native) → Flutter → Dio → REST API.
class ThreatGuard {
  ThreatGuard({
    required ThreatReportService reportService,
    AppSealingPlatformChannel? platformChannel,
    this.resolveUserId,
    this.appVersion = '1.0.0',
    this.onThreatUi,
  }) : _reportService = reportService,
       _platform = platformChannel ?? AppSealingPlatformChannel();

  final ThreatReportService _reportService;
  final AppSealingPlatformChannel _platform;
  final Future<String?> Function()? resolveUserId;
  final String appVersion;
  final void Function(ThreatEvent event)? onThreatUi;

  final Set<String> _reportedKeys = {};
  bool _started = false;

  Future<void> start() async {
    if (_started) return;
    _started = true;

    final active = await _platform.isAppSealingActive();
    debugPrint('[ThreatGuard] AppSealing active: $active');

    _platform.listen(_handleThreat);
  }

  Future<void> dispose() async {
    await _platform.dispose();
    _started = false;
  }

  Future<void> _handleThreat(ThreatEvent event) async {
    debugPrint('[ThreatGuard] detected: $event');
    onThreatUi?.call(event);

    if (_reportedKeys.contains(event.dedupeKey)) {
      return;
    }
    _reportedKeys.add(event.dedupeKey);

    final userId = await resolveUserId?.call();
    final idempotencyKey = event.dedupeKey;

    final result = await _reportService.reportThreat(
      event: event,
      userId: userId,
      appVersion: appVersion,
      idempotencyKey: idempotencyKey,
    );

    debugPrint(
      '[ThreatGuard] report ${result.success ? 'OK' : 'FAIL'}: ${result.message}',
    );

    await _platform.acknowledgeThreat(
      code: event.code,
      reported: result.success,
    );
  }
}
