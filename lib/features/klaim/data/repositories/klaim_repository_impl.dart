import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/exception_mapper.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/klaim/data/datasources/klaim_remote_datasource.dart';
import 'package:siap/features/klaim/data/models/klaim_model.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/features/klaim/domain/repositories/klaim_repository.dart';

class KlaimRepositoryImpl implements KlaimRepository {
  KlaimRepositoryImpl(this._remote);

  final KlaimRemoteDataSource _remote;

  @override
  Future<Result<KlaimListResult>> getKlaimList({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final result = await _remote.getKlaimList(
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
  Future<Result<Klaim>> getKlaimDetail(String id) async {
    try {
      final model = await _remote.getKlaimDetail(id);
      return Success(model.toEntity());
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Klaim>> createKlaim({
    required String nomorKlaim,
    required String polisId,
    required String polisNomor,
    required String deskripsi,
    required List<String> buktiKerusakan,
  }) async {
    try {
      final model = await _remote.createKlaim(
        KlaimRequestModel(
          nomorKlaim: nomorKlaim,
          polisId: polisId,
          polisNomor: polisNomor,
          deskripsi: deskripsi,
          buktiKerusakan: buktiKerusakan,
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
  Future<Result<Klaim>> updateKlaim({
    required String id,
    required String nomorKlaim,
    required String polisId,
    required String polisNomor,
    required String deskripsi,
    required List<String> buktiKerusakan,
  }) async {
    try {
      final model = await _remote.updateKlaim(
        id,
        KlaimRequestModel(
          nomorKlaim: nomorKlaim,
          polisId: polisId,
          polisNomor: polisNomor,
          deskripsi: deskripsi,
          buktiKerusakan: buktiKerusakan,
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
  Future<Result<void>> deleteKlaim(String id) async {
    try {
      await _remote.deleteKlaim(id);
      return const Success(null);
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }
}
