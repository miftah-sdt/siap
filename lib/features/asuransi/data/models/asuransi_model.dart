import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';

part 'asuransi_model.freezed.dart';
part 'asuransi_model.g.dart';

@freezed
abstract class AsuransiModel with _$AsuransiModel {
  const AsuransiModel._();

  const factory AsuransiModel({
    required String id,
    @JsonKey(name: 'nomor_polis') required String nomorPolis,
    @JsonKey(name: 'petani_id') required String petaniId,
    @JsonKey(name: 'petani_nama') required String petaniNama,
    @JsonKey(name: 'lahan_id') required String lahanId,
    @JsonKey(name: 'lahan_nama') required String lahanNama,
    required String status,
    required List<String> documents,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _AsuransiModel;

  factory AsuransiModel.fromJson(Map<String, dynamic> json) =>
      _$AsuransiModelFromJson(json);

  Asuransi toEntity() => Asuransi(
    id: id,
    nomorPolis: nomorPolis,
    petaniId: petaniId,
    petaniNama: petaniNama,
    lahanId: lahanId,
    lahanNama: lahanNama,
    status: AsuransiStatus.fromString(status),
    documents: documents,
    createdAt: createdAt,
  );

  factory AsuransiModel.fromEntity(Asuransi entity) => AsuransiModel(
    id: entity.id,
    nomorPolis: entity.nomorPolis,
    petaniId: entity.petaniId,
    petaniNama: entity.petaniNama,
    lahanId: entity.lahanId,
    lahanNama: entity.lahanNama,
    status: entity.status.name,
    documents: entity.documents,
    createdAt: entity.createdAt,
  );
}

@freezed
abstract class AsuransiRequestModel with _$AsuransiRequestModel {
  const factory AsuransiRequestModel({
    @JsonKey(name: 'nomor_polis') required String nomorPolis,
    @JsonKey(name: 'petani_id') required String petaniId,
    @JsonKey(name: 'petani_nama') required String petaniNama,
    @JsonKey(name: 'lahan_id') required String lahanId,
    @JsonKey(name: 'lahan_nama') required String lahanNama,
    required List<String> documents,
  }) = _AsuransiRequestModel;

  factory AsuransiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AsuransiRequestModelFromJson(json);
}
