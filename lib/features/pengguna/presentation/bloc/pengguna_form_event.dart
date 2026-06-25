import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';

part 'pengguna_form_event.freezed.dart';

@freezed
abstract class PenggunaFormEvent with _$PenggunaFormEvent {
  const factory PenggunaFormEvent.started({Pengguna? pengguna}) =
      PenggunaFormStarted;
  const factory PenggunaFormEvent.submitted({
    required String name,
    required String email,
    required UserRole role,
    required bool isActive,
  }) = PenggunaFormSubmitted;
}
