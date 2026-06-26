import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';

part 'lahan_form_event.freezed.dart';

@freezed
abstract class LahanFormEvent with _$LahanFormEvent {
  const factory LahanFormEvent.started({Lahan? lahan}) = LahanFormStarted;
  const factory LahanFormEvent.submitted({
    required String petaniId,
    required String petaniNama,
    required String kodeLahan,
    required String namaLahan,
    required double luas,
    required String lokasi,
    String? koordinat,
  }) = LahanFormSubmitted;
}
