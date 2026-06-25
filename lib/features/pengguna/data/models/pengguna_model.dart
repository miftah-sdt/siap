import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';

part 'pengguna_model.freezed.dart';
part 'pengguna_model.g.dart';

@freezed
abstract class PenggunaModel with _$PenggunaModel {
  const PenggunaModel._();

  const factory PenggunaModel({
    required String id,
    required String name,
    required String email,
    required String role,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _PenggunaModel;

  factory PenggunaModel.fromJson(Map<String, dynamic> json) =>
      _$PenggunaModelFromJson(json);

  Pengguna toEntity() => Pengguna(
    id: id,
    name: name,
    email: email,
    role: UserRole.fromString(role),
    isActive: isActive,
  );

  factory PenggunaModel.fromEntity(Pengguna entity) => PenggunaModel(
    id: entity.id,
    name: entity.name,
    email: entity.email,
    role: entity.role.name,
    isActive: entity.isActive,
  );
}

@freezed
abstract class PenggunaRequestModel with _$PenggunaRequestModel {
  const factory PenggunaRequestModel({
    required String name,
    required String email,
    required String role,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _PenggunaRequestModel;

  factory PenggunaRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PenggunaRequestModelFromJson(json);
}
