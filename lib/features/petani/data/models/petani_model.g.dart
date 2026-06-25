// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petani_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PetaniModel _$PetaniModelFromJson(Map<String, dynamic> json) => _PetaniModel(
  id: json['id'] as String,
  nik: json['nik'] as String,
  nama: json['nama'] as String,
  alamat: json['alamat'] as String,
  noHp: json['no_hp'] as String,
  kelompokTani: json['kelompok_tani'] as String,
);

Map<String, dynamic> _$PetaniModelToJson(_PetaniModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama': instance.nama,
      'alamat': instance.alamat,
      'no_hp': instance.noHp,
      'kelompok_tani': instance.kelompokTani,
    };

_PetaniRequestModel _$PetaniRequestModelFromJson(Map<String, dynamic> json) =>
    _PetaniRequestModel(
      nik: json['nik'] as String,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String,
      noHp: json['no_hp'] as String,
      kelompokTani: json['kelompok_tani'] as String,
    );

Map<String, dynamic> _$PetaniRequestModelToJson(_PetaniRequestModel instance) =>
    <String, dynamic>{
      'nik': instance.nik,
      'nama': instance.nama,
      'alamat': instance.alamat,
      'no_hp': instance.noHp,
      'kelompok_tani': instance.kelompokTani,
    };
