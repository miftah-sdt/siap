import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/dashboard/domain/entities/dashboard.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = DashboardInitial;
  const factory DashboardState.loading() = DashboardLoading;
  const factory DashboardState.success({
    required DashboardSummary summary,
    required DashboardCharts charts,
  }) = DashboardSuccess;
  const factory DashboardState.error(String message) = DashboardError;
}
