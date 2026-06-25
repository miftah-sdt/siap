// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lahan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LahanModel _$LahanModelFromJson(Map<String, dynamic> json) => _LahanModel(
  id: json['id'] as String,
  kodeLahan: json['kode_lahan'] as String,
  namaLahan: json['nama_lahan'] as String,
  luas: (json['luas'] as num).toDouble(),
  lokasi: json['lokasi'] as String,
  koordinat: json['koordinat'] as String?,
);

Map<String, dynamic> _$LahanModelToJson(_LahanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kode_lahan': instance.kodeLahan,
      'nama_lahan': instance.namaLahan,
      'luas': instance.luas,
      'lokasi': instance.lokasi,
      'koordinat': instance.koordinat,
    };

_LahanRequestModel _$LahanRequestModelFromJson(Map<String, dynamic> json) =>
    _LahanRequestModel(
      kodeLahan: json['kode_lahan'] as String,
      namaLahan: json['nama_lahan'] as String,
      luas: (json['luas'] as num).toDouble(),
      lokasi: json['lokasi'] as String,
      koordinat: json['koordinat'] as String?,
    );

Map<String, dynamic> _$LahanRequestModelToJson(_LahanRequestModel instance) =>
    <String, dynamic>{
      'kode_lahan': instance.kodeLahan,
      'nama_lahan': instance.namaLahan,
      'luas': instance.luas,
      'lokasi': instance.lokasi,
      'koordinat': instance.koordinat,
    };
