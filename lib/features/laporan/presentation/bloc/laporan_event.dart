import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';

part 'laporan_event.freezed.dart';

@freezed
abstract class LaporanEvent with _$LaporanEvent {
  const factory LaporanEvent.exportPdf({required LaporanFilter filter}) =
      LaporanExportPdf;
  const factory LaporanEvent.exportExcel({required LaporanFilter filter}) =
      LaporanExportExcel;
}
