import 'package:flutter/foundation.dart';

enum AppEnvironment { development, staging, production }

class Env {
  const Env._();

  static const AppEnvironment current = AppEnvironment.development;

  /// Base URL API SIAP.
  ///
  /// Development memakai Express API lokal (`d:/project_flutter/api`).
  /// Android Emulator: ganti ke `http://10.0.2.2:3000/v1` atau `adb reverse tcp:3000 tcp:3000`.
  static String get baseUrl {
    switch (current) {
      case AppEnvironment.development:
        return _developmentBaseUrl;
      case AppEnvironment.staging:
        return 'https://staging-api.siap.local/v1';
      case AppEnvironment.production:
        return 'https://api.siap.local/v1';
    }
  }

  static String get _developmentBaseUrl {
    if (kIsWeb) {
      return 'http://localhost:3000/v1';
    }
    // Mobile/desktop native — localhost untuk iOS simulator & desktop.
    // Untuk Android emulator gunakan 10.0.2.2 jika localhost tidak terjangkau.
    return 'http://localhost:3000/v1';
  }

  static bool get enableNetworkLogging => current != AppEnvironment.production;
}
