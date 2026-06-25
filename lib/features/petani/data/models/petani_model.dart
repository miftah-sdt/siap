import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';

part 'petani_model.freezed.dart';
part 'petani_model.g.dart';

@freezed
abstract class PetaniModel with _$PetaniModel {
  const PetaniModel._();

  const factory PetaniModel({
    required String id,
    required String nik,
    required String nama,
    required String alamat,
    @JsonKey(name: 'no_hp') required String noHp,
    @JsonKey(name: 'kelompok_tani') required String kelompokTani,
  }) = _PetaniModel;

  factory PetaniModel.fromJson(Map<String, dynamic> json) =>
      _$PetaniModelFromJson(json);

  Petani toEntity() => Petani(
    id: id,
    nik: nik,
    nama: nama,
    alamat: alamat,
    noHp: noHp,
    kelompokTani: kelompokTani,
  );

  factory PetaniModel.fromEntity(Petani entity) => PetaniModel(
    id: entity.id,
    nik: entity.nik,
    nama: entity.nama,
    alamat: entity.alamat,
    noHp: entity.noHp,
    kelompokTani: entity.kelompokTani,
  );
}

@freezed
abstract class PetaniRequestModel with _$PetaniRequestModel {
  const factory PetaniRequestModel({
    required String nik,
    required String nama,
    required String alamat,
    @JsonKey(name: 'no_hp') required String noHp,
    @JsonKey(name: 'kelompok_tani') required String kelompokTani,
  }) = _PetaniRequestModel;

  factory PetaniRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PetaniRequestModelFromJson(json);
}
