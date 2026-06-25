import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/exception_mapper.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/laporan/data/datasources/laporan_remote_datasource.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';
import 'package:siap/features/laporan/domain/repositories/laporan_repository.dart';

class LaporanRepositoryImpl implements LaporanRepository {
  LaporanRepositoryImpl(this._remote);

  final LaporanRemoteDataSource _remote;

  @override
  Future<Result<LaporanExportResult>> exportLaporan({
    required LaporanFilter filter,
    required ExportFormat format,
  }) async {
    try {
      final result = await _remote.exportLaporan(
        filter: filter,
        format: format,
      );
      return Success(result);
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }
}
