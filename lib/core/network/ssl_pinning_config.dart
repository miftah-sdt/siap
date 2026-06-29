/// SHA-256 fingerprint sertifikat leaf (hex lowercase, tanpa pemisah `:`).
///
/// Perbarui daftar pin saat sertifikat Railway diperbarui:
/// ```bash
/// openssl s_client -connect siap-api-production.up.railway.app:443 \
///   -servername siap-api-production.up.railway.app </dev/null 2>/dev/null \
///   | openssl x509 -noout -fingerprint -sha256
/// ```
class SslPinningConfig {
  const SslPinningConfig({required this.enabled, required this.pinnedHosts});

  final bool enabled;

  /// Host → daftar SHA-256 fingerprint sertifikat yang diizinkan.
  final Map<String, List<String>> pinnedHosts;

  static const String railwayApiHost = 'siap-api-production.up.railway.app';

  static const List<String> railwayApiPins = [
    'd0971986fdb19fe936da41e20dffff66ced9754c1ba65660dd7b805cd69b7b31',
  ];

  factory SslPinningConfig.forApiHost({
    required bool enabled,
    required String apiBaseUrl,
  }) {
    if (!enabled) {
      return const SslPinningConfig(enabled: false, pinnedHosts: {});
    }

    final host = Uri.tryParse(apiBaseUrl)?.host;
    if (host == null || host.isEmpty) {
      return const SslPinningConfig(enabled: false, pinnedHosts: {});
    }

    final pins = switch (host) {
      railwayApiHost => railwayApiPins,
      _ => <String>[],
    };

    if (pins.isEmpty) {
      return const SslPinningConfig(enabled: false, pinnedHosts: {});
    }

    return SslPinningConfig(enabled: true, pinnedHosts: {host: pins});
  }

  bool shouldPinHost(String host) => enabled && pinnedHosts.containsKey(host);

  List<String> pinsForHost(String host) => pinnedHosts[host] ?? const [];
}
