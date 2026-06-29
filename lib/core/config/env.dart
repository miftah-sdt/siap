import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

enum AppEnvironment { development, staging, production }

class Env {
  const Env._();

  /// Override saat build/deploy:
  /// `flutter build apk --dart-define=API_BASE_URL=https://siap-api-production.up.railway.app/v1`
  static const String _apiBaseUrlOverride = String.fromEnvironment(
    'API_BASE_URL',
  );

  static const AppEnvironment current = AppEnvironment.development;

  static const String productionBaseUrl =
      'https://siap-api-production.up.railway.app/v1';

  static String get baseUrl {
    if (_apiBaseUrlOverride.isNotEmpty) {
      return _apiBaseUrlOverride;
    }

    // APK/IPA release tanpa dart-define tetap pakai server production.
    if (kReleaseMode) {
      return productionBaseUrl;
    }

    switch (current) {
      case AppEnvironment.development:
        return _developmentBaseUrl;
      case AppEnvironment.staging:
      case AppEnvironment.production:
        return productionBaseUrl;
    }
  }

  static String get _developmentBaseUrl {
    if (kIsWeb) {
      return 'http://localhost:3000/v1';
    }
    // Emulator Android: localhost PC = 10.0.2.2
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000/v1';
    }
    return 'http://localhost:3000/v1';
  }

  static bool get enableNetworkLogging => !kReleaseMode;

  /// Nonaktifkan saat debug lokal: `--dart-define=ENABLE_SSL_PINNING=false`
  static const bool _sslPinningOverride = bool.fromEnvironment(
    'ENABLE_SSL_PINNING',
    defaultValue: true,
  );

  static bool get enableSslPinning {
    if (!_sslPinningOverride) return false;
    if (kIsWeb) return false;
    final url = baseUrl.toLowerCase();
    return url.startsWith('https://');
  }
}
