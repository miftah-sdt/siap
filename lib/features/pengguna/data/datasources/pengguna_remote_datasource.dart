import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/pengguna/data/models/pengguna_model.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';

abstract class PenggunaRemoteDataSource {
  Future<PenggunaListResult> getPenggunaList({
    required int page,
    required int limit,
    String? search,
  });

  Future<PenggunaModel> getPenggunaDetail(String id);
  Future<PenggunaModel> createPengguna(PenggunaRequestModel request);
  Future<PenggunaModel> updatePengguna(String id, PenggunaRequestModel request);
  Future<void> deletePengguna(String id);
}

class PenggunaRemoteDataSourceImpl implements PenggunaRemoteDataSource {
  PenggunaRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<PenggunaListResult> getPenggunaList({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.pengguna,
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
        .map((e) => PenggunaModel.fromJson(e as Map<String, dynamic>))
        .map((e) => e.toEntity())
        .toList();

    return PenggunaListResult(
      items: items,
      page: response.meta?.page ?? page,
      totalPages: response.meta?.totalPages ?? 1,
      total: response.meta?.total ?? items.length,
    );
  }

  @override
  Future<PenggunaModel> getPenggunaDetail(String id) async {
    final response = await _client.get<PenggunaModel>(
      ApiEndpoint.penggunaDetail(id),
      fromJsonT: (json) =>
          PenggunaModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<PenggunaModel> createPengguna(PenggunaRequestModel request) async {
    final response = await _client.post<PenggunaModel>(
      ApiEndpoint.pengguna,
      data: request.toJson(),
      fromJsonT: (json) =>
          PenggunaModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<PenggunaModel> updatePengguna(
    String id,
    PenggunaRequestModel request,
  ) async {
    final response = await _client.put<PenggunaModel>(
      ApiEndpoint.penggunaDetail(id),
      data: request.toJson(),
      fromJsonT: (json) =>
          PenggunaModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<void> deletePengguna(String id) async {
    final response = await _client.delete<Map<String, dynamic>>(
      ApiEndpoint.penggunaDetail(id),
      fromJsonT: (json) => json as Map<String, dynamic>,
    );

    if (!response.success) {
      throw Exception(response.message);
    }
  }
}
