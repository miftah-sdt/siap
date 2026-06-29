// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  avatarUrl: json['avatar_url'] as String?,
  petaniId: json['petani_id'] as String?,
  approvalStatus: json['approval_status'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'avatar_url': instance.avatarUrl,
      'petani_id': instance.petaniId,
      'approval_status': instance.approvalStatus,
    };
