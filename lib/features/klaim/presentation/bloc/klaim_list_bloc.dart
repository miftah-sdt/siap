import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/constants/app_constants.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/klaim/domain/usecases/klaim_usecases.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_list_event.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_list_state.dart';

class KlaimListBloc extends Bloc<KlaimListEvent, KlaimListState> {
  KlaimListBloc({
    required GetKlaimListUseCase getKlaimListUseCase,
    required DeleteKlaimUseCase deleteKlaimUseCase,
  }) : _getKlaimListUseCase = getKlaimListUseCase,
       _deleteKlaimUseCase = deleteKlaimUseCase,
       super(const KlaimListState.initial()) {
    on<KlaimListStarted>(_onStarted);
    on<KlaimListRefreshed>(_onStarted);
    on<KlaimListSearched>(_onSearched);
    on<KlaimListLoadMore>(_onLoadMore);
    on<KlaimListDeleted>(_onDeleted);
  }

  final GetKlaimListUseCase _getKlaimListUseCase;
  final DeleteKlaimUseCase _deleteKlaimUseCase;

  String _searchQuery = '';

  Future<void> _onStarted(
    KlaimListEvent event,
    Emitter<KlaimListState> emit,
  ) async {
    emit(const KlaimListState.loading());
    final result = await _getKlaimListUseCase(
      GetKlaimListParams(
        page: 1,
        limit: AppConstants.defaultPageSize,
        search: _searchQuery.isEmpty ? null : _searchQuery,
      ),
    );

    switch (result) {
      case Success(:final data):
        emit(
          KlaimListState.success(
            items: data.items,
            page: data.page,
            totalPages: data.totalPages,
            total: data.total,
            searchQuery: _searchQuery,
            hasReachedMax: data.page >= data.totalPages,
          ),
        );
      case ErrorResult(:final failure):
        emit(KlaimListState.error(failure.message));
    }
  }

  Future<void> _onSearched(
    KlaimListSearched event,
    Emitter<KlaimListState> emit,
  ) async {
    _searchQuery = event.query.trim();
    add(const KlaimListEvent.started());
  }

  Future<void> _onLoadMore(
    KlaimListLoadMore event,
    Emitter<KlaimListState> emit,
  ) async {
    final current = state;
    if (current is! KlaimListSuccess ||
        current.isLoadingMore ||
        current.hasReachedMax) {
      return;
    }

    emit(current.copyWith(isLoadingMore: true));
    final nextPage = current.page + 1;

    final result = await _getKlaimListUseCase(
      GetKlaimListParams(
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
        emit(KlaimListState.error(failure.message));
    }
  }

  Future<void> _onDeleted(
    KlaimListDeleted event,
    Emitter<KlaimListState> emit,
  ) async {
    final result = await _deleteKlaimUseCase(event.id);
    switch (result) {
      case Success():
        add(const KlaimListEvent.refreshed());
      case ErrorResult(:final failure):
        emit(KlaimListState.error(failure.message));
    }
  }
}
