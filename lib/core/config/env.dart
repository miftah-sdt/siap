import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

enum AppEnvironment { development, staging, production }

class Env {
  const Env._();

  /// Override saat build/deploy:
  /// `flutter build apk --dart-define=API_BASE_URL=https://division-follow-louis-happen.trycloudflare.com/v1`
  static const String _apiBaseUrlOverride = String.fromEnvironment(
    'API_BASE_URL',
  );

  static const AppEnvironment current = AppEnvironment.development;

  static const String productionBaseUrl =
      'https://division-follow-louis-happen.trycloudflare.com/v1';

  static String get baseUrl {
    final override = _sanitizeApiBaseUrl(_apiBaseUrlOverride);
    if (override != null) return override;

    // APK/IPA/Web release tanpa dart-define tetap pakai server production.
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

  /// Perbaiki URL API yang rusak akibat shell CI (mis. `https:` tanpa `//`).
  static String? _sanitizeApiBaseUrl(String raw) {
    var url = raw.trim();
    if (url.isEmpty) return null;

    if (url.startsWith('https:') && !url.startsWith('https://')) {
      url = url.replaceFirst('https:', 'https://');
    }
    if (url.startsWith('http:') && !url.startsWith('http://')) {
      url = url.replaceFirst('http:', 'http://');
    }
    url = url.replaceAll('.appv1', '.app/v1');
    url = url.replaceAll('.comv1', '.com/v1');

    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || uri.host.isEmpty) return null;
    if (uri.scheme != 'http' && uri.scheme != 'https') return null;
    return url;
  }

  @visibleForTesting
  static String? sanitizeApiBaseUrlForTest(String raw) =>
      _sanitizeApiBaseUrl(raw);

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

  /// Arahkan Dio ke Burp/mitmproxy (Flutter tidak pakai proxy sistem Android).
  /// Emulator: `--dart-define=BURP_PROXY=10.0.2.2:8080`
  /// Wajib bersama `ENABLE_SSL_PINNING=false` agar sertifikat Burp diterima.
  static const String _burpProxyOverride = String.fromEnvironment('BURP_PROXY');

  static String? get burpProxy {
    final raw = _burpProxyOverride.trim();
    if (raw.isEmpty) return null;
    return raw;
  }

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

  /// AppSealing / DoveRunner threat reporting → REST API + popup alert.
  /// Nonaktifkan: `--dart-define=ENABLE_THREAT_REPORTING=false`
  static const bool enableThreatReporting = bool.fromEnvironment(
    'ENABLE_THREAT_REPORTING',
    defaultValue: true,
  );
}
