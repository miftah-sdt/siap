import 'package:crypto/crypto.dart';
import 'package:siap/core/network/ssl_pinning_config.dart';

/// Normalisasi fingerprint OpenSSL (`AA:BB:CC`) ke hex lowercase.
String normalizeSha256Fingerprint(String fingerprint) {
  return fingerprint
      .replaceFirst(RegExp(r'^sha256\s+fingerprint=', caseSensitive: false), '')
      .replaceAll(':', '')
      .toLowerCase();
}

/// SHA-256 fingerprint dari DER sertifikat (format hex lowercase).
String certificateSha256Fingerprint(List<int> der) {
  return sha256.convert(der).toString();
}

bool isCertificatePinned({
  required List<int>? der,
  required String host,
  required SslPinningConfig config,
}) {
  if (!config.shouldPinHost(host)) return true;
  if (der == null || der.isEmpty) return false;

  final actual = certificateSha256Fingerprint(der);
  final allowed = config.pinsForHost(host);
  return allowed.contains(actual);
}
