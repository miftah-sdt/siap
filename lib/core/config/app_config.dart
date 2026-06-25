import 'package:siap/core/config/env.dart';

class AppConfig {
  const AppConfig({
    required this.appName,
    required this.baseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.enableNetworkLogging,
  });

  final String appName;
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final bool enableNetworkLogging;

  factory AppConfig.fromEnv() {
    return AppConfig(
      appName: 'SIAP',
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      enableNetworkLogging: Env.enableNetworkLogging,
    );
  }
}
