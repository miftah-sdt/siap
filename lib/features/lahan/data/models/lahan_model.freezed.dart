// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lahan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LahanModel {

 String get id;@JsonKey(name: 'petani_id') String get petaniId;@JsonKey(name: 'petani_nama') String get petaniNama;@JsonKey(name: 'kode_lahan') String get kodeLahan;@JsonKey(name: 'nama_lahan') String get namaLahan; double get luas; String get lokasi; String? get koordinat;
/// Create a copy of LahanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LahanModelCopyWith<LahanModel> get copyWith => _$LahanModelCopyWithImpl<LahanModel>(this as LahanModel, _$identity);

  /// Serializes this LahanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.petaniId, petaniId) || other.petaniId == petaniId)&&(identical(other.petaniNama, petaniNama) || other.petaniNama == petaniNama)&&(identical(other.kodeLahan, kodeLahan) || other.kodeLahan == kodeLahan)&&(identical(other.namaLahan, namaLahan) || other.namaLahan == namaLahan)&&(identical(other.luas, luas) || other.luas == luas)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.koordinat, koordinat) || other.koordinat == koordinat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,petaniId,petaniNama,kodeLahan,namaLahan,luas,lokasi,koordinat);

@override
String toString() {
  return 'LahanModel(id: $id, petaniId: $petaniId, petaniNama: $petaniNama, kodeLahan: $kodeLahan, namaLahan: $namaLahan, luas: $luas, lokasi: $lokasi, koordinat: $koordinat)';
}


}

