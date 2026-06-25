// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'klaim_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KlaimModel {

 String get id;@JsonKey(name: 'nomor_klaim') String get nomorKlaim;@JsonKey(name: 'polis_id') String get polisId;@JsonKey(name: 'polis_nomor') String get polisNomor; String get deskripsi; String get status;@JsonKey(name: 'bukti_kerusakan') List<String> get buktiKerusakan;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of KlaimModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KlaimModelCopyWith<KlaimModel> get copyWith => _$KlaimModelCopyWithImpl<KlaimModel>(this as KlaimModel, _$identity);

  /// Serializes this KlaimModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nomorKlaim, nomorKlaim) || other.nomorKlaim == nomorKlaim)&&(identical(other.polisId, polisId) || other.polisId == polisId)&&(identical(other.polisNomor, polisNomor) || other.polisNomor == polisNomor)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.buktiKerusakan, buktiKerusakan)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nomorKlaim,polisId,polisNomor,deskripsi,status,const DeepCollectionEquality().hash(buktiKerusakan),createdAt);

@override
String toString() {
  return 'KlaimModel(id: $id, nomorKlaim: $nomorKlaim, polisId: $polisId, polisNomor: $polisNomor, deskripsi: $deskripsi, status: $status, buktiKerusakan: $buktiKerusakan, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $KlaimModelCopyWith<$Res>  {
  factory $KlaimModelCopyWith(KlaimModel value, $Res Function(KlaimModel) _then) = _$KlaimModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'nomor_klaim') String nomorKlaim,@JsonKey(name: 'polis_id') String polisId,@JsonKey(name: 'polis_nomor') String polisNomor, String deskripsi, String status,@JsonKey(name: 'bukti_kerusakan') List<String> buktiKerusakan,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$KlaimModelCopyWithImpl<$Res>
    implements $KlaimModelCopyWith<$Res> {
  _$KlaimModelCopyWithImpl(this._self, this._then);

  final KlaimModel _self;
  final $Res Function(KlaimModel) _then;

/// Create a copy of KlaimModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nomorKlaim = null,Object? polisId = null,Object? polisNomor = null,Object? deskripsi = null,Object? status = null,Object? buktiKerusakan = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nomorKlaim: null == nomorKlaim ? _self.nomorKlaim : nomorKlaim // ignore: cast_nullable_to_non_nullable
as String,polisId: null == polisId ? _self.polisId : polisId // ignore: cast_nullable_to_non_nullable
as String,polisNomor: null == polisNomor ? _self.polisNomor : polisNomor // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,buktiKerusakan: null == buktiKerusakan ? _self.buktiKerusakan : buktiKerusakan // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [KlaimModel].
extension KlaimModelPatterns on KlaimModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KlaimModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KlaimModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KlaimModel value)  $default,){
final _that = this;
switch (_that) {
case _KlaimModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KlaimModel value)?  $default,){
final _that = this;
switch (_that) {
case _KlaimModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'nomor_klaim')  String nomorKlaim, @JsonKey(name: 'polis_id')  String polisId, @JsonKey(name: 'polis_nomor')  String polisNomor,  String deskripsi,  String status, @JsonKey(name: 'bukti_kerusakan')  List<String> buktiKerusakan, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KlaimModel() when $default != null:
return $default(_that.id,_that.nomorKlaim,_that.polisId,_that.polisNomor,_that.deskripsi,_that.status,_that.buktiKerusakan,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'nomor_klaim')  String nomorKlaim, @JsonKey(name: 'polis_id')  String polisId, @JsonKey(name: 'polis_nomor')  String polisNomor,  String deskripsi,  String status, @JsonKey(name: 'bukti_kerusakan')  List<String> buktiKerusakan, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _KlaimModel():
return $default(_that.id,_that.nomorKlaim,_that.polisId,_that.polisNomor,_that.deskripsi,_that.status,_that.buktiKerusakan,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'nomor_klaim')  String nomorKlaim, @JsonKey(name: 'polis_id')  String polisId, @JsonKey(name: 'polis_nomor')  String polisNomor,  String deskripsi,  String status, @JsonKey(name: 'bukti_kerusakan')  List<String> buktiKerusakan, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _KlaimModel() when $default != null:
return $default(_that.id,_that.nomorKlaim,_that.polisId,_that.polisNomor,_that.deskripsi,_that.status,_that.buktiKerusakan,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KlaimModel extends KlaimModel {
  const _KlaimModel({required this.id, @JsonKey(name: 'nomor_klaim') required this.nomorKlaim, @JsonKey(name: 'polis_id') required this.polisId, @JsonKey(name: 'polis_nomor') required this.polisNomor, required this.deskripsi, required this.status, @JsonKey(name: 'bukti_kerusakan') required final  List<String> buktiKerusakan, @JsonKey(name: 'created_at') required this.createdAt}): _buktiKerusakan = buktiKerusakan,super._();
  factory _KlaimModel.fromJson(Map<String, dynamic> json) => _$KlaimModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'nomor_klaim') final  String nomorKlaim;
@override@JsonKey(name: 'polis_id') final  String polisId;
@override@JsonKey(name: 'polis_nomor') final  String polisNomor;
@override final  String deskripsi;
@override final  String status;
 final  List<String> _buktiKerusakan;
@override@JsonKey(name: 'bukti_kerusakan') List<String> get buktiKerusakan {
  if (_buktiKerusakan is EqualUnmodifiableListView) return _buktiKerusakan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_buktiKerusakan);
}

@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of KlaimModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KlaimModelCopyWith<_KlaimModel> get copyWith => __$KlaimModelCopyWithImpl<_KlaimModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KlaimModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KlaimModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nomorKlaim, nomorKlaim) || other.nomorKlaim == nomorKlaim)&&(identical(other.polisId, polisId) || other.polisId == polisId)&&(identical(other.polisNomor, polisNomor) || other.polisNomor == polisNomor)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._buktiKerusakan, _buktiKerusakan)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nomorKlaim,polisId,polisNomor,deskripsi,status,const DeepCollectionEquality().hash(_buktiKerusakan),createdAt);

