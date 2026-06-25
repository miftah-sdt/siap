import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';
import 'package:siap/features/lahan/domain/usecases/lahan_usecases.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_list_bloc.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_list_event.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_list_state.dart';

import '../../../helpers/fallback_values.dart';

class MockGetLahanListUseCase extends Mock implements GetLahanListUseCase {}

class MockDeleteLahanUseCase extends Mock implements DeleteLahanUseCase {}

void main() {
  late MockGetLahanListUseCase getLahanListUseCase;
  late MockDeleteLahanUseCase deleteLahanUseCase;

  setUpAll(registerTestFallbacks);

  setUp(() {
    getLahanListUseCase = MockGetLahanListUseCase();
    deleteLahanUseCase = MockDeleteLahanUseCase();
  });

  blocTest<LahanListBloc, LahanListState>(
    'emits success when lahan list loads',
    build: () => LahanListBloc(
      getLahanListUseCase: getLahanListUseCase,
      deleteLahanUseCase: deleteLahanUseCase,
    ),
    act: (bloc) {
      when(() => getLahanListUseCase(any())).thenAnswer(
        (_) async => const Success(
          LahanListResult(items: [], page: 1, totalPages: 1, total: 0),
        ),
      );
      bloc.add(const LahanListEvent.started());
    },
    expect: () => [const LahanListState.loading(), isA<LahanListSuccess>()],
  );

  blocTest<LahanListBloc, LahanListState>(
    'emits error when load fails',
    build: () => LahanListBloc(
      getLahanListUseCase: getLahanListUseCase,
      deleteLahanUseCase: deleteLahanUseCase,
    ),
    act: (bloc) {
      when(() => getLahanListUseCase(any())).thenAnswer(
        (_) async =>
            const ErrorResult(ServerFailure(message: 'Gagal memuat data')),
      );
      bloc.add(const LahanListEvent.started());
    },
    expect: () => [
      const LahanListState.loading(),
      const LahanListState.error('Gagal memuat data'),
    ],
  );
}
