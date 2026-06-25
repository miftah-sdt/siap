enum AppEnvironment { development, staging, production }

class Env {
  const Env._();

  static const AppEnvironment current = AppEnvironment.development;

  static String get baseUrl {
    switch (current) {
      case AppEnvironment.development:
        return 'https://dev-api.siap.local/v1';
      case AppEnvironment.staging:
        return 'https://staging-api.siap.local/v1';
      case AppEnvironment.production:
        return 'https://api.siap.local/v1';
    }
  }

  static bool get enableNetworkLogging => current != AppEnvironment.production;
}
