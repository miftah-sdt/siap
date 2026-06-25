import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';

part 'asuransi_form_state.freezed.dart';

@freezed
abstract class AsuransiFormState with _$AsuransiFormState {
  const factory AsuransiFormState.initial() = AsuransiFormInitial;
  const factory AsuransiFormState.loading() = AsuransiFormLoading;
  const factory AsuransiFormState.editing(Asuransi asuransi) =
      AsuransiFormEditing;
  const factory AsuransiFormState.success() = AsuransiFormSuccess;
  const factory AsuransiFormState.error(String message) = AsuransiFormError;
}
