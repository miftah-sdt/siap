import 'package:freezed_annotation/freezed_annotation.dart';

part 'lahan_list_event.freezed.dart';

@freezed
abstract class LahanListEvent with _$LahanListEvent {
  const factory LahanListEvent.started() = LahanListStarted;
  const factory LahanListEvent.refreshed() = LahanListRefreshed;
  const factory LahanListEvent.searched(String query) = LahanListSearched;
  const factory LahanListEvent.loadMore() = LahanListLoadMore;
  const factory LahanListEvent.deleted(String id) = LahanListDeleted;
}
