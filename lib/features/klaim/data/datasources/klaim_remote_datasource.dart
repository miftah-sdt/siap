import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/klaim/data/models/klaim_model.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';

abstract class KlaimRemoteDataSource {
  Future<KlaimListResult> getKlaimList({
    required int page,
    required int limit,
    String? search,
  });

  Future<KlaimModel> getKlaimDetail(String id);
  Future<KlaimModel> createKlaim(KlaimRequestModel request);
  Future<KlaimModel> updateKlaim(String id, KlaimRequestModel request);
  Future<void> deleteKlaim(String id);
}

class KlaimRemoteDataSourceImpl implements KlaimRemoteDataSource {
  KlaimRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<KlaimListResult> getKlaimList({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.klaim,
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
        .map((e) => KlaimModel.fromJson(e as Map<String, dynamic>))
        .map((e) => e.toEntity())
        .toList();

    return KlaimListResult(
      items: items,
      page: response.meta?.page ?? page,
      totalPages: response.meta?.totalPages ?? 1,
      total: response.meta?.total ?? items.length,
    );
  }

  @override
  Future<KlaimModel> getKlaimDetail(String id) async {
    final response = await _client.get<KlaimModel>(
      ApiEndpoint.klaimDetail(id),
      fromJsonT: (json) => KlaimModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<KlaimModel> createKlaim(KlaimRequestModel request) async {
    final response = await _client.post<KlaimModel>(
      ApiEndpoint.klaim,
      data: request.toJson(),
      fromJsonT: (json) => KlaimModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<KlaimModel> updateKlaim(String id, KlaimRequestModel request) async {
    final response = await _client.put<KlaimModel>(
      ApiEndpoint.klaimDetail(id),
      data: request.toJson(),
      fromJsonT: (json) => KlaimModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<void> deleteKlaim(String id) async {
    final response = await _client.delete<Map<String, dynamic>>(
      ApiEndpoint.klaimDetail(id),
      fromJsonT: (json) => json as Map<String, dynamic>,
    );

    if (!response.success) {
      throw Exception(response.message);
    }
  }
}
