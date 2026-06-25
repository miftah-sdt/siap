import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';

part 'klaim_list_state.freezed.dart';

@freezed
abstract class KlaimListState with _$KlaimListState {
  const factory KlaimListState.initial() = KlaimListInitial;
  const factory KlaimListState.loading() = KlaimListLoading;
  const factory KlaimListState.success({
    required List<Klaim> items,
    required int page,
    required int totalPages,
    required int total,
    required String searchQuery,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedMax,
  }) = KlaimListSuccess;
  const factory KlaimListState.error(String message) = KlaimListError;
}
