import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/dashboard/domain/entities/dashboard.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
abstract class DashboardSummaryModel with _$DashboardSummaryModel {
  const DashboardSummaryModel._();

  const factory DashboardSummaryModel({
    @JsonKey(name: 'total_petani') required int totalPetani,
    @JsonKey(name: 'total_lahan') required int totalLahan,
    @JsonKey(name: 'total_polis') required int totalPolis,
    @JsonKey(name: 'total_klaim') required int totalKlaim,
  }) = _DashboardSummaryModel;

  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryModelFromJson(json);

  DashboardSummary toEntity() => DashboardSummary(
    totalPetani: totalPetani,
    totalLahan: totalLahan,
    totalPolis: totalPolis,
    totalKlaim: totalKlaim,
  );
}

@freezed
abstract class ChartPointModel with _$ChartPointModel {
  const ChartPointModel._();

  const factory ChartPointModel({
    required String label,
    required double value,
  }) = _ChartPointModel;

  factory ChartPointModel.fromJson(Map<String, dynamic> json) =>
      _$ChartPointModelFromJson(json);

  ChartPoint toEntity() => ChartPoint(label: label, value: value);
}

@freezed
abstract class DashboardChartsModel with _$DashboardChartsModel {
  const DashboardChartsModel._();

  const factory DashboardChartsModel({
    @JsonKey(name: 'monthly_registrations')
    required List<ChartPointModel> monthlyRegistrations,
    @JsonKey(name: 'monthly_claims')
    required List<ChartPointModel> monthlyClaims,
  }) = _DashboardChartsModel;

  factory DashboardChartsModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardChartsModelFromJson(json);

  DashboardCharts toEntity() => DashboardCharts(
    monthlyRegistrations: monthlyRegistrations
        .map((e) => e.toEntity())
        .toList(),
    monthlyClaims: monthlyClaims.map((e) => e.toEntity()).toList(),
  );
}
