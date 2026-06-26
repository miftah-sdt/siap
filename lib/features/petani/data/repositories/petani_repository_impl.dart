import 'package:siap/core/database/local_cache_service.dart';
import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/exception_mapper.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/petani/data/datasources/petani_remote_datasource.dart';
import 'package:siap/features/petani/data/models/petani_model.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';
import 'package:siap/features/petani/domain/repositories/petani_repository.dart';

class PetaniRepositoryImpl implements PetaniRepository {
  PetaniRepositoryImpl(this._remote, this._cache);

  final PetaniRemoteDataSource _remote;
  final LocalCacheService _cache;

  static String _listCacheKey(int page, int limit, String? search) =>
      'petani_list_${page}_${limit}_${search ?? ''}';

  @override
  Future<Result<PetaniListResult>> getPetaniList({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final result = await _remote.getPetaniList(
        page: page,
        limit: limit,
        search: search,
      );
      await _cache.putJson(_listCacheKey(page, limit, search), {
        'items': result.items
            .map((e) => PetaniModel.fromEntity(e).toJson())
            .toList(),
        'page': result.page,
        'total_pages': result.totalPages,
        'total': result.total,
      });
      return Success(result);
    } on AppException catch (e) {
      final cached = _readListCache(page, limit, search);
      if (cached != null) return Success(cached);
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      final cached = _readListCache(page, limit, search);
      if (cached != null) return Success(cached);
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  PetaniListResult? _readListCache(int page, int limit, String? search) {
    final raw = _cache.getJson(_listCacheKey(page, limit, search));
    if (raw == null) return null;
    final items = (raw['items'] as List<dynamic>)
        .map((e) => PetaniModel.fromJson(e as Map<String, dynamic>).toEntity())
        .toList();
    return PetaniListResult(
      items: items,
      page: raw['page'] as int? ?? page,
      totalPages: raw['total_pages'] as int? ?? 1,
      total: raw['total'] as int? ?? items.length,
    );
  }

  @override
  Future<Result<Petani>> getPetaniDetail(String id) async {
    try {
      final model = await _remote.getPetaniDetail(id);
      return Success(model.toEntity());
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Petani>> createPetani({
    required String nik,
    required String nama,
    required String alamat,
    required String noHp,
    required String kelompokTani,
  }) async {
    try {
      final model = await _remote.createPetani(
        PetaniRequestModel(
          nik: nik,
          nama: nama,
          alamat: alamat,
          noHp: noHp,
          kelompokTani: kelompokTani,
        ),
      );
      return Success(model.toEntity());
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Petani>> updatePetani({
    required String id,
    required String nik,
    required String nama,
    required String alamat,
    required String noHp,
    required String kelompokTani,
  }) async {
    try {
      final model = await _remote.updatePetani(
        id,
        PetaniRequestModel(
          nik: nik,
          nama: nama,
          alamat: alamat,
          noHp: noHp,
          kelompokTani: kelompokTani,
        ),
      );
      return Success(model.toEntity());
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> deletePetani(String id) async {
    try {
      await _remote.deletePetani(id);
      return const Success(null);
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }
}
