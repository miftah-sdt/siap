import 'package:freezed_annotation/freezed_annotation.dart';

part 'klaim_list_event.freezed.dart';

@freezed
abstract class KlaimListEvent with _$KlaimListEvent {
  const factory KlaimListEvent.started() = KlaimListStarted;
  const factory KlaimListEvent.refreshed() = KlaimListRefreshed;
  const factory KlaimListEvent.searched(String query) = KlaimListSearched;
  const factory KlaimListEvent.loadMore() = KlaimListLoadMore;
  const factory KlaimListEvent.deleted(String id) = KlaimListDeleted;
}
