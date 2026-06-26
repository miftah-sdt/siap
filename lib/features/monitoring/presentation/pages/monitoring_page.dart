import 'package:flutter/material.dart';
import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/services/open_meteo_service.dart';
import 'package:siap/core/services/rfi_remote_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';
import 'package:siap/features/lahan/domain/usecases/lahan_usecases.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/shared/widgets/lahan_map_view.dart';
import 'package:siap/shared/widgets/opt_alerts_card.dart';
import 'package:siap/shared/widgets/weather_card.dart';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({super.key});

  @override
  State<MonitoringPage> createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  List<Lahan> _lahanList = [];
  Lahan? _selectedLahan;
  WeatherForecast? _weather;
  List<OptAlert> _alerts = [];
  bool _loadingLahan = true;
  bool _loadingInsights = false;

  @override
  void initState() {
    super.initState();
    _loadLahan();
  }

  Future<void> _loadLahan() async {
    setState(() => _loadingLahan = true);
    try {
      final result = await sl<GetLahanListUseCase>()(
        const GetLahanListParams(page: 1, limit: 50),
      );
      if (!mounted) return;
      if (result is! Success<LahanListResult>) {
        setState(() => _loadingLahan = false);
        return;
      }
      setState(() {
        _lahanList = result.data.items;
        _selectedLahan = result.data.items.isNotEmpty
            ? result.data.items.first
            : null;
        _loadingLahan = false;
      });
      if (_selectedLahan != null) {
        await _loadInsights(_selectedLahan!);
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingLahan = false);
    }
  }

  Future<void> _loadInsights(Lahan lahan) async {
    setState(() => _loadingInsights = true);
    try {
      final weatherFuture = sl<OpenMeteoService>().getForecastFromCoordinates(
        lahan.koordinat,
      );
      final alertsFuture = sl<RfiRemoteService>().getOptAlerts(
        lahanId: lahan.id,
      );
      final results = await Future.wait([weatherFuture, alertsFuture]);
      if (!mounted) return;
      setState(() {
        _weather = results[0] as WeatherForecast?;
        _alerts = results[1] as List<OptAlert>;
        _loadingInsights = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingInsights = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loadingLahan
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                Text(
                  'Monitoring Lahan',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  'Peta, cuaca, dan peringatan OPT berdasarkan lokasi lahan terdaftar.',
                ),
                const SizedBox(height: AppSpacing.lg),
                DropdownButtonFormField<String>(
                  initialValue: _selectedLahan?.id,
                  decoration: const InputDecoration(
                    labelText: 'Pilih Lahan',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    for (final lahan in _lahanList)
                      DropdownMenuItem(
                        value: lahan.id,
                        child: Text('${lahan.namaLahan} (${lahan.lokasi})'),
                      ),
                  ],
                  onChanged: (id) {
                    final lahan = _lahanList
                        .where((l) => l.id == id)
                        .firstOrNull;
                    if (lahan == null) return;
                    setState(() => _selectedLahan = lahan);
                    _loadInsights(lahan);
                  },
                ),
                const SizedBox(height: AppSpacing.lg),
                if (_selectedLahan != null) ...[
                  LahanMapView(
                    coordinates: _selectedLahan!.koordinat,
                    height: 280,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  WeatherCard(forecast: _weather, isLoading: _loadingInsights),
                  const SizedBox(height: AppSpacing.lg),
                  OptAlertsCard(alerts: _alerts, isLoading: _loadingInsights),
                ],
              ],
            ),
    );
  }
}
