import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/exception_mapper.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/petani/data/datasources/petani_remote_datasource.dart';
import 'package:siap/features/petani/data/models/petani_model.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';
import 'package:siap/features/petani/domain/repositories/petani_repository.dart';

class PetaniRepositoryImpl implements PetaniRepository {
  PetaniRepositoryImpl(this._remote);

  final PetaniRemoteDataSource _remote;

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
      return Success(result);
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
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
