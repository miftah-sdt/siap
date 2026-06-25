import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';

part 'laporan_state.freezed.dart';

@freezed
abstract class LaporanState with _$LaporanState {
  const factory LaporanState.initial() = LaporanInitial;
  const factory LaporanState.loading() = LaporanLoading;
  const factory LaporanState.success(LaporanExportResult result) =
      LaporanSuccess;
  const factory LaporanState.error(String message) = LaporanError;
}
