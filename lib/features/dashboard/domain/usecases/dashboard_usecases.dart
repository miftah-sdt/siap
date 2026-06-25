import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/dashboard/domain/entities/dashboard.dart';
import 'package:siap/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboardSummaryUseCase
    implements UseCase<Result<DashboardSummary>, NoParams> {
  GetDashboardSummaryUseCase(this._repository);

  final DashboardRepository _repository;

  @override
  Future<Result<DashboardSummary>> call(NoParams params) =>
      _repository.getSummary();
}

class GetDashboardChartsUseCase
    implements UseCase<Result<DashboardCharts>, NoParams> {
  GetDashboardChartsUseCase(this._repository);

  final DashboardRepository _repository;

  @override
  Future<Result<DashboardCharts>> call(NoParams params) =>
      _repository.getCharts();
}
