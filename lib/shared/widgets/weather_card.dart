import 'package:flutter/material.dart';
import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/theme/app_spacing.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.forecast,
    this.isLoading = false,
  });

  final WeatherForecast? forecast;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (forecast == null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Icon(
                Icons.cloud_off_outlined,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(width: AppSpacing.md),
              const Expanded(
                child: Text(
                  'Data cuaca tidak tersedia. Isi koordinat lahan terlebih dahulu.',
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.wb_sunny_outlined),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Cuaca Lokasi',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              forecast!.summary,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            _MetricRow(
              label: 'Suhu',
              value: '${forecast!.temperature.toStringAsFixed(1)} °C',
            ),
            _MetricRow(
              label: 'Kelembapan',
              value: '${forecast!.humidity.toStringAsFixed(0)} %',
            ),
            _MetricRow(
              label: 'Angin',
              value: '${forecast!.windSpeed.toStringAsFixed(1)} km/j',
            ),
            _MetricRow(
              label: 'Curah hujan',
              value: '${forecast!.precipitation.toStringAsFixed(1)} mm',
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
