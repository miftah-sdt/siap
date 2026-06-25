import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';

part 'pengguna_list_state.freezed.dart';

@freezed
abstract class PenggunaListState with _$PenggunaListState {
  const factory PenggunaListState.initial() = PenggunaListInitial;
  const factory PenggunaListState.loading() = PenggunaListLoading;
  const factory PenggunaListState.success({
    required List<Pengguna> items,
    required int page,
    required int totalPages,
    required int total,
    required String searchQuery,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedMax,
  }) = PenggunaListSuccess;
  const factory PenggunaListState.error(String message) = PenggunaListError;
}
