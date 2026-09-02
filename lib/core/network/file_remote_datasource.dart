import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:siap/core/models/uploaded_file.dart';
import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/core/network/network_exceptions.dart';

class FileRemoteDataSource {
  FileRemoteDataSource(this._client);

  final DioClient _client;

  Future<UploadedFile> uploadBytes(
    Uint8List bytes,
    String fileName, {
    void Function(int sent, int total)? onProgress,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(bytes, filename: fileName),
      });

      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiEndpoint.fileUpload,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
        onSendProgress: onProgress,
      );

      final data = response.data;
      if (data == null || data['success'] != true) {
        throw Exception(data?['message']?.toString() ?? 'Upload gagal');
      }

      final payload = data['data'] as Map<String, dynamic>;
      return UploadedFile(
        fileName: payload['file_name'] as String,
        originalName: payload['original_name'] as String? ?? fileName,
        url: payload['url'] as String,
        size: payload['size'] as int?,
        mimeType: payload['mime_type'] as String?,
      );
    } on DioException catch (error) {
      throw NetworkExceptionHandler.handle(error);
    }
  }
}
