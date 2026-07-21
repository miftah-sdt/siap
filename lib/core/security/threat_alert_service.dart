import 'package:flutter/material.dart';
import 'package:siap/core/security/threat_event.dart';
import 'package:siap/routes/app_router.dart';

/// Menampilkan popup alert saat DoveRunner/AppSealing mendeteksi ancaman.
class ThreatAlertService {
  ThreatAlertService._();

  static final Set<String> _shownKeys = {};

  static void showIfNeeded(ThreatEvent event) {
    if (_shownKeys.contains(event.dedupeKey)) {
      return;
    }
    _shownKeys.add(event.dedupeKey);

    final context = AppRouter.rootNavigatorKey.currentContext;
    if (context == null || !context.mounted) {
      return;
    }

    final codeLabel = event.threatCode ?? event.code.toString();
    final severity = event.severity ?? 'unknown';

    showDialog<void>(
      context: context,
      barrierDismissible: !event.willKillApp,
      builder: (dialogContext) {
        return AlertDialog(
          icon: Icon(
            _iconForSeverity(severity),
            color: _colorForSeverity(severity),
            size: 36,
          ),
          title: const Text('Peringatan Keamanan'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  event.message,
                  style: Theme.of(dialogContext).textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                _detailRow('Kode', codeLabel),
                _detailRow('Kategori', event.category),
                _detailRow('Severity', severity),
                _detailRow('Platform', event.platform),
                if (event.willKillApp)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      'Aplikasi dapat ditutup otomatis oleh modul keamanan.',
                      style: Theme.of(dialogContext).textTheme.bodySmall
                          ?.copyWith(color: Colors.red.shade700),
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Mengerti'),
            ),
          ],
        );
      },
    );
  }

  static Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Builder(
        builder: (context) {
          final style = Theme.of(context).textTheme.bodySmall;
          return RichText(
            text: TextSpan(
              style: style,
              children: [
                TextSpan(
                  text: '$label: ',
                  style: style?.copyWith(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: value),
              ],
            ),
          );
        },
      ),
    );
  }

  static IconData _iconForSeverity(String severity) {
    switch (severity.toLowerCase()) {
      case 'critical':
        return Icons.gpp_bad_outlined;
      case 'medium':
        return Icons.warning_amber_outlined;
      case 'low':
        return Icons.info_outline;
      default:
        return Icons.security_outlined;
    }
  }

  static Color _colorForSeverity(String severity) {
    switch (severity.toLowerCase()) {
      case 'critical':
        return Colors.red.shade700;
      case 'medium':
        return Colors.orange.shade700;
      case 'low':
        return Colors.blue.shade700;
      default:
        return Colors.grey.shade700;
    }
  }
}
