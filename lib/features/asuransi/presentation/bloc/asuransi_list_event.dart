import 'package:freezed_annotation/freezed_annotation.dart';

part 'asuransi_list_event.freezed.dart';

@freezed
abstract class AsuransiListEvent with _$AsuransiListEvent {
  const factory AsuransiListEvent.started() = AsuransiListStarted;
  const factory AsuransiListEvent.refreshed() = AsuransiListRefreshed;
  const factory AsuransiListEvent.searched(String query) = AsuransiListSearched;
  const factory AsuransiListEvent.loadMore() = AsuransiListLoadMore;
  const factory AsuransiListEvent.deleted(String id) = AsuransiListDeleted;
}
