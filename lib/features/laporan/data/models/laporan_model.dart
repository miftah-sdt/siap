import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';

part 'laporan_model.freezed.dart';
part 'laporan_model.g.dart';

@freezed
abstract class LaporanExportResultModel with _$LaporanExportResultModel {
  const LaporanExportResultModel._();

  const factory LaporanExportResultModel({
    @JsonKey(name: 'file_name') required String fileName,
    @JsonKey(name: 'download_url') required String downloadUrl,
  }) = _LaporanExportResultModel;

  factory LaporanExportResultModel.fromJson(Map<String, dynamic> json) =>
      _$LaporanExportResultModelFromJson(json);

  LaporanExportResult toEntity() =>
      LaporanExportResult(fileName: fileName, downloadUrl: downloadUrl);
}

@freezed
abstract class LaporanExportRequestModel with _$LaporanExportRequestModel {
  const factory LaporanExportRequestModel({
    required String type,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    String? status,
    required String format,
  }) = _LaporanExportRequestModel;

  factory LaporanExportRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LaporanExportRequestModelFromJson(json);
}
