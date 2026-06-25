import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';

part 'lahan_model.freezed.dart';
part 'lahan_model.g.dart';

@freezed
abstract class LahanModel with _$LahanModel {
  const LahanModel._();

  const factory LahanModel({
    required String id,
    @JsonKey(name: 'kode_lahan') required String kodeLahan,
    @JsonKey(name: 'nama_lahan') required String namaLahan,
    required double luas,
    required String lokasi,
    String? koordinat,
  }) = _LahanModel;

  factory LahanModel.fromJson(Map<String, dynamic> json) =>
      _$LahanModelFromJson(json);

  Lahan toEntity() => Lahan(
    id: id,
    kodeLahan: kodeLahan,
    namaLahan: namaLahan,
    luas: luas,
    lokasi: lokasi,
    koordinat: koordinat,
  );

  factory LahanModel.fromEntity(Lahan entity) => LahanModel(
    id: entity.id,
    kodeLahan: entity.kodeLahan,
    namaLahan: entity.namaLahan,
    luas: entity.luas,
    lokasi: entity.lokasi,
    koordinat: entity.koordinat,
  );
}

@freezed
abstract class LahanRequestModel with _$LahanRequestModel {
  const factory LahanRequestModel({
    @JsonKey(name: 'kode_lahan') required String kodeLahan,
    @JsonKey(name: 'nama_lahan') required String namaLahan,
    required double luas,
    required String lokasi,
    String? koordinat,
  }) = _LahanRequestModel;

  factory LahanRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LahanRequestModelFromJson(json);
}
