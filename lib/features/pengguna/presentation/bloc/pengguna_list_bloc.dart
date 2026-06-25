import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/constants/app_constants.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/pengguna/domain/usecases/pengguna_usecases.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_list_event.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_list_state.dart';

class PenggunaListBloc extends Bloc<PenggunaListEvent, PenggunaListState> {
  PenggunaListBloc({
    required GetPenggunaListUseCase getPenggunaListUseCase,
    required DeletePenggunaUseCase deletePenggunaUseCase,
  }) : _getPenggunaListUseCase = getPenggunaListUseCase,
       _deletePenggunaUseCase = deletePenggunaUseCase,
       super(const PenggunaListState.initial()) {
    on<PenggunaListStarted>(_onStarted);
    on<PenggunaListRefreshed>(_onStarted);
    on<PenggunaListSearched>(_onSearched);
    on<PenggunaListLoadMore>(_onLoadMore);
    on<PenggunaListDeleted>(_onDeleted);
  }

  final GetPenggunaListUseCase _getPenggunaListUseCase;
  final DeletePenggunaUseCase _deletePenggunaUseCase;

  String _searchQuery = '';

  Future<void> _onStarted(
    PenggunaListEvent event,
    Emitter<PenggunaListState> emit,
  ) async {
    emit(const PenggunaListState.loading());
    final result = await _getPenggunaListUseCase(
      GetPenggunaListParams(
        page: 1,
        limit: AppConstants.defaultPageSize,
        search: _searchQuery.isEmpty ? null : _searchQuery,
      ),
    );

    switch (result) {
      case Success(:final data):
        emit(
          PenggunaListState.success(
            items: data.items,
            page: data.page,
            totalPages: data.totalPages,
            total: data.total,
            searchQuery: _searchQuery,
            hasReachedMax: data.page >= data.totalPages,
          ),
        );
      case ErrorResult(:final failure):
        emit(PenggunaListState.error(failure.message));
    }
  }

  Future<void> _onSearched(
    PenggunaListSearched event,
    Emitter<PenggunaListState> emit,
  ) async {
    _searchQuery = event.query.trim();
    add(const PenggunaListEvent.started());
  }

  Future<void> _onLoadMore(
    PenggunaListLoadMore event,
    Emitter<PenggunaListState> emit,
  ) async {
    final current = state;
    if (current is! PenggunaListSuccess ||
        current.isLoadingMore ||
        current.hasReachedMax) {
      return;
    }

    emit(current.copyWith(isLoadingMore: true));
    final nextPage = current.page + 1;

    final result = await _getPenggunaListUseCase(
      GetPenggunaListParams(
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
        emit(PenggunaListState.error(failure.message));
    }
  }

  Future<void> _onDeleted(
    PenggunaListDeleted event,
    Emitter<PenggunaListState> emit,
  ) async {
    final result = await _deletePenggunaUseCase(event.id);
    switch (result) {
      case Success():
        add(const PenggunaListEvent.refreshed());
      case ErrorResult(:final failure):
        emit(PenggunaListState.error(failure.message));
    }
  }
}
