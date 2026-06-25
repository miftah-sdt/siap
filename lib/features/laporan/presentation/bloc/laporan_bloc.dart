import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';
import 'package:siap/features/laporan/domain/usecases/laporan_usecases.dart';
import 'package:siap/features/laporan/presentation/bloc/laporan_event.dart';
import 'package:siap/features/laporan/presentation/bloc/laporan_state.dart';

class LaporanBloc extends Bloc<LaporanEvent, LaporanState> {
  LaporanBloc({required ExportLaporanUseCase exportLaporanUseCase})
    : _exportLaporanUseCase = exportLaporanUseCase,
      super(const LaporanState.initial()) {
    on<LaporanExportPdf>(_onExportPdf);
    on<LaporanExportExcel>(_onExportExcel);
  }

  final ExportLaporanUseCase _exportLaporanUseCase;

  Future<void> _onExportPdf(
    LaporanExportPdf event,
    Emitter<LaporanState> emit,
  ) async {
    await _export(event.filter, ExportFormat.pdf, emit);
  }

  Future<void> _onExportExcel(
    LaporanExportExcel event,
    Emitter<LaporanState> emit,
  ) async {
    await _export(event.filter, ExportFormat.excel, emit);
  }

  Future<void> _export(
    LaporanFilter filter,
    ExportFormat format,
    Emitter<LaporanState> emit,
  ) async {
    emit(const LaporanState.loading());
    final result = await _exportLaporanUseCase(
      ExportLaporanParams(filter: filter, format: format),
    );

    switch (result) {
      case Success(:final data):
        emit(LaporanState.success(data));
      case ErrorResult(:final failure):
        emit(LaporanState.error(failure.message));
    }
  }
}
