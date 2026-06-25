import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/constants/app_constants.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/lahan/domain/usecases/lahan_usecases.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_list_event.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_list_state.dart';

class LahanListBloc extends Bloc<LahanListEvent, LahanListState> {
  LahanListBloc({
    required GetLahanListUseCase getLahanListUseCase,
    required DeleteLahanUseCase deleteLahanUseCase,
  }) : _getLahanListUseCase = getLahanListUseCase,
       _deleteLahanUseCase = deleteLahanUseCase,
       super(const LahanListState.initial()) {
    on<LahanListStarted>(_onStarted);
    on<LahanListRefreshed>(_onStarted);
    on<LahanListSearched>(_onSearched);
    on<LahanListLoadMore>(_onLoadMore);
    on<LahanListDeleted>(_onDeleted);
  }

  final GetLahanListUseCase _getLahanListUseCase;
  final DeleteLahanUseCase _deleteLahanUseCase;

  String _searchQuery = '';

  Future<void> _onStarted(
    LahanListEvent event,
    Emitter<LahanListState> emit,
  ) async {
    emit(const LahanListState.loading());
    final result = await _getLahanListUseCase(
      GetLahanListParams(
        page: 1,
        limit: AppConstants.defaultPageSize,
        search: _searchQuery.isEmpty ? null : _searchQuery,
      ),
    );

    switch (result) {
      case Success(:final data):
        emit(
          LahanListState.success(
            items: data.items,
            page: data.page,
            totalPages: data.totalPages,
            total: data.total,
            searchQuery: _searchQuery,
            hasReachedMax: data.page >= data.totalPages,
          ),
        );
      case ErrorResult(:final failure):
        emit(LahanListState.error(failure.message));
    }
  }

  Future<void> _onSearched(
    LahanListSearched event,
    Emitter<LahanListState> emit,
  ) async {
    _searchQuery = event.query.trim();
    add(const LahanListEvent.started());
  }

  Future<void> _onLoadMore(
    LahanListLoadMore event,
    Emitter<LahanListState> emit,
  ) async {
    final current = state;
    if (current is! LahanListSuccess ||
        current.isLoadingMore ||
        current.hasReachedMax) {
      return;
    }

    emit(current.copyWith(isLoadingMore: true));
    final nextPage = current.page + 1;

    final result = await _getLahanListUseCase(
      GetLahanListParams(
        page: nextPage,
        limit: AppConstants.defaultPageSize,
        search: _searchQuery.isEmpty ? null : _searchQuery,
      ),
    );

    switch (result) {
      case Success(:final data):
        emit(
          current.copyWith(
            items: [...current.items, ...data.items],
            page: data.page,
            totalPages: data.totalPages,
            total: data.total,
            isLoadingMore: false,
            hasReachedMax: data.page >= data.totalPages,
          ),
        );
      case ErrorResult(:final failure):
        emit(current.copyWith(isLoadingMore: false));
        emit(LahanListState.error(failure.message));
    }
  }

  Future<void> _onDeleted(
    LahanListDeleted event,
    Emitter<LahanListState> emit,
  ) async {
    final result = await _deleteLahanUseCase(event.id);
    switch (result) {
      case Success():
        add(const LahanListEvent.refreshed());
      case ErrorResult(:final failure):
        emit(LahanListState.error(failure.message));
    }
  }
}
