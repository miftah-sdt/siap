import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/services/open_meteo_service.dart';
import 'package:siap/core/services/rfi_remote_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/lahan_map_view.dart';
import 'package:siap/shared/widgets/opt_alerts_card.dart';
import 'package:siap/shared/widgets/weather_card.dart';

class LahanDetailPage extends StatefulWidget {
  const LahanDetailPage({super.key, required this.lahan});

  final Lahan lahan;

  @override
  State<LahanDetailPage> createState() => _LahanDetailPageState();
}

class _LahanDetailPageState extends State<LahanDetailPage> {
  WeatherForecast? _weather;
  List<OptAlert> _alerts = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadInsights();
  }

  Future<void> _loadInsights() async {
    try {
      final weatherFuture = sl<OpenMeteoService>().getForecastFromCoordinates(
        widget.lahan.koordinat,
      );
      final alertsFuture = sl<RfiRemoteService>().getOptAlerts(
        lahanId: widget.lahan.id,
      );
      final results = await Future.wait([weatherFuture, alertsFuture]);
      if (!mounted) return;
      setState(() {
        _weather = results[0] as WeatherForecast?;
        _alerts = results[1] as List<OptAlert>;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lahan = widget.lahan;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Lahan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final updated = await context.push<bool>(
                RouteNames.lahanEdit(lahan.id),
                extra: lahan,
              );
              if (updated == true && context.mounted) {
                context.pop(true);
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          LahanMapView(coordinates: lahan.koordinat, height: 240),
          const SizedBox(height: AppSpacing.lg),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Petani'),
            subtitle: Text(lahan.petaniNama),
          ),
          ListTile(
            leading: const Icon(Icons.qr_code_outlined),
            title: const Text('Kode Lahan'),
            subtitle: Text(lahan.kodeLahan),
          ),
          ListTile(
            leading: const Icon(Icons.landscape_outlined),
            title: const Text('Nama Lahan'),
            subtitle: Text(lahan.namaLahan),
          ),
          ListTile(
            leading: const Icon(Icons.square_foot_outlined),
            title: const Text('Luas'),
            subtitle: Text('${Formatter.decimal(lahan.luas)} ha'),
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Lokasi'),
            subtitle: Text(lahan.lokasi),
          ),
          ListTile(
            leading: const Icon(Icons.map_outlined),
            title: const Text('Koordinat'),
            subtitle: Text(lahan.koordinat ?? '-'),
          ),
          const SizedBox(height: AppSpacing.lg),
          WeatherCard(forecast: _weather, isLoading: _loading),
          const SizedBox(height: AppSpacing.lg),
          OptAlertsCard(alerts: _alerts, isLoading: _loading),
        ],
      ),
    );
  }
}
