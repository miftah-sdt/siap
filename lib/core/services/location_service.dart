import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<bool> ensurePermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<bool> isServiceEnabled() => Geolocator.isLocationServiceEnabled();

  Future<Position> getCurrentPosition() async {
    final hasPermission = await ensurePermission();
    if (!hasPermission) {
      throw Exception('Izin lokasi ditolak. Aktifkan di pengaturan perangkat.');
    }

    final enabled = await isServiceEnabled();
    if (!enabled) {
      throw Exception('Layanan GPS tidak aktif. Nyalakan lokasi perangkat.');
    }

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 15),
      ),
    );
  }

  String formatCoordinates(Position position) {
    return '${position.latitude.toStringAsFixed(6)}, '
        '${position.longitude.toStringAsFixed(6)}';
  }
}