@override
String toString() {
  return 'KlaimModel(id: $id, nomorKlaim: $nomorKlaim, polisId: $polisId, polisNomor: $polisNomor, deskripsi: $deskripsi, status: $status, buktiKerusakan: $buktiKerusakan, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$KlaimModelCopyWith<$Res> implements $KlaimModelCopyWith<$Res> {
  factory _$KlaimModelCopyWith(_KlaimModel value, $Res Function(_KlaimModel) _then) = __$KlaimModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'nomor_klaim') String nomorKlaim,@JsonKey(name: 'polis_id') String polisId,@JsonKey(name: 'polis_nomor') String polisNomor, String deskripsi, String status,@JsonKey(name: 'bukti_kerusakan') List<String> buktiKerusakan,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$KlaimModelCopyWithImpl<$Res>
    implements _$KlaimModelCopyWith<$Res> {
  __$KlaimModelCopyWithImpl(this._self, this._then);

  final _KlaimModel _self;
  final $Res Function(_KlaimModel) _then;

/// Create a copy of KlaimModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nomorKlaim = null,Object? polisId = null,Object? polisNomor = null,Object? deskripsi = null,Object? status = null,Object? buktiKerusakan = null,Object? createdAt = null,}) {
  return _then(_KlaimModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nomorKlaim: null == nomorKlaim ? _self.nomorKlaim : nomorKlaim // ignore: cast_nullable_to_non_nullable
as String,polisId: null == polisId ? _self.polisId : polisId // ignore: cast_nullable_to_non_nullable
as String,polisNomor: null == polisNomor ? _self.polisNomor : polisNomor // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,buktiKerusakan: null == buktiKerusakan ? _self._buktiKerusakan : buktiKerusakan // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$KlaimRequestModel {

@JsonKey(name: 'nomor_klaim') String get nomorKlaim;@JsonKey(name: 'polis_id') String get polisId;@JsonKey(name: 'polis_nomor') String get polisNomor; String get deskripsi;@JsonKey(name: 'bukti_kerusakan') List<String> get buktiKerusakan;
/// Create a copy of KlaimRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KlaimRequestModelCopyWith<KlaimRequestModel> get copyWith => _$KlaimRequestModelCopyWithImpl<KlaimRequestModel>(this as KlaimRequestModel, _$identity);

  /// Serializes this KlaimRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimRequestModel&&(identical(other.nomorKlaim, nomorKlaim) || other.nomorKlaim == nomorKlaim)&&(identical(other.polisId, polisId) || other.polisId == polisId)&&(identical(other.polisNomor, polisNomor) || other.polisNomor == polisNomor)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&const DeepCollectionEquality().equals(other.buktiKerusakan, buktiKerusakan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nomorKlaim,polisId,polisNomor,deskripsi,const DeepCollectionEquality().hash(buktiKerusakan));

@override
String toString() {
  return 'KlaimRequestModel(nomorKlaim: $nomorKlaim, polisId: $polisId, polisNomor: $polisNomor, deskripsi: $deskripsi, buktiKerusakan: $buktiKerusakan)';
}


}

/// @nodoc
abstract mixin class $KlaimRequestModelCopyWith<$Res>  {
  factory $KlaimRequestModelCopyWith(KlaimRequestModel value, $Res Function(KlaimRequestModel) _then) = _$KlaimRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'nomor_klaim') String nomorKlaim,@JsonKey(name: 'polis_id') String polisId,@JsonKey(name: 'polis_nomor') String polisNomor, String deskripsi,@JsonKey(name: 'bukti_kerusakan') List<String> buktiKerusakan
});




}
/// @nodoc
class _$KlaimRequestModelCopyWithImpl<$Res>
    implements $KlaimRequestModelCopyWith<$Res> {
  _$KlaimRequestModelCopyWithImpl(this._self, this._then);

  final KlaimRequestModel _self;
  final $Res Function(KlaimRequestModel) _then;

/// Create a copy of KlaimRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nomorKlaim = null,Object? polisId = null,Object? polisNomor = null,Object? deskripsi = null,Object? buktiKerusakan = null,}) {
  return _then(_self.copyWith(
nomorKlaim: null == nomorKlaim ? _self.nomorKlaim : nomorKlaim // ignore: cast_nullable_to_non_nullable
as String,polisId: null == polisId ? _self.polisId : polisId // ignore: cast_nullable_to_non_nullable
as String,polisNomor: null == polisNomor ? _self.polisNomor : polisNomor // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,buktiKerusakan: null == buktiKerusakan ? _self.buktiKerusakan : buktiKerusakan // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [KlaimRequestModel].
extension KlaimRequestModelPatterns on KlaimRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KlaimRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KlaimRequestModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KlaimRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _KlaimRequestModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KlaimRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _KlaimRequestModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'nomor_klaim')  String nomorKlaim, @JsonKey(name: 'polis_id')  String polisId, @JsonKey(name: 'polis_nomor')  String polisNomor,  String deskripsi, @JsonKey(name: 'bukti_kerusakan')  List<String> buktiKerusakan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KlaimRequestModel() when $default != null:
return $default(_that.nomorKlaim,_that.polisId,_that.polisNomor,_that.deskripsi,_that.buktiKerusakan);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'nomor_klaim')  String nomorKlaim, @JsonKey(name: 'polis_id')  String polisId, @JsonKey(name: 'polis_nomor')  String polisNomor,  String deskripsi, @JsonKey(name: 'bukti_kerusakan')  List<String> buktiKerusakan)  $default,) {final _that = this;
switch (_that) {
case _KlaimRequestModel():
return $default(_that.nomorKlaim,_that.polisId,_that.polisNomor,_that.deskripsi,_that.buktiKerusakan);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'nomor_klaim')  String nomorKlaim, @JsonKey(name: 'polis_id')  String polisId, @JsonKey(name: 'polis_nomor')  String polisNomor,  String deskripsi, @JsonKey(name: 'bukti_kerusakan')  List<String> buktiKerusakan)?  $default,) {final _that = this;
switch (_that) {
case _KlaimRequestModel() when $default != null:
return $default(_that.nomorKlaim,_that.polisId,_that.polisNomor,_that.deskripsi,_that.buktiKerusakan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KlaimRequestModel implements KlaimRequestModel {
  const _KlaimRequestModel({@JsonKey(name: 'nomor_klaim') required this.nomorKlaim, @JsonKey(name: 'polis_id') required this.polisId, @JsonKey(name: 'polis_nomor') required this.polisNomor, required this.deskripsi, @JsonKey(name: 'bukti_kerusakan') required final  List<String> buktiKerusakan}): _buktiKerusakan = buktiKerusakan;
  factory _KlaimRequestModel.fromJson(Map<String, dynamic> json) => _$KlaimRequestModelFromJson(json);

@override@JsonKey(name: 'nomor_klaim') final  String nomorKlaim;
@override@JsonKey(name: 'polis_id') final  String polisId;
@override@JsonKey(name: 'polis_nomor') final  String polisNomor;
@override final  String deskripsi;
 final  List<String> _buktiKerusakan;
@override@JsonKey(name: 'bukti_kerusakan') List<String> get buktiKerusakan {
  if (_buktiKerusakan is EqualUnmodifiableListView) return _buktiKerusakan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_buktiKerusakan);
}


/// Create a copy of KlaimRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KlaimRequestModelCopyWith<_KlaimRequestModel> get copyWith => __$KlaimRequestModelCopyWithImpl<_KlaimRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KlaimRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KlaimRequestModel&&(identical(other.nomorKlaim, nomorKlaim) || other.nomorKlaim == nomorKlaim)&&(identical(other.polisId, polisId) || other.polisId == polisId)&&(identical(other.polisNomor, polisNomor) || other.polisNomor == polisNomor)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&const DeepCollectionEquality().equals(other._buktiKerusakan, _buktiKerusakan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nomorKlaim,polisId,polisNomor,deskripsi,const DeepCollectionEquality().hash(_buktiKerusakan));

@override
String toString() {
  return 'KlaimRequestModel(nomorKlaim: $nomorKlaim, polisId: $polisId, polisNomor: $polisNomor, deskripsi: $deskripsi, buktiKerusakan: $buktiKerusakan)';
}


}

/// @nodoc
abstract mixin class _$KlaimRequestModelCopyWith<$Res> implements $KlaimRequestModelCopyWith<$Res> {
  factory _$KlaimRequestModelCopyWith(_KlaimRequestModel value, $Res Function(_KlaimRequestModel) _then) = __$KlaimRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'nomor_klaim') String nomorKlaim,@JsonKey(name: 'polis_id') String polisId,@JsonKey(name: 'polis_nomor') String polisNomor, String deskripsi,@JsonKey(name: 'bukti_kerusakan') List<String> buktiKerusakan
});




}
/// @nodoc
class __$KlaimRequestModelCopyWithImpl<$Res>
    implements _$KlaimRequestModelCopyWith<$Res> {
  __$KlaimRequestModelCopyWithImpl(this._self, this._then);

  final _KlaimRequestModel _self;
  final $Res Function(_KlaimRequestModel) _then;

/// Create a copy of KlaimRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nomorKlaim = null,Object? polisId = null,Object? polisNomor = null,Object? deskripsi = null,Object? buktiKerusakan = null,}) {
  return _then(_KlaimRequestModel(
nomorKlaim: null == nomorKlaim ? _self.nomorKlaim : nomorKlaim // ignore: cast_nullable_to_non_nullable
as String,polisId: null == polisId ? _self.polisId : polisId // ignore: cast_nullable_to_non_nullable
as String,polisNomor: null == polisNomor ? _self.polisNomor : polisNomor // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,buktiKerusakan: null == buktiKerusakan ? _self._buktiKerusakan : buktiKerusakan // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
