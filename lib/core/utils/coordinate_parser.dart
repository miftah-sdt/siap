import 'package:latlong2/latlong.dart';

class CoordinateParser {
  const CoordinateParser._();

  static LatLng? parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    final parts = raw.split(',');
    if (parts.length < 2) return null;
    final lat = double.tryParse(parts[0].trim());
    final lng = double.tryParse(parts[1].trim());
    if (lat == null || lng == null) return null;
    return LatLng(lat, lng);
  }

  static String format(LatLng point) {
    return '${point.latitude.toStringAsFixed(6)}, '
        '${point.longitude.toStringAsFixed(6)}';
  }
}
