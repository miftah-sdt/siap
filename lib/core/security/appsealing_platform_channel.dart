import 'dart:async';

import 'package:flutter/services.dart';
import 'package:siap/core/security/threat_event.dart';

/// Bridge Flutter ← native AppSealing threat callback.
class AppSealingPlatformChannel {
  AppSealingPlatformChannel({
    EventChannel? eventChannel,
    MethodChannel? methodChannel,
  }) : _eventChannel =
           eventChannel ??
           const EventChannel(AppSealingPlatformChannel.channelName),
       _methodChannel =
           methodChannel ??
           const MethodChannel(AppSealingPlatformChannel.channelName);

  static const String channelName = 'com.siap/appsealing_threats';

  final EventChannel _eventChannel;
  final MethodChannel _methodChannel;

  StreamSubscription<dynamic>? _subscription;

  Stream<ThreatEvent> threatStream() {
    return _eventChannel.receiveBroadcastStream().map(
      (event) => ThreatEvent.fromMap(event as Map<dynamic, dynamic>),
    );
  }

  void listen(void Function(ThreatEvent event) onThreat) {
    _subscription?.cancel();
    _subscription = threatStream().listen(
      onThreat,
      onError: (Object error, StackTrace stack) {
        // ignore: avoid_print
        print('[AppSealing] channel error: $error');
      },
    );
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  Future<bool> acknowledgeThreat({
    required int code,
    required bool reported,
  }) async {
    final result = await _methodChannel.invokeMethod<bool>(
      'acknowledgeThreat',
      {'code': code, 'reported': reported},
    );
    return result ?? false;
  }

  Future<bool> isAppSealingActive() async {
    final result = await _methodChannel.invokeMethod<bool>(
      'isAppSealingActive',
    );
    return result ?? false;
  }
}
