import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';

part 'asuransi_list_state.freezed.dart';

@freezed
abstract class AsuransiListState with _$AsuransiListState {
  const factory AsuransiListState.initial() = AsuransiListInitial;
  const factory AsuransiListState.loading() = AsuransiListLoading;
  const factory AsuransiListState.success({
    required List<Asuransi> items,
    required int page,
    required int totalPages,
    required int total,
    required String searchQuery,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedMax,
  }) = AsuransiListSuccess;
  const factory AsuransiListState.error(String message) = AsuransiListError;
}
