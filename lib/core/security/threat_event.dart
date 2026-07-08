/// Model event ancaman dari native AppSealing → Flutter.
class ThreatEvent {
  const ThreatEvent({
    required this.code,
    required this.message,
    required this.category,
    required this.platform,
    required this.detectedAt,
    this.willKillApp = true,
    this.deviceId,
    this.extra,
  });

  factory ThreatEvent.fromMap(Map<dynamic, dynamic> map) {
    return ThreatEvent(
      code: map['code'] as int? ?? 0,
      message: map['message'] as String? ?? 'Unknown threat',
      category: map['category'] as String? ?? 'unknown',
      platform: map['platform'] as String? ?? 'unknown',
      willKillApp: map['will_kill_app'] as bool? ?? true,
      deviceId: map['device_id'] as String?,
      detectedAt:
          DateTime.tryParse(map['detected_at'] as String? ?? '') ??
          DateTime.now().toUtc(),
      extra: map['extra'] == null
          ? null
          : Map<String, dynamic>.from(map['extra'] as Map),
    );
  }

  final int code;
  final String message;
  final String category;
  final String platform;
  final bool willKillApp;
  final String? deviceId;
  final DateTime detectedAt;
  final Map<String, dynamic>? extra;

  Map<String, dynamic> toApiPayload({String? userId, String? appVersion}) {
    return {
      'code': code,
      'message': message,
      'category': category,
      'platform': platform,
      'will_kill_app': willKillApp,
      'device_id': deviceId,
      'detected_at': detectedAt.toIso8601String(),
      'user_id': userId,
      'app_version': appVersion,
      if (extra != null) 'extra': extra,
    };
  }

  @override
  String toString() =>
      'ThreatEvent(code=$code, category=$category, message=$message)';
}
