import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/dashboard/data/models/dashboard_model.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardSummaryModel> getSummary();
  Future<DashboardChartsModel> getCharts();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  DashboardRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<DashboardSummaryModel> getSummary() async {
    final response = await _client.get<DashboardSummaryModel>(
      ApiEndpoint.dashboardSummary,
      fromJsonT: (json) =>
          DashboardSummaryModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<DashboardChartsModel> getCharts() async {
    final response = await _client.get<DashboardChartsModel>(
      ApiEndpoint.dashboardCharts,
      fromJsonT: (json) =>
          DashboardChartsModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }
}
