import 'package:flutter/material.dart';
import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/theme/app_spacing.dart';

class UnderwritingScoreCard extends StatelessWidget {
  const UnderwritingScoreCard({
    super.key,
    this.score,
    this.isLoading = false,
    this.onCalculate,
  });

  final UnderwritingScore? score;
  final bool isLoading;
  final VoidCallback? onCalculate;

  Color _levelColor(BuildContext context) {
    if (score == null) return Theme.of(context).colorScheme.outline;
    return switch (score!.riskLevel) {
      'rendah' => Colors.green,
      'tinggi' => Theme.of(context).colorScheme.error,
      _ => Colors.orange,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.analytics_outlined),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Skor Underwriting',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (onCalculate != null)
                  TextButton.icon(
                    onPressed: isLoading ? null : onCalculate,
                    icon: isLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.refresh, size: 18),
                    label: const Text('Hitung'),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            if (score == null && !isLoading)
              const Text(
                'Belum ada skor. Pilih lahan lalu tekan Hitung untuk evaluasi risiko otomatis.',
              )
            else if (score != null) ...[
              Row(
                children: [
                  SizedBox(
                    width: 72,
                    height: 72,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          value: score!.riskScore / 100,
                          strokeWidth: 8,
                          color: _levelColor(context),
                          backgroundColor: _levelColor(
                            context,
                          ).withValues(alpha: 0.2),
                        ),
                        Center(
                          child: Text(
                            '${score!.riskScore}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          score!.riskLabel,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: _levelColor(context),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        if (score!.scoredAt != null)
                          Text(
                            'Diperbarui: ${score!.scoredAt}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (score!.factors.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                const Divider(),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Faktor penilaian',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: AppSpacing.sm),
                ...score!.factors.map(
                  (f) => ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      f.impact >= 0
                          ? Icons.add_circle_outline
                          : Icons.remove_circle_outline,
                      color: f.impact >= 0 ? Colors.green : Colors.red,
                      size: 20,
                    ),
                    title: Text(f.factor),
                    trailing: Text(
                      f.impact >= 0 ? '+${f.impact}' : '${f.impact}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: f.impact >= 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
