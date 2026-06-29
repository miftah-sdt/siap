import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:siap/core/models/download_result.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/core/network/network_exceptions.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadService {
  DownloadService(this._client);

  final DioClient _client;

  static const String downloadsSubfolder = 'SIAP';

  Future<Directory> resolveDownloadDirectory() async {
    if (!kIsWeb && Platform.isAndroid) {
      final downloads = await getDownloadsDirectory();
      if (downloads != null) {
        final target = Directory('${downloads.path}/$downloadsSubfolder');
        if (!await target.exists()) {
          await target.create(recursive: true);
        }
        return target;
      }

      final external = await getExternalStorageDirectory();
      if (external != null) {
        final target = Directory('${external.path}/$downloadsSubfolder');
        if (!await target.exists()) {
          await target.create(recursive: true);
        }
        return target;
      }
    }

    if (!kIsWeb && Platform.isIOS) {
      final documents = await getApplicationDocumentsDirectory();
      final target = Directory('${documents.path}/$downloadsSubfolder');
      if (!await target.exists()) {
        await target.create(recursive: true);
      }
      return target;
    }

    final documents = await getApplicationDocumentsDirectory();
    final target = Directory('${documents.path}/$downloadsSubfolder');
    if (!await target.exists()) {
      await target.create(recursive: true);
    }
    return target;
  }

  Future<DownloadResult> downloadToDevice({
    required String url,
    required String fileName,
    void Function(int received, int total)? onProgress,
  }) async {
    final dir = await resolveDownloadDirectory();
    final savePath = '${dir.path}${Platform.pathSeparator}$fileName';

    try {
      await _client.dio.download(url, savePath, onReceiveProgress: onProgress);
      return DownloadResult(
        fileName: fileName,
        savedPath: savePath,
        directoryLabel: dir.path,
      );
    } on DioException catch (error) {
      throw NetworkExceptionHandler.handle(error);
    }
  }

  Future<void> openFile(String path) async {
    await OpenFilex.open(path);
  }

  Future<void> shareFile(String path, {String? text}) async {
    await Share.shareXFiles([XFile(path)], text: text);
  }

  Future<bool> openInBrowser(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
