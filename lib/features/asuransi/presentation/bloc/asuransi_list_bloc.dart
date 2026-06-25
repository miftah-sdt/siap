import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/constants/app_constants.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/asuransi/domain/usecases/asuransi_usecases.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_list_event.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_list_state.dart';

class AsuransiListBloc extends Bloc<AsuransiListEvent, AsuransiListState> {
  AsuransiListBloc({
    required GetAsuransiListUseCase getAsuransiListUseCase,
    required DeleteAsuransiUseCase deleteAsuransiUseCase,
  }) : _getAsuransiListUseCase = getAsuransiListUseCase,
       _deleteAsuransiUseCase = deleteAsuransiUseCase,
       super(const AsuransiListState.initial()) {
    on<AsuransiListStarted>(_onStarted);
    on<AsuransiListRefreshed>(_onStarted);
    on<AsuransiListSearched>(_onSearched);
    on<AsuransiListLoadMore>(_onLoadMore);
    on<AsuransiListDeleted>(_onDeleted);
  }

  final GetAsuransiListUseCase _getAsuransiListUseCase;
  final DeleteAsuransiUseCase _deleteAsuransiUseCase;

  String _searchQuery = '';

  Future<void> _onStarted(
    AsuransiListEvent event,
    Emitter<AsuransiListState> emit,
  ) async {
    emit(const AsuransiListState.loading());
    final result = await _getAsuransiListUseCase(
      GetAsuransiListParams(
        page: 1,
        limit: AppConstants.defaultPageSize,
        search: _searchQuery.isEmpty ? null : _searchQuery,
      ),
    );

    switch (result) {
      case Success(:final data):
        emit(
          AsuransiListState.success(
            items: data.items,
            page: data.page,
            totalPages: data.totalPages,
            total: data.total,
            searchQuery: _searchQuery,
            hasReachedMax: data.page >= data.totalPages,
          ),
        );
      case ErrorResult(:final failure):
        emit(AsuransiListState.error(failure.message));
    }
  }

  Future<void> _onSearched(
    AsuransiListSearched event,
    Emitter<AsuransiListState> emit,
  ) async {
    _searchQuery = event.query.trim();
    add(const AsuransiListEvent.started());
  }

  Future<void> _onLoadMore(
    AsuransiListLoadMore event,
    Emitter<AsuransiListState> emit,
  ) async {
    final current = state;
    if (current is! AsuransiListSuccess ||
        current.isLoadingMore ||
        current.hasReachedMax) {
      return;
    }

    emit(current.copyWith(isLoadingMore: true));
    final nextPage = current.page + 1;

    final result = await _getAsuransiListUseCase(
      GetAsuransiListParams(
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
        emit(AsuransiListState.error(failure.message));
    }
  }

  Future<void> _onDeleted(
    AsuransiListDeleted event,
    Emitter<AsuransiListState> emit,
  ) async {
    final result = await _deleteAsuransiUseCase(event.id);
    switch (result) {
      case Success():
        add(const AsuransiListEvent.refreshed());
      case ErrorResult(:final failure):
        emit(AsuransiListState.error(failure.message));
    }
  }
}
