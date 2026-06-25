// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengguna_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PenggunaModel _$PenggunaModelFromJson(Map<String, dynamic> json) =>
    _PenggunaModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$PenggunaModelToJson(_PenggunaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'is_active': instance.isActive,
    };

_PenggunaRequestModel _$PenggunaRequestModelFromJson(
  Map<String, dynamic> json,
) => _PenggunaRequestModel(
  name: json['name'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  isActive: json['is_active'] as bool,
);

Map<String, dynamic> _$PenggunaRequestModelToJson(
  _PenggunaRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'role': instance.role,
  'is_active': instance.isActive,
};
