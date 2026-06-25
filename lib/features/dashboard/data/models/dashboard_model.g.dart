// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardSummaryModel _$DashboardSummaryModelFromJson(
  Map<String, dynamic> json,
) => _DashboardSummaryModel(
  totalPetani: (json['total_petani'] as num).toInt(),
  totalLahan: (json['total_lahan'] as num).toInt(),
  totalPolis: (json['total_polis'] as num).toInt(),
  totalKlaim: (json['total_klaim'] as num).toInt(),
);

Map<String, dynamic> _$DashboardSummaryModelToJson(
  _DashboardSummaryModel instance,
) => <String, dynamic>{
  'total_petani': instance.totalPetani,
  'total_lahan': instance.totalLahan,
  'total_polis': instance.totalPolis,
  'total_klaim': instance.totalKlaim,
};

_ChartPointModel _$ChartPointModelFromJson(Map<String, dynamic> json) =>
    _ChartPointModel(
      label: json['label'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$ChartPointModelToJson(_ChartPointModel instance) =>
    <String, dynamic>{'label': instance.label, 'value': instance.value};

_DashboardChartsModel _$DashboardChartsModelFromJson(
  Map<String, dynamic> json,
) => _DashboardChartsModel(
  monthlyRegistrations: (json['monthly_registrations'] as List<dynamic>)
      .map((e) => ChartPointModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  monthlyClaims: (json['monthly_claims'] as List<dynamic>)
      .map((e) => ChartPointModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DashboardChartsModelToJson(
  _DashboardChartsModel instance,
) => <String, dynamic>{
  'monthly_registrations': instance.monthlyRegistrations,
  'monthly_claims': instance.monthlyClaims,
};
