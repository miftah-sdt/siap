import 'package:dio/dio.dart';
import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/utils/coordinate_parser.dart';
import 'package:latlong2/latlong.dart';

class OpenMeteoService {
  OpenMeteoService()
    : _dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 15)));

  final Dio _dio;

  Future<WeatherForecast?> getForecast(LatLng point) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'https://api.open-meteo.com/v1/forecast',
        queryParameters: {
          'latitude': point.latitude,
          'longitude': point.longitude,
          'current':
              'temperature_2m,relative_humidity_2m,wind_speed_10m,precipitation,weather_code',
          'timezone': 'auto',
        },
      );

      final current = response.data?['current'] as Map<String, dynamic>?;
      if (current == null) return null;

      final code = (current['weather_code'] as num?)?.toInt() ?? 0;
      return WeatherForecast(
        temperature: (current['temperature_2m'] as num?)?.toDouble() ?? 0,
        humidity: (current['relative_humidity_2m'] as num?)?.toDouble() ?? 0,
        windSpeed: (current['wind_speed_10m'] as num?)?.toDouble() ?? 0,
        precipitation: (current['precipitation'] as num?)?.toDouble() ?? 0,
        weatherCode: code,
        summary: _weatherSummary(code),
      );
    } catch (_) {
      return null;
    }
  }

  Future<WeatherForecast?> getForecastFromCoordinates(String? raw) async {
    final point = CoordinateParser.parse(raw);
    if (point == null) return null;
    return getForecast(point);
  }

  String _weatherSummary(int code) {
    if (code == 0) return 'Cerah';
    if (code <= 3) return 'Berawan';
    if (code <= 67) return 'Hujan';
    if (code <= 77) return 'Salju';
    return 'Cuaca ekstrem';
  }
}
