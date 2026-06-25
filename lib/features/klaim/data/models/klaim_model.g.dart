// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'klaim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KlaimModel _$KlaimModelFromJson(Map<String, dynamic> json) => _KlaimModel(
  id: json['id'] as String,
  nomorKlaim: json['nomor_klaim'] as String,
  polisId: json['polis_id'] as String,
  polisNomor: json['polis_nomor'] as String,
  deskripsi: json['deskripsi'] as String,
  status: json['status'] as String,
  buktiKerusakan: (json['bukti_kerusakan'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$KlaimModelToJson(_KlaimModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomor_klaim': instance.nomorKlaim,
      'polis_id': instance.polisId,
      'polis_nomor': instance.polisNomor,
      'deskripsi': instance.deskripsi,
      'status': instance.status,
      'bukti_kerusakan': instance.buktiKerusakan,
      'created_at': instance.createdAt.toIso8601String(),
    };

_KlaimRequestModel _$KlaimRequestModelFromJson(Map<String, dynamic> json) =>
    _KlaimRequestModel(
      nomorKlaim: json['nomor_klaim'] as String,
      polisId: json['polis_id'] as String,
      polisNomor: json['polis_nomor'] as String,
      deskripsi: json['deskripsi'] as String,
      buktiKerusakan: (json['bukti_kerusakan'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$KlaimRequestModelToJson(_KlaimRequestModel instance) =>
    <String, dynamic>{
      'nomor_klaim': instance.nomorKlaim,
      'polis_id': instance.polisId,
      'polis_nomor': instance.polisNomor,
      'deskripsi': instance.deskripsi,
      'bukti_kerusakan': instance.buktiKerusakan,
    };
