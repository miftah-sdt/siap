import 'package:siap/core/utils/result.dart';
import 'package:siap/features/dashboard/domain/entities/dashboard.dart';

abstract class DashboardRepository {
  Future<Result<DashboardSummary>> getSummary();
  Future<Result<DashboardCharts>> getCharts();
}
