import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/lahan/data/models/lahan_model.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';

abstract class LahanRemoteDataSource {
  Future<LahanListResult> getLahanList({
    required int page,
    required int limit,
    String? search,
    String? petaniId,
  });

  Future<LahanModel> getLahanDetail(String id);
  Future<LahanModel> createLahan(LahanRequestModel request);
  Future<LahanModel> updateLahan(String id, LahanRequestModel request);
  Future<void> deleteLahan(String id);
}

class LahanRemoteDataSourceImpl implements LahanRemoteDataSource {
  LahanRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<LahanListResult> getLahanList({
    required int page,
    required int limit,
    String? search,
    String? petaniId,
  }) async {
    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.lahan,
      queryParameters: {
        'page': page,
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
        if (petaniId != null && petaniId.isNotEmpty) 'petani_id': petaniId,
      },
      fromJsonT: (json) => json as List<dynamic>,
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }

    final items = response.data!
        .map((e) => LahanModel.fromJson(e as Map<String, dynamic>))
        .map((e) => e.toEntity())
        .toList();

    return LahanListResult(
      items: items,
      page: response.meta?.page ?? page,
      totalPages: response.meta?.totalPages ?? 1,
      total: response.meta?.total ?? items.length,
    );
  }

  @override
  Future<LahanModel> getLahanDetail(String id) async {
    final response = await _client.get<LahanModel>(
      ApiEndpoint.lahanDetail(id),
      fromJsonT: (json) => LahanModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<LahanModel> createLahan(LahanRequestModel request) async {
    final response = await _client.post<LahanModel>(
      ApiEndpoint.lahan,
      data: request.toJson(),
      fromJsonT: (json) => LahanModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<LahanModel> updateLahan(String id, LahanRequestModel request) async {
    final response = await _client.put<LahanModel>(
      ApiEndpoint.lahanDetail(id),
      data: request.toJson(),
      fromJsonT: (json) => LahanModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<void> deleteLahan(String id) async {
    final response = await _client.delete<Map<String, dynamic>>(
      ApiEndpoint.lahanDetail(id),
      fromJsonT: (json) => json as Map<String, dynamic>,
    );

    if (!response.success) {
      throw Exception(response.message);
    }
  }
}
