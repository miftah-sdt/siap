import 'package:flutter/foundation.dart';
import 'package:siap/core/config/env.dart';
import 'package:siap/core/security/threat_guard.dart';
import 'package:siap/injection/dependency_injection.dart';

/// Satu-satunya titik integrasi di [main.dart].
///
/// Rollback: set `ENABLE_THREAT_REPORTING=false` (default) atau hapus pemanggilan ini.
Future<void> bootstrapThreatReportingIfEnabled() async {
  if (!Env.enableThreatReporting) {
    return;
  }

  if (!sl.isRegistered<ThreatGuard>()) {
    debugPrint('[Security] ThreatGuard tidak terdaftar di DI');
    return;
  }

  await sl<ThreatGuard>().start();
}
