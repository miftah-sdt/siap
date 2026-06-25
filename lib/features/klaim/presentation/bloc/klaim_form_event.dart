import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';

part 'klaim_form_event.freezed.dart';

@freezed
abstract class KlaimFormEvent with _$KlaimFormEvent {
  const factory KlaimFormEvent.started({Klaim? klaim}) = KlaimFormStarted;
  const factory KlaimFormEvent.submitted({
    required String nomorKlaim,
    required String polisId,
    required String polisNomor,
    required String deskripsi,
    required List<String> buktiKerusakan,
  }) = KlaimFormSubmitted;
}
