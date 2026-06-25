import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/exception_mapper.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/asuransi/data/datasources/asuransi_remote_datasource.dart';
import 'package:siap/features/asuransi/data/models/asuransi_model.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/asuransi/domain/repositories/asuransi_repository.dart';

class AsuransiRepositoryImpl implements AsuransiRepository {
  AsuransiRepositoryImpl(this._remote);

  final AsuransiRemoteDataSource _remote;

  @override
  Future<Result<AsuransiListResult>> getAsuransiList({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final result = await _remote.getAsuransiList(
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
  Future<Result<Asuransi>> getAsuransiDetail(String id) async {
    try {
      final model = await _remote.getAsuransiDetail(id);
      return Success(model.toEntity());
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Asuransi>> createAsuransi({
    required String nomorPolis,
    required String petaniId,
    required String petaniNama,
    required String lahanId,
    required String lahanNama,
    required List<String> documents,
  }) async {
    try {
      final model = await _remote.createAsuransi(
        AsuransiRequestModel(
          nomorPolis: nomorPolis,
          petaniId: petaniId,
          petaniNama: petaniNama,
          lahanId: lahanId,
          lahanNama: lahanNama,
          documents: documents,
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
  Future<Result<Asuransi>> updateAsuransi({
    required String id,
    required String nomorPolis,
    required String petaniId,
    required String petaniNama,
    required String lahanId,
    required String lahanNama,
    required List<String> documents,
  }) async {
    try {
      final model = await _remote.updateAsuransi(
        id,
        AsuransiRequestModel(
          nomorPolis: nomorPolis,
          petaniId: petaniId,
          petaniNama: petaniNama,
          lahanId: lahanId,
          lahanNama: lahanNama,
          documents: documents,
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
  Future<Result<void>> deleteAsuransi(String id) async {
    try {
      await _remote.deleteAsuransi(id);
      return const Success(null);
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }
}
