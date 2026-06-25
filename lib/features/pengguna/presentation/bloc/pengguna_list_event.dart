import 'package:freezed_annotation/freezed_annotation.dart';

part 'pengguna_list_event.freezed.dart';

@freezed
abstract class PenggunaListEvent with _$PenggunaListEvent {
  const factory PenggunaListEvent.started() = PenggunaListStarted;
  const factory PenggunaListEvent.refreshed() = PenggunaListRefreshed;
  const factory PenggunaListEvent.searched(String query) = PenggunaListSearched;
  const factory PenggunaListEvent.loadMore() = PenggunaListLoadMore;
  const factory PenggunaListEvent.deleted(String id) = PenggunaListDeleted;
}
