import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';

part 'lahan_form_state.freezed.dart';

@freezed
abstract class LahanFormState with _$LahanFormState {
  const factory LahanFormState.initial() = LahanFormInitial;
  const factory LahanFormState.loading() = LahanFormLoading;
  const factory LahanFormState.editing(Lahan lahan) = LahanFormEditing;
  const factory LahanFormState.success() = LahanFormSuccess;
  const factory LahanFormState.error(String message) = LahanFormError;
}
