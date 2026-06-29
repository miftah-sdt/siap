import 'package:flutter/material.dart';
import 'package:siap/core/models/download_result.dart';
import 'package:siap/core/services/download_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';
import 'package:siap/injection/dependency_injection.dart';

class ReportDownloadHelper {
  const ReportDownloadHelper._();

  static Future<void> exportAndDownload({
    required BuildContext context,
    required LaporanExportResult result,
    String successTitle = 'Unduhan Selesai',
  }) async {
    var isDownloading = false;
    var downloadProgress = 0.0;

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          Future<void> download() async {
            setDialogState(() => isDownloading = true);
            try {
              final downloadResult = await sl<DownloadService>()
                  .downloadToDevice(
                    url: result.downloadUrl,
                    fileName: result.fileName,
                    onProgress: (received, total) {
                      if (total > 0) {
                        setDialogState(
                          () => downloadProgress = received / total,
                        );
                      }
                    },
                  );
              if (!context.mounted) return;
              Navigator.pop(context);
              if (!dialogContext.mounted) return;
              await showDownloadCompleteDialog(
                dialogContext,
                downloadResult: downloadResult,
                title: successTitle,
              );
            } catch (e) {
              setDialogState(() => isDownloading = false);
              if (context.mounted) {
                UiFeedback.showSnackBar(
                  context,
                  message: e.toString(),
                  isError: true,
                );
              }
            }
          }

          return AlertDialog(
            title: const Text('Unduh Laporan'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('File: ${result.fileName}'),
                if (isDownloading) ...[
                  const SizedBox(height: AppSpacing.md),
                  LinearProgressIndicator(
                    value: downloadProgress > 0 ? downloadProgress : null,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  const Text('Mengunduh...'),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: isDownloading ? null : () => Navigator.pop(context),
                child: const Text('Batal'),
              ),
              FilledButton(
                onPressed: isDownloading ? null : download,
                child: Text(isDownloading ? 'Mengunduh...' : 'Unduh'),
              ),
            ],
          );
        },
      ),
    );
  }

  static Future<void> showDownloadCompleteDialog(
    BuildContext context, {
    required DownloadResult downloadResult,
    String title = 'Unduhan Selesai',
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.check_circle_outline, color: Colors.green),
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('File: ${downloadResult.fileName}'),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Disimpan di:\n${downloadResult.directoryLabel}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await sl<DownloadService>().openFile(downloadResult.savedPath);
            },
            child: const Text('Buka File'),
          ),
        ],
      ),
    );
  }
}
