/// SHA-256 fingerprint sertifikat leaf (hex lowercase, tanpa pemisah `:`).
///
/// Perbarui daftar pin saat sertifikat API diperbarui:
/// ```bash
/// openssl s_client -connect weblog-preparing-packing-came.trycloudflare.com:443 \
///   -servername weblog-preparing-packing-came.trycloudflare.com </dev/null 2>/dev/null \
///   | openssl x509 -noout -fingerprint -sha256
/// ```
class SslPinningConfig {
  const SslPinningConfig({required this.enabled, required this.pinnedHosts});

  final bool enabled;

  /// Host → daftar SHA-256 fingerprint sertifikat yang diizinkan.
  final Map<String, List<String>> pinnedHosts;

  /// Host API produksi saat ini (Cloudflare Tunnel).
  static const String cloudflareTunnelHost =
      'weblog-preparing-packing-came.trycloudflare.com';

  static const List<String> cloudflareTunnelPins = [
    // Fingerprint leaf CN=trycloudflare.com (berlaku ~7 Agu–5 Nov 2026).
    // Cloudflare memutar sertifikat edge secara berkala — perbarui saat gagal handshake.
    'b06576060bb03ca9fe77efdb5ce6c34edf8ee97f1b4ff0ac48956af62e2e08d9',
  ];

  /// Cadangan jika rollback ke Railway.
  static const String railwayApiHost = 'siap-api-production.up.railway.app';

  static const List<String> railwayApiPins = [
    '351ec21cc7a43f881a86f3ce2f4872cf307244cd042bbcf69bbeb7e639d310b6',
    'd0971986fdb19fe936da41e20dfff66ced9754c1ba65660dd7b805cd69b7b131',
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
      cloudflareTunnelHost => cloudflareTunnelPins,
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
