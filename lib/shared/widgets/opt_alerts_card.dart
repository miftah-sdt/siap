import 'package:flutter/material.dart';
import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/theme/app_spacing.dart';

class OptAlertsCard extends StatelessWidget {
  const OptAlertsCard({
    super.key,
    required this.alerts,
    this.isLoading = false,
  });

  final List<OptAlert> alerts;
  final bool isLoading;

  Color _severityColor(BuildContext context, String severity) {
    return switch (severity.toLowerCase()) {
      'tinggi' => Theme.of(context).colorScheme.error,
      'sedang' => Colors.orange,
      _ => Theme.of(context).colorScheme.primary,
    };
  }

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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.bug_report_outlined),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Peringatan OPT',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            if (alerts.isEmpty)
              const Text('Tidak ada peringatan OPT untuk wilayah ini.')
            else
              ...alerts.map(
                (alert) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Chip(
                            label: Text(alert.severity.toUpperCase()),
                            backgroundColor: _severityColor(
                              context,
                              alert.severity,
                            ).withValues(alpha: 0.15),
                            labelStyle: TextStyle(
                              color: _severityColor(context, alert.severity),
                            ),
                            visualDensity: VisualDensity.compact,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Text(
                              '${alert.pestType} · ${alert.region}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(alert.message),
                      if (alert.recommendation.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Rekomendasi: ${alert.recommendation}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
