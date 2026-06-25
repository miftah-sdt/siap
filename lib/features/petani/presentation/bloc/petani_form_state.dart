import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';

part 'petani_form_state.freezed.dart';

@freezed
abstract class PetaniFormState with _$PetaniFormState {
  const factory PetaniFormState.initial() = PetaniFormInitial;
  const factory PetaniFormState.loading() = PetaniFormLoading;
  const factory PetaniFormState.editing(Petani petani) = PetaniFormEditing;
  const factory PetaniFormState.success() = PetaniFormSuccess;
  const factory PetaniFormState.error(String message) = PetaniFormError;
}
