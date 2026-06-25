import 'package:siap/core/utils/result.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';

abstract class LaporanRepository {
  Future<Result<LaporanExportResult>> exportLaporan({
    required LaporanFilter filter,
    required ExportFormat format,
  });
}
