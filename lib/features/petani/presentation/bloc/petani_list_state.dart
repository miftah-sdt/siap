import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';

part 'petani_list_state.freezed.dart';

@freezed
abstract class PetaniListState with _$PetaniListState {
  const factory PetaniListState.initial() = PetaniListInitial;
  const factory PetaniListState.loading() = PetaniListLoading;
  const factory PetaniListState.success({
    required List<Petani> items,
    required int page,
    required int totalPages,
    required int total,
    required String searchQuery,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedMax,
  }) = PetaniListSuccess;
  const factory PetaniListState.error(String message) = PetaniListError;
}
