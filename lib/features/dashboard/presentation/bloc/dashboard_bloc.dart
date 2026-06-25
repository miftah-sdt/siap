import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/dashboard/domain/entities/dashboard.dart';
import 'package:siap/features/dashboard/domain/usecases/dashboard_usecases.dart';
import 'package:siap/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:siap/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required GetDashboardSummaryUseCase getSummaryUseCase,
    required GetDashboardChartsUseCase getChartsUseCase,
  }) : _getSummaryUseCase = getSummaryUseCase,
       _getChartsUseCase = getChartsUseCase,
       super(const DashboardState.initial()) {
    on<DashboardStarted>(_onLoad);
    on<DashboardRefreshed>(_onLoad);
  }

  final GetDashboardSummaryUseCase _getSummaryUseCase;
  final GetDashboardChartsUseCase _getChartsUseCase;

  Future<void> _onLoad(
    DashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());

    final summaryResult = await _getSummaryUseCase(const NoParams());
    final chartsResult = await _getChartsUseCase(const NoParams());

    if (summaryResult is Success<DashboardSummary> &&
        chartsResult is Success<DashboardCharts>) {
      emit(
        DashboardState.success(
          summary: summaryResult.data,
          charts: chartsResult.data,
        ),
      );
      return;
    }

    if (summaryResult is ErrorResult<DashboardSummary>) {
      emit(DashboardState.error(summaryResult.failure.message));
      return;
    }

    if (chartsResult is ErrorResult<DashboardCharts>) {
      emit(DashboardState.error(chartsResult.failure.message));
      return;
    }

    emit(const DashboardState.error('Gagal memuat dashboard.'));
  }
}
