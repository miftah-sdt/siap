import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';
import 'package:siap/features/laporan/domain/repositories/laporan_repository.dart';

class ExportLaporanParams {
  const ExportLaporanParams({required this.filter, required this.format});

  final LaporanFilter filter;
  final ExportFormat format;
}

class ExportLaporanUseCase
    implements UseCase<Result<LaporanExportResult>, ExportLaporanParams> {
  ExportLaporanUseCase(this._repository);

  final LaporanRepository _repository;

  @override
  Future<Result<LaporanExportResult>> call(ExportLaporanParams params) {
    return _repository.exportLaporan(
      filter: params.filter,
      format: params.format,
    );
  }
}
