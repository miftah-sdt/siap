import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/exception_mapper.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/lahan/data/datasources/lahan_remote_datasource.dart';
import 'package:siap/features/lahan/data/models/lahan_model.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';
import 'package:siap/features/lahan/domain/repositories/lahan_repository.dart';

class LahanRepositoryImpl implements LahanRepository {
  LahanRepositoryImpl(this._remote);

  final LahanRemoteDataSource _remote;

  @override
  Future<Result<LahanListResult>> getLahanList({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final result = await _remote.getLahanList(
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
  Future<Result<Lahan>> getLahanDetail(String id) async {
    try {
      final model = await _remote.getLahanDetail(id);
      return Success(model.toEntity());
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Lahan>> createLahan({
    required String kodeLahan,
    required String namaLahan,
    required double luas,
    required String lokasi,
    String? koordinat,
  }) async {
    try {
      final model = await _remote.createLahan(
        LahanRequestModel(
          kodeLahan: kodeLahan,
          namaLahan: namaLahan,
          luas: luas,
          lokasi: lokasi,
          koordinat: koordinat,
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
  Future<Result<Lahan>> updateLahan({
    required String id,
    required String kodeLahan,
    required String namaLahan,
    required double luas,
    required String lokasi,
    String? koordinat,
  }) async {
    try {
      final model = await _remote.updateLahan(
        id,
        LahanRequestModel(
          kodeLahan: kodeLahan,
          namaLahan: namaLahan,
          luas: luas,
          lokasi: lokasi,
          koordinat: koordinat,
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
  Future<Result<void>> deleteLahan(String id) async {
    try {
      await _remote.deleteLahan(id);
      return const Success(null);
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }
}
