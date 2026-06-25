import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/petani/data/models/petani_model.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';

abstract class PetaniRemoteDataSource {
  Future<PetaniListResult> getPetaniList({
    required int page,
    required int limit,
    String? search,
  });

  Future<PetaniModel> getPetaniDetail(String id);
  Future<PetaniModel> createPetani(PetaniRequestModel request);
  Future<PetaniModel> updatePetani(String id, PetaniRequestModel request);
  Future<void> deletePetani(String id);
}

class PetaniRemoteDataSourceImpl implements PetaniRemoteDataSource {
  PetaniRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<PetaniListResult> getPetaniList({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.petani,
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
        .map((e) => PetaniModel.fromJson(e as Map<String, dynamic>))
        .map((e) => e.toEntity())
        .toList();

    return PetaniListResult(
      items: items,
      page: response.meta?.page ?? page,
      totalPages: response.meta?.totalPages ?? 1,
      total: response.meta?.total ?? items.length,
    );
  }

  @override
  Future<PetaniModel> getPetaniDetail(String id) async {
    final response = await _client.get<PetaniModel>(
      ApiEndpoint.petaniDetail(id),
      fromJsonT: (json) => PetaniModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<PetaniModel> createPetani(PetaniRequestModel request) async {
    final response = await _client.post<PetaniModel>(
      ApiEndpoint.petani,
      data: request.toJson(),
      fromJsonT: (json) => PetaniModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<PetaniModel> updatePetani(
    String id,
    PetaniRequestModel request,
  ) async {
    final response = await _client.put<PetaniModel>(
      ApiEndpoint.petaniDetail(id),
      data: request.toJson(),
      fromJsonT: (json) => PetaniModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<void> deletePetani(String id) async {
    final response = await _client.delete<Map<String, dynamic>>(
      ApiEndpoint.petaniDetail(id),
      fromJsonT: (json) => json as Map<String, dynamic>,
    );

    if (!response.success) {
      throw Exception(response.message);
    }
  }
}
