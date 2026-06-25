import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';

part 'klaim_form_state.freezed.dart';

@freezed
abstract class KlaimFormState with _$KlaimFormState {
  const factory KlaimFormState.initial() = KlaimFormInitial;
  const factory KlaimFormState.loading() = KlaimFormLoading;
  const factory KlaimFormState.editing(Klaim klaim) = KlaimFormEditing;
  const factory KlaimFormState.success() = KlaimFormSuccess;
  const factory KlaimFormState.error(String message) = KlaimFormError;
}
