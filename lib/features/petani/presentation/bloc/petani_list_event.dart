import 'package:freezed_annotation/freezed_annotation.dart';

part 'petani_list_event.freezed.dart';

@freezed
abstract class PetaniListEvent with _$PetaniListEvent {
  const factory PetaniListEvent.started() = PetaniListStarted;
  const factory PetaniListEvent.refreshed() = PetaniListRefreshed;
  const factory PetaniListEvent.searched(String query) = PetaniListSearched;
  const factory PetaniListEvent.loadMore() = PetaniListLoadMore;
  const factory PetaniListEvent.deleted(String id) = PetaniListDeleted;
}
