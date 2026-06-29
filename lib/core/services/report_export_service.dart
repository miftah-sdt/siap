import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/laporan/data/models/laporan_model.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';

class ReportExportService {
  ReportExportService(this._client);

  final DioClient _client;

  Future<LaporanExportResult> exportDetail({
    required String type,
    required String id,
    required ExportFormat format,
  }) async {
    final response = await _client.post<LaporanExportResultModel>(
      ApiEndpoint.laporanExportDetail,
      data: {'type': type, 'id': id, 'format': format.name},
      fromJsonT: (json) =>
          LaporanExportResultModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!.toEntity();
  }
}
