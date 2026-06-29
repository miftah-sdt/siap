import 'package:siap/core/config/env.dart';
import 'package:siap/core/network/ssl_pinning_config.dart';

class AppConfig {
  const AppConfig({
    required this.appName,
    required this.baseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.enableNetworkLogging,
    required this.sslPinningConfig,
  });

  final String appName;
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final bool enableNetworkLogging;
  final SslPinningConfig sslPinningConfig;

  factory AppConfig.fromEnv() {
    final baseUrl = Env.baseUrl;
    return AppConfig(
      appName: 'SIAP',
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      enableNetworkLogging: Env.enableNetworkLogging,
      sslPinningConfig: SslPinningConfig.forApiHost(
        enabled: Env.enableSslPinning,
        apiBaseUrl: baseUrl,
      ),
    );
  }
}
