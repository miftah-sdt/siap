import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';

part 'lahan_list_state.freezed.dart';

@freezed
abstract class LahanListState with _$LahanListState {
  const factory LahanListState.initial() = LahanListInitial;
  const factory LahanListState.loading() = LahanListLoading;
  const factory LahanListState.success({
    required List<Lahan> items,
    required int page,
    required int totalPages,
    required int total,
    required String searchQuery,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedMax,
  }) = LahanListSuccess;
  const factory LahanListState.error(String message) = LahanListError;
}
