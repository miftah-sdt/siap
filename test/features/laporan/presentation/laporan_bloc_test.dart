import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';
import 'package:siap/features/laporan/domain/usecases/laporan_usecases.dart';
import 'package:siap/features/laporan/presentation/bloc/laporan_bloc.dart';
import 'package:siap/features/laporan/presentation/bloc/laporan_event.dart';
import 'package:siap/features/laporan/presentation/bloc/laporan_state.dart';

import '../../../helpers/fallback_values.dart';

class MockExportLaporanUseCase extends Mock implements ExportLaporanUseCase {}

void main() {
  late MockExportLaporanUseCase exportLaporanUseCase;

  const filter = LaporanFilter(type: LaporanType.petani);
  const exportResult = LaporanExportResult(
    fileName: 'laporan-petani.pdf',
    downloadUrl: 'https://api.siap.local/files/laporan-petani.pdf',
  );

  setUpAll(registerTestFallbacks);

  setUp(() {
    exportLaporanUseCase = MockExportLaporanUseCase();
  });

  blocTest<LaporanBloc, LaporanState>(
    'emits success when PDF export succeeds',
    build: () => LaporanBloc(exportLaporanUseCase: exportLaporanUseCase),
    act: (bloc) {
      when(
        () => exportLaporanUseCase(any()),
      ).thenAnswer((_) async => const Success(exportResult));
      bloc.add(const LaporanEvent.exportPdf(filter: filter));
    },
    expect: () => [
      const LaporanState.loading(),
      const LaporanState.success(exportResult),
    ],
  );

  blocTest<LaporanBloc, LaporanState>(
    'emits error when export fails',
    build: () => LaporanBloc(exportLaporanUseCase: exportLaporanUseCase),
    act: (bloc) {
      when(() => exportLaporanUseCase(any())).thenAnswer(
        (_) async => const ErrorResult(ServerFailure(message: 'Export gagal')),
      );
      bloc.add(const LaporanEvent.exportExcel(filter: filter));
    },
    expect: () => [
      const LaporanState.loading(),
      const LaporanState.error('Export gagal'),
    ],
  );
}
