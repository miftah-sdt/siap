import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';

part 'klaim_model.freezed.dart';
part 'klaim_model.g.dart';

@freezed
abstract class KlaimModel with _$KlaimModel {
  const KlaimModel._();

  const factory KlaimModel({
    required String id,
    @JsonKey(name: 'nomor_klaim') required String nomorKlaim,
    @JsonKey(name: 'polis_id') required String polisId,
    @JsonKey(name: 'polis_nomor') required String polisNomor,
    required String deskripsi,
    required String status,
    @JsonKey(name: 'bukti_kerusakan') required List<String> buktiKerusakan,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _KlaimModel;

  factory KlaimModel.fromJson(Map<String, dynamic> json) =>
      _$KlaimModelFromJson(json);

  Klaim toEntity() => Klaim(
    id: id,
    nomorKlaim: nomorKlaim,
    polisId: polisId,
    polisNomor: polisNomor,
    deskripsi: deskripsi,
    status: KlaimStatus.fromString(status),
    buktiKerusakan: buktiKerusakan,
    createdAt: createdAt,
  );

  factory KlaimModel.fromEntity(Klaim entity) => KlaimModel(
    id: entity.id,
    nomorKlaim: entity.nomorKlaim,
    polisId: entity.polisId,
    polisNomor: entity.polisNomor,
    deskripsi: entity.deskripsi,
    status: entity.status.name,
    buktiKerusakan: entity.buktiKerusakan,
    createdAt: entity.createdAt,
  );
}

@freezed
abstract class KlaimRequestModel with _$KlaimRequestModel {
  const factory KlaimRequestModel({
    @JsonKey(name: 'nomor_klaim') required String nomorKlaim,
    @JsonKey(name: 'polis_id') required String polisId,
    @JsonKey(name: 'polis_nomor') required String polisNomor,
    required String deskripsi,
    @JsonKey(name: 'bukti_kerusakan') required List<String> buktiKerusakan,
  }) = _KlaimRequestModel;

  factory KlaimRequestModel.fromJson(Map<String, dynamic> json) =>
      _$KlaimRequestModelFromJson(json);
}
