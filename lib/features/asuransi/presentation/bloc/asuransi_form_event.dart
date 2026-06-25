import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';

part 'asuransi_form_event.freezed.dart';

@freezed
abstract class AsuransiFormEvent with _$AsuransiFormEvent {
  const factory AsuransiFormEvent.started({Asuransi? asuransi}) =
      AsuransiFormStarted;
  const factory AsuransiFormEvent.submitted({
    required String nomorPolis,
    required String petaniId,
    required String petaniNama,
    required String lahanId,
    required String lahanNama,
    required List<String> documents,
  }) = AsuransiFormSubmitted;
}
