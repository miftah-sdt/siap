// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asuransi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AsuransiModel _$AsuransiModelFromJson(Map<String, dynamic> json) =>
    _AsuransiModel(
      id: json['id'] as String,
      nomorPolis: json['nomor_polis'] as String,
      petaniId: json['petani_id'] as String,
      petaniNama: json['petani_nama'] as String,
      lahanId: json['lahan_id'] as String,
      lahanNama: json['lahan_nama'] as String,
      status: json['status'] as String,
      documents: (json['documents'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      riskScore: (json['risk_score'] as num?)?.toInt(),
      riskLevel: json['risk_level'] as String?,
      scoreFactorsRaw: json['score_factors'] as List<dynamic>?,
      scoredAt: json['scored_at'] as String?,
      askrindoRef: json['askrindo_ref'] as String?,
      askrindoStatus: json['askrindo_status'] as String?,
    );

Map<String, dynamic> _$AsuransiModelToJson(_AsuransiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomor_polis': instance.nomorPolis,
      'petani_id': instance.petaniId,
      'petani_nama': instance.petaniNama,
      'lahan_id': instance.lahanId,
      'lahan_nama': instance.lahanNama,
      'status': instance.status,
      'documents': instance.documents,
      'created_at': instance.createdAt.toIso8601String(),
      'risk_score': instance.riskScore,
      'risk_level': instance.riskLevel,
      'score_factors': instance.scoreFactorsRaw,
      'scored_at': instance.scoredAt,
      'askrindo_ref': instance.askrindoRef,
      'askrindo_status': instance.askrindoStatus,
    };

_AsuransiRequestModel _$AsuransiRequestModelFromJson(
  Map<String, dynamic> json,
) => _AsuransiRequestModel(
  nomorPolis: json['nomor_polis'] as String,
  petaniId: json['petani_id'] as String,
  petaniNama: json['petani_nama'] as String,
  lahanId: json['lahan_id'] as String,
  lahanNama: json['lahan_nama'] as String,
  documents: (json['documents'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$AsuransiRequestModelToJson(
  _AsuransiRequestModel instance,
) => <String, dynamic>{
  'nomor_polis': instance.nomorPolis,
  'petani_id': instance.petaniId,
  'petani_nama': instance.petaniNama,
  'lahan_id': instance.lahanId,
  'lahan_nama': instance.lahanNama,
  'documents': instance.documents,
};
