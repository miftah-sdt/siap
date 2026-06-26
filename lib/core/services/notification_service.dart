import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      final android = _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      await android?.requestNotificationsPermission();
    }

    _initialized = true;
  }

  void _onNotificationTap(NotificationResponse response) {
    // Deep-link routing can be wired here via payload.
  }

  Future<void> show({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    if (!_initialized) await init();

    const androidDetails = AndroidNotificationDetails(
      'siap_default',
      'SIAP Notifikasi',
      channelDescription: 'Notifikasi status klaim, asuransi, dan sistem',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    await _plugin.show(
      id,
      title,
      body,
      const NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload: payload,
    );
  }

  Future<void> notifyKlaimSubmitted(String nomorKlaim) => show(
    id: 1001,
    title: 'Klaim Terkirim',
    body: 'Pengajuan klaim $nomorKlaim berhasil dikirim.',
    payload: 'klaim',
  );

  Future<void> notifyAsuransiRegistered(String nomorPolis) => show(
    id: 1002,
    title: 'Asuransi Terdaftar',
    body: 'Polis $nomorPolis berhasil didaftarkan.',
    payload: 'asuransi',
  );
}
