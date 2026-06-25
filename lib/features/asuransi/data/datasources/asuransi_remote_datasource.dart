import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/asuransi/data/models/asuransi_model.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';

abstract class AsuransiRemoteDataSource {
  Future<AsuransiListResult> getAsuransiList({
    required int page,
    required int limit,
    String? search,
  });

  Future<AsuransiModel> getAsuransiDetail(String id);
  Future<AsuransiModel> createAsuransi(AsuransiRequestModel request);
  Future<AsuransiModel> updateAsuransi(String id, AsuransiRequestModel request);
  Future<void> deleteAsuransi(String id);
}

class AsuransiRemoteDataSourceImpl implements AsuransiRemoteDataSource {
  AsuransiRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<AsuransiListResult> getAsuransiList({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.asuransi,
      queryParameters: {
        'page': page,
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
      },
      fromJsonT: (json) => json as List<dynamic>,
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }

    final items = response.data!
        .map((e) => AsuransiModel.fromJson(e as Map<String, dynamic>))
        .map((e) => e.toEntity())
        .toList();

    return AsuransiListResult(
      items: items,
      page: response.meta?.page ?? page,
      totalPages: response.meta?.totalPages ?? 1,
      total: response.meta?.total ?? items.length,
    );
  }

  @override
  Future<AsuransiModel> getAsuransiDetail(String id) async {
    final response = await _client.get<AsuransiModel>(
      ApiEndpoint.asuransiDetail(id),
      fromJsonT: (json) =>
          AsuransiModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<AsuransiModel> createAsuransi(AsuransiRequestModel request) async {
    final response = await _client.post<AsuransiModel>(
      ApiEndpoint.asuransi,
      data: request.toJson(),
      fromJsonT: (json) =>
          AsuransiModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<AsuransiModel> updateAsuransi(
    String id,
    AsuransiRequestModel request,
  ) async {
    final response = await _client.put<AsuransiModel>(
      ApiEndpoint.asuransiDetail(id),
      data: request.toJson(),
      fromJsonT: (json) =>
          AsuransiModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<void> deleteAsuransi(String id) async {
    final response = await _client.delete<Map<String, dynamic>>(
      ApiEndpoint.asuransiDetail(id),
      fromJsonT: (json) => json as Map<String, dynamic>,
    );

    if (!response.success) {
      throw Exception(response.message);
    }
  }
}
