/// Model event ancaman dari DoveRunner broadcast → Flutter.
class ThreatEvent {
  const ThreatEvent({
    required this.code,
    required this.message,
    required this.category,
    required this.platform,
    required this.detectedAt,
    this.threatCode,
    this.severity,
    this.willKillApp = false,
    this.deviceId,
    this.extra,
  });

  factory ThreatEvent.fromMap(Map<dynamic, dynamic> map) {
    final threatCode = map['threat_code'] as String?;
    final parsedCode = map['code'] as int? ?? _parseThreatCode(threatCode);

    return ThreatEvent(
      threatCode: threatCode,
      code: parsedCode,
      message: map['message'] as String? ?? 'Unknown threat',
      category: map['category'] as String? ?? 'unknown',
      severity: map['severity'] as String?,
      platform: map['platform'] as String? ?? 'unknown',
      willKillApp: map['will_kill_app'] as bool? ?? false,
      deviceId: map['device_id'] as String?,
      detectedAt:
          DateTime.tryParse(map['detected_at'] as String? ?? '') ??
          DateTime.now().toUtc(),
      extra: map['extra'] == null
          ? null
          : Map<String, dynamic>.from(map['extra'] as Map),
    );
  }

  /// Kode numerik (contoh: 10001 dari D10001) untuk API legacy.
  final int code;

  /// Kode DoveRunner asli (contoh: D10001).
  final String? threatCode;
  final String message;
  final String category;
  final String? severity;
  final String platform;
  final bool willKillApp;
  final String? deviceId;
  final DateTime detectedAt;
  final Map<String, dynamic>? extra;

  static int _parseThreatCode(String? threatCode) {
    if (threatCode == null || threatCode.isEmpty) {
      return 0;
    }
    final normalized = threatCode.trim().toUpperCase();
    if (normalized.startsWith('D')) {
      return int.tryParse(normalized.substring(1)) ?? 0;
    }
    return int.tryParse(normalized) ?? 0;
  }

  Map<String, dynamic> toApiPayload({String? userId, String? appVersion}) {
    return {
      'code': code,
      if (threatCode != null) 'threat_code': threatCode,
      'message': message,
      'category': category,
      if (severity != null) 'severity': severity,
      'platform': platform,
      'will_kill_app': willKillApp,
      'device_id': deviceId,
      'detected_at': detectedAt.toIso8601String(),
      'user_id': userId,
      'app_version': appVersion,
      if (extra != null) 'extra': extra,
    };
  }

  String get dedupeKey {
    final codeKey = threatCode ?? code.toString();
    final bucket = detectedAt.millisecondsSinceEpoch ~/ 5000;
    return '$codeKey-$bucket';
  }

  @override
  String toString() =>
      'ThreatEvent(threatCode=$threatCode, code=$code, category=$category, message=$message)';
}
