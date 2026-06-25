import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';

part 'pengguna_form_state.freezed.dart';

@freezed
abstract class PenggunaFormState with _$PenggunaFormState {
  const factory PenggunaFormState.initial() = PenggunaFormInitial;
  const factory PenggunaFormState.loading() = PenggunaFormLoading;
  const factory PenggunaFormState.editing(Pengguna pengguna) =
      PenggunaFormEditing;
  const factory PenggunaFormState.success() = PenggunaFormSuccess;
  const factory PenggunaFormState.error(String message) = PenggunaFormError;
}
