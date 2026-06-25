import 'package:intl/intl.dart';
import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/laporan/data/models/laporan_model.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';

abstract class LaporanRemoteDataSource {
  Future<LaporanExportResult> exportLaporan({
    required LaporanFilter filter,
    required ExportFormat format,
  });
}

class LaporanRemoteDataSourceImpl implements LaporanRemoteDataSource {
  LaporanRemoteDataSourceImpl(this._client);

  final DioClient _client;
  final _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Future<LaporanExportResult> exportLaporan({
    required LaporanFilter filter,
    required ExportFormat format,
  }) async {
    final request = LaporanExportRequestModel(
      type: filter.type.name,
      startDate: filter.startDate != null
          ? _dateFormat.format(filter.startDate!)
          : null,
      endDate: filter.endDate != null
          ? _dateFormat.format(filter.endDate!)
          : null,
      status: filter.status?.isNotEmpty == true ? filter.status : null,
      format: format.name,
    );

    final response = await _client.post<LaporanExportResultModel>(
      ApiEndpoint.laporanExport,
      data: request.toJson(),
      fromJsonT: (json) =>
          LaporanExportResultModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }

    return response.data!.toEntity();
  }
}
