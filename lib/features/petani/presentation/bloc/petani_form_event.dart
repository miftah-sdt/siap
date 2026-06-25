import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';

part 'petani_form_event.freezed.dart';

@freezed
abstract class PetaniFormEvent with _$PetaniFormEvent {
  const factory PetaniFormEvent.started({Petani? petani}) = PetaniFormStarted;
  const factory PetaniFormEvent.submitted({
    required String nik,
    required String nama,
    required String alamat,
    required String noHp,
    required String kelompokTani,
  }) = PetaniFormSubmitted;
}
