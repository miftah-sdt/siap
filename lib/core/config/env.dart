import 'package:flutter/foundation.dart';

enum AppEnvironment { development, staging, production }

class Env {
  const Env._();

  /// Override saat build/deploy:
  /// `flutter build web --dart-define=API_BASE_URL=https://siap-api.onrender.com/v1`
  static const String _apiBaseUrlOverride = String.fromEnvironment('API_BASE_URL');

  static const AppEnvironment current = AppEnvironment.development;

  static String get baseUrl {
    if (_apiBaseUrlOverride.isNotEmpty) {
      return _apiBaseUrlOverride;
    }

    switch (current) {
      case AppEnvironment.development:
        return _developmentBaseUrl;
      case AppEnvironment.staging:
        return 'https://siap-api.onrender.com/v1';
      case AppEnvironment.production:
        return 'https://siap-api.onrender.com/v1';
    }
  }

  static String get _developmentBaseUrl {
    if (kIsWeb) {
      return 'http://localhost:3000/v1';
    }
    return 'http://localhost:3000/v1';
  }

  static bool get enableNetworkLogging => current != AppEnvironment.production;
}
