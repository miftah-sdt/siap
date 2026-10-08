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
    // Fingerprint leaf CN=trycloudflare.com (berlaku 5 Okt 2026–3 Jan 2027).
    // Cloudflare memutar sertifikat edge secara berkala — perbarui saat gagal handshake.
    '3385c173e2896fb809e26acdb51a973e5eb4f00b0e49448b0bc87c1743e33125',
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
