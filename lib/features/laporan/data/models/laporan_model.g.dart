// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laporan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LaporanExportResultModel _$LaporanExportResultModelFromJson(
  Map<String, dynamic> json,
) => _LaporanExportResultModel(
  fileName: json['file_name'] as String,
  downloadUrl: json['download_url'] as String,
);

Map<String, dynamic> _$LaporanExportResultModelToJson(
  _LaporanExportResultModel instance,
) => <String, dynamic>{
  'file_name': instance.fileName,
  'download_url': instance.downloadUrl,
};

_LaporanExportRequestModel _$LaporanExportRequestModelFromJson(
  Map<String, dynamic> json,
) => _LaporanExportRequestModel(
  type: json['type'] as String,
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
  status: json['status'] as String?,
  format: json['format'] as String,
);

Map<String, dynamic> _$LaporanExportRequestModelToJson(
  _LaporanExportRequestModel instance,
) => <String, dynamic>{
  'type': instance.type,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'status': instance.status,
  'format': instance.format,
};
