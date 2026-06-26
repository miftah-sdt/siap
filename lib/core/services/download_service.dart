import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/core/network/network_exceptions.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadService {
  DownloadService(this._client);

  final DioClient _client;

  Future<File> downloadToDevice({
    required String url,
    required String fileName,
    void Function(int received, int total)? onProgress,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final savePath = '${dir.path}${Platform.pathSeparator}$fileName';

    try {
      await _client.dio.download(
        url,
        savePath,
        onReceiveProgress: onProgress,
      );
      return File(savePath);
    } on DioException catch (error) {
      throw NetworkExceptionHandler.handle(error);
    }
  }

  Future<void> openFile(File file) async {
    await OpenFilex.open(file.path);
  }

  Future<void> shareFile(File file, {String? text}) async {
    await Share.shareXFiles([XFile(file.path)], text: text);
  }

  Future<bool> openInBrowser(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