/// @nodoc
abstract mixin class $LahanModelCopyWith<$Res>  {
  factory $LahanModelCopyWith(LahanModel value, $Res Function(LahanModel) _then) = _$LahanModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'petani_id') String petaniId,@JsonKey(name: 'petani_nama') String petaniNama,@JsonKey(name: 'kode_lahan') String kodeLahan,@JsonKey(name: 'nama_lahan') String namaLahan, double luas, String lokasi, String? koordinat
});




}
/// @nodoc
class _$LahanModelCopyWithImpl<$Res>
    implements $LahanModelCopyWith<$Res> {
  _$LahanModelCopyWithImpl(this._self, this._then);

  final LahanModel _self;
  final $Res Function(LahanModel) _then;

/// Create a copy of LahanModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? petaniId = null,Object? petaniNama = null,Object? kodeLahan = null,Object? namaLahan = null,Object? luas = null,Object? lokasi = null,Object? koordinat = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,petaniId: null == petaniId ? _self.petaniId : petaniId // ignore: cast_nullable_to_non_nullable
as String,petaniNama: null == petaniNama ? _self.petaniNama : petaniNama // ignore: cast_nullable_to_non_nullable
as String,kodeLahan: null == kodeLahan ? _self.kodeLahan : kodeLahan // ignore: cast_nullable_to_non_nullable
as String,namaLahan: null == namaLahan ? _self.namaLahan : namaLahan // ignore: cast_nullable_to_non_nullable
as String,luas: null == luas ? _self.luas : luas // ignore: cast_nullable_to_non_nullable
as double,lokasi: null == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String,koordinat: freezed == koordinat ? _self.koordinat : koordinat // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LahanModel].
extension LahanModelPatterns on LahanModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LahanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LahanModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LahanModel value)  $default,){
final _that = this;
switch (_that) {
case _LahanModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LahanModel value)?  $default,){
final _that = this;
switch (_that) {
case _LahanModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'kode_lahan')  String kodeLahan, @JsonKey(name: 'nama_lahan')  String namaLahan,  double luas,  String lokasi,  String? koordinat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LahanModel() when $default != null:
return $default(_that.id,_that.petaniId,_that.petaniNama,_that.kodeLahan,_that.namaLahan,_that.luas,_that.lokasi,_that.koordinat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'kode_lahan')  String kodeLahan, @JsonKey(name: 'nama_lahan')  String namaLahan,  double luas,  String lokasi,  String? koordinat)  $default,) {final _that = this;
switch (_that) {
case _LahanModel():
return $default(_that.id,_that.petaniId,_that.petaniNama,_that.kodeLahan,_that.namaLahan,_that.luas,_that.lokasi,_that.koordinat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'kode_lahan')  String kodeLahan, @JsonKey(name: 'nama_lahan')  String namaLahan,  double luas,  String lokasi,  String? koordinat)?  $default,) {final _that = this;
switch (_that) {
case _LahanModel() when $default != null:
return $default(_that.id,_that.petaniId,_that.petaniNama,_that.kodeLahan,_that.namaLahan,_that.luas,_that.lokasi,_that.koordinat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LahanModel extends LahanModel {
  const _LahanModel({required this.id, @JsonKey(name: 'petani_id') required this.petaniId, @JsonKey(name: 'petani_nama') required this.petaniNama, @JsonKey(name: 'kode_lahan') required this.kodeLahan, @JsonKey(name: 'nama_lahan') required this.namaLahan, required this.luas, required this.lokasi, this.koordinat}): super._();
  factory _LahanModel.fromJson(Map<String, dynamic> json) => _$LahanModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'petani_id') final  String petaniId;
@override@JsonKey(name: 'petani_nama') final  String petaniNama;
@override@JsonKey(name: 'kode_lahan') final  String kodeLahan;
@override@JsonKey(name: 'nama_lahan') final  String namaLahan;
@override final  double luas;
@override final  String lokasi;
@override final  String? koordinat;

/// Create a copy of LahanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LahanModelCopyWith<_LahanModel> get copyWith => __$LahanModelCopyWithImpl<_LahanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LahanModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LahanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.petaniId, petaniId) || other.petaniId == petaniId)&&(identical(other.petaniNama, petaniNama) || other.petaniNama == petaniNama)&&(identical(other.kodeLahan, kodeLahan) || other.kodeLahan == kodeLahan)&&(identical(other.namaLahan, namaLahan) || other.namaLahan == namaLahan)&&(identical(other.luas, luas) || other.luas == luas)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.koordinat, koordinat) || other.koordinat == koordinat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,petaniId,petaniNama,kodeLahan,namaLahan,luas,lokasi,koordinat);

@override
String toString() {
  return 'LahanModel(id: $id, petaniId: $petaniId, petaniNama: $petaniNama, kodeLahan: $kodeLahan, namaLahan: $namaLahan, luas: $luas, lokasi: $lokasi, koordinat: $koordinat)';
}


}

/// @nodoc
abstract mixin class _$LahanModelCopyWith<$Res> implements $LahanModelCopyWith<$Res> {
  factory _$LahanModelCopyWith(_LahanModel value, $Res Function(_LahanModel) _then) = __$LahanModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'petani_id') String petaniId,@JsonKey(name: 'petani_nama') String petaniNama,@JsonKey(name: 'kode_lahan') String kodeLahan,@JsonKey(name: 'nama_lahan') String namaLahan, double luas, String lokasi, String? koordinat
});




}
/// @nodoc
class __$LahanModelCopyWithImpl<$Res>
    implements _$LahanModelCopyWith<$Res> {
  __$LahanModelCopyWithImpl(this._self, this._then);

  final _LahanModel _self;
  final $Res Function(_LahanModel) _then;

/// Create a copy of LahanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? petaniId = null,Object? petaniNama = null,Object? kodeLahan = null,Object? namaLahan = null,Object? luas = null,Object? lokasi = null,Object? koordinat = freezed,}) {
  return _then(_LahanModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,petaniId: null == petaniId ? _self.petaniId : petaniId // ignore: cast_nullable_to_non_nullable
as String,petaniNama: null == petaniNama ? _self.petaniNama : petaniNama // ignore: cast_nullable_to_non_nullable
as String,kodeLahan: null == kodeLahan ? _self.kodeLahan : kodeLahan // ignore: cast_nullable_to_non_nullable
as String,namaLahan: null == namaLahan ? _self.namaLahan : namaLahan // ignore: cast_nullable_to_non_nullable
as String,luas: null == luas ? _self.luas : luas // ignore: cast_nullable_to_non_nullable
as double,lokasi: null == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String,koordinat: freezed == koordinat ? _self.koordinat : koordinat // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LahanRequestModel {

@JsonKey(name: 'petani_id') String get petaniId;@JsonKey(name: 'petani_nama') String get petaniNama;@JsonKey(name: 'kode_lahan') String get kodeLahan;@JsonKey(name: 'nama_lahan') String get namaLahan; double get luas; String get lokasi; String? get koordinat;
/// Create a copy of LahanRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LahanRequestModelCopyWith<LahanRequestModel> get copyWith => _$LahanRequestModelCopyWithImpl<LahanRequestModel>(this as LahanRequestModel, _$identity);

  /// Serializes this LahanRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanRequestModel&&(identical(other.petaniId, petaniId) || other.petaniId == petaniId)&&(identical(other.petaniNama, petaniNama) || other.petaniNama == petaniNama)&&(identical(other.kodeLahan, kodeLahan) || other.kodeLahan == kodeLahan)&&(identical(other.namaLahan, namaLahan) || other.namaLahan == namaLahan)&&(identical(other.luas, luas) || other.luas == luas)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.koordinat, koordinat) || other.koordinat == koordinat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,petaniId,petaniNama,kodeLahan,namaLahan,luas,lokasi,koordinat);

@override
String toString() {
  return 'LahanRequestModel(petaniId: $petaniId, petaniNama: $petaniNama, kodeLahan: $kodeLahan, namaLahan: $namaLahan, luas: $luas, lokasi: $lokasi, koordinat: $koordinat)';
}


}

/// @nodoc
abstract mixin class $LahanRequestModelCopyWith<$Res>  {
  factory $LahanRequestModelCopyWith(LahanRequestModel value, $Res Function(LahanRequestModel) _then) = _$LahanRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'petani_id') String petaniId,@JsonKey(name: 'petani_nama') String petaniNama,@JsonKey(name: 'kode_lahan') String kodeLahan,@JsonKey(name: 'nama_lahan') String namaLahan, double luas, String lokasi, String? koordinat
});




}
/// @nodoc
class _$LahanRequestModelCopyWithImpl<$Res>
    implements $LahanRequestModelCopyWith<$Res> {
  _$LahanRequestModelCopyWithImpl(this._self, this._then);

  final LahanRequestModel _self;
  final $Res Function(LahanRequestModel) _then;

/// Create a copy of LahanRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? petaniId = null,Object? petaniNama = null,Object? kodeLahan = null,Object? namaLahan = null,Object? luas = null,Object? lokasi = null,Object? koordinat = freezed,}) {
  return _then(_self.copyWith(
petaniId: null == petaniId ? _self.petaniId : petaniId // ignore: cast_nullable_to_non_nullable
as String,petaniNama: null == petaniNama ? _self.petaniNama : petaniNama // ignore: cast_nullable_to_non_nullable
as String,kodeLahan: null == kodeLahan ? _self.kodeLahan : kodeLahan // ignore: cast_nullable_to_non_nullable
as String,namaLahan: null == namaLahan ? _self.namaLahan : namaLahan // ignore: cast_nullable_to_non_nullable
as String,luas: null == luas ? _self.luas : luas // ignore: cast_nullable_to_non_nullable
as double,lokasi: null == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String,koordinat: freezed == koordinat ? _self.koordinat : koordinat // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LahanRequestModel].
extension LahanRequestModelPatterns on LahanRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LahanRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LahanRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LahanRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _LahanRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LahanRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _LahanRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'kode_lahan')  String kodeLahan, @JsonKey(name: 'nama_lahan')  String namaLahan,  double luas,  String lokasi,  String? koordinat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LahanRequestModel() when $default != null:
return $default(_that.petaniId,_that.petaniNama,_that.kodeLahan,_that.namaLahan,_that.luas,_that.lokasi,_that.koordinat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'kode_lahan')  String kodeLahan, @JsonKey(name: 'nama_lahan')  String namaLahan,  double luas,  String lokasi,  String? koordinat)  $default,) {final _that = this;
switch (_that) {
case _LahanRequestModel():
return $default(_that.petaniId,_that.petaniNama,_that.kodeLahan,_that.namaLahan,_that.luas,_that.lokasi,_that.koordinat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'kode_lahan')  String kodeLahan, @JsonKey(name: 'nama_lahan')  String namaLahan,  double luas,  String lokasi,  String? koordinat)?  $default,) {final _that = this;
switch (_that) {
case _LahanRequestModel() when $default != null:
return $default(_that.petaniId,_that.petaniNama,_that.kodeLahan,_that.namaLahan,_that.luas,_that.lokasi,_that.koordinat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LahanRequestModel implements LahanRequestModel {
  const _LahanRequestModel({@JsonKey(name: 'petani_id') required this.petaniId, @JsonKey(name: 'petani_nama') required this.petaniNama, @JsonKey(name: 'kode_lahan') required this.kodeLahan, @JsonKey(name: 'nama_lahan') required this.namaLahan, required this.luas, required this.lokasi, this.koordinat});
  factory _LahanRequestModel.fromJson(Map<String, dynamic> json) => _$LahanRequestModelFromJson(json);

@override@JsonKey(name: 'petani_id') final  String petaniId;
@override@JsonKey(name: 'petani_nama') final  String petaniNama;
@override@JsonKey(name: 'kode_lahan') final  String kodeLahan;
@override@JsonKey(name: 'nama_lahan') final  String namaLahan;
@override final  double luas;
@override final  String lokasi;
@override final  String? koordinat;

/// Create a copy of LahanRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LahanRequestModelCopyWith<_LahanRequestModel> get copyWith => __$LahanRequestModelCopyWithImpl<_LahanRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LahanRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LahanRequestModel&&(identical(other.petaniId, petaniId) || other.petaniId == petaniId)&&(identical(other.petaniNama, petaniNama) || other.petaniNama == petaniNama)&&(identical(other.kodeLahan, kodeLahan) || other.kodeLahan == kodeLahan)&&(identical(other.namaLahan, namaLahan) || other.namaLahan == namaLahan)&&(identical(other.luas, luas) || other.luas == luas)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.koordinat, koordinat) || other.koordinat == koordinat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,petaniId,petaniNama,kodeLahan,namaLahan,luas,lokasi,koordinat);

@override
String toString() {
  return 'LahanRequestModel(petaniId: $petaniId, petaniNama: $petaniNama, kodeLahan: $kodeLahan, namaLahan: $namaLahan, luas: $luas, lokasi: $lokasi, koordinat: $koordinat)';
}


}

/// @nodoc
abstract mixin class _$LahanRequestModelCopyWith<$Res> implements $LahanRequestModelCopyWith<$Res> {
  factory _$LahanRequestModelCopyWith(_LahanRequestModel value, $Res Function(_LahanRequestModel) _then) = __$LahanRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'petani_id') String petaniId,@JsonKey(name: 'petani_nama') String petaniNama,@JsonKey(name: 'kode_lahan') String kodeLahan,@JsonKey(name: 'nama_lahan') String namaLahan, double luas, String lokasi, String? koordinat
});




}
/// @nodoc
class __$LahanRequestModelCopyWithImpl<$Res>
    implements _$LahanRequestModelCopyWith<$Res> {
  __$LahanRequestModelCopyWithImpl(this._self, this._then);

  final _LahanRequestModel _self;
  final $Res Function(_LahanRequestModel) _then;

/// Create a copy of LahanRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? petaniId = null,Object? petaniNama = null,Object? kodeLahan = null,Object? namaLahan = null,Object? luas = null,Object? lokasi = null,Object? koordinat = freezed,}) {
  return _then(_LahanRequestModel(
petaniId: null == petaniId ? _self.petaniId : petaniId // ignore: cast_nullable_to_non_nullable
as String,petaniNama: null == petaniNama ? _self.petaniNama : petaniNama // ignore: cast_nullable_to_non_nullable
as String,kodeLahan: null == kodeLahan ? _self.kodeLahan : kodeLahan // ignore: cast_nullable_to_non_nullable
as String,namaLahan: null == namaLahan ? _self.namaLahan : namaLahan // ignore: cast_nullable_to_non_nullable
as String,luas: null == luas ? _self.luas : luas // ignore: cast_nullable_to_non_nullable
as double,lokasi: null == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String,koordinat: freezed == koordinat ? _self.koordinat : koordinat // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
