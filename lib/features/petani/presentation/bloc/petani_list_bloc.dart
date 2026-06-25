import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/constants/app_constants.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/petani/domain/usecases/petani_usecases.dart';
import 'package:siap/features/petani/presentation/bloc/petani_list_event.dart';
import 'package:siap/features/petani/presentation/bloc/petani_list_state.dart';

class PetaniListBloc extends Bloc<PetaniListEvent, PetaniListState> {
  PetaniListBloc({
    required GetPetaniListUseCase getPetaniListUseCase,
    required DeletePetaniUseCase deletePetaniUseCase,
  }) : _getPetaniListUseCase = getPetaniListUseCase,
       _deletePetaniUseCase = deletePetaniUseCase,
       super(const PetaniListState.initial()) {
    on<PetaniListStarted>(_onStarted);
    on<PetaniListRefreshed>(_onStarted);
    on<PetaniListSearched>(_onSearched);
    on<PetaniListLoadMore>(_onLoadMore);
    on<PetaniListDeleted>(_onDeleted);
  }

  final GetPetaniListUseCase _getPetaniListUseCase;
  final DeletePetaniUseCase _deletePetaniUseCase;

  String _searchQuery = '';

  Future<void> _onStarted(
    PetaniListEvent event,
    Emitter<PetaniListState> emit,
  ) async {
    emit(const PetaniListState.loading());
    final result = await _getPetaniListUseCase(
      GetPetaniListParams(
        page: 1,
        limit: AppConstants.defaultPageSize,
        search: _searchQuery.isEmpty ? null : _searchQuery,
      ),
    );

    switch (result) {
      case Success(:final data):
        emit(
          PetaniListState.success(
            items: data.items,
            page: data.page,
            totalPages: data.totalPages,
            total: data.total,
            searchQuery: _searchQuery,
            hasReachedMax: data.page >= data.totalPages,
          ),
        );
      case ErrorResult(:final failure):
        emit(PetaniListState.error(failure.message));
    }
  }

  Future<void> _onSearched(
    PetaniListSearched event,
    Emitter<PetaniListState> emit,
  ) async {
    _searchQuery = event.query.trim();
    add(const PetaniListEvent.started());
  }

  Future<void> _onLoadMore(
    PetaniListLoadMore event,
    Emitter<PetaniListState> emit,
  ) async {
    final current = state;
    if (current is! PetaniListSuccess ||
        current.isLoadingMore ||
        current.hasReachedMax) {
      return;
    }

    emit(current.copyWith(isLoadingMore: true));
    final nextPage = current.page + 1;

    final result = await _getPetaniListUseCase(
      GetPetaniListParams(
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
        emit(PetaniListState.error(failure.message));
    }
  }

  Future<void> _onDeleted(
    PetaniListDeleted event,
    Emitter<PetaniListState> emit,
  ) async {
    final result = await _deletePetaniUseCase(event.id);
    switch (result) {
      case Success():
        add(const PetaniListEvent.refreshed());
      case ErrorResult(:final failure):
        emit(PetaniListState.error(failure.message));
    }
  }
}
