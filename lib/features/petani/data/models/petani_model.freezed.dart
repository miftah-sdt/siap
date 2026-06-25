// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petani_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PetaniModel {

 String get id; String get nik; String get nama; String get alamat;@JsonKey(name: 'no_hp') String get noHp;@JsonKey(name: 'kelompok_tani') String get kelompokTani;
/// Create a copy of PetaniModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetaniModelCopyWith<PetaniModel> get copyWith => _$PetaniModelCopyWithImpl<PetaniModel>(this as PetaniModel, _$identity);

  /// Serializes this PetaniModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.nama, nama) || other.nama == nama)&&(identical(other.alamat, alamat) || other.alamat == alamat)&&(identical(other.noHp, noHp) || other.noHp == noHp)&&(identical(other.kelompokTani, kelompokTani) || other.kelompokTani == kelompokTani));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nik,nama,alamat,noHp,kelompokTani);

@override
String toString() {
  return 'PetaniModel(id: $id, nik: $nik, nama: $nama, alamat: $alamat, noHp: $noHp, kelompokTani: $kelompokTani)';
}


}

/// @nodoc
abstract mixin class $PetaniModelCopyWith<$Res>  {
  factory $PetaniModelCopyWith(PetaniModel value, $Res Function(PetaniModel) _then) = _$PetaniModelCopyWithImpl;
@useResult
$Res call({
 String id, String nik, String nama, String alamat,@JsonKey(name: 'no_hp') String noHp,@JsonKey(name: 'kelompok_tani') String kelompokTani
});




}
/// @nodoc
class _$PetaniModelCopyWithImpl<$Res>
    implements $PetaniModelCopyWith<$Res> {
  _$PetaniModelCopyWithImpl(this._self, this._then);

  final PetaniModel _self;
  final $Res Function(PetaniModel) _then;

/// Create a copy of PetaniModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nik = null,Object? nama = null,Object? alamat = null,Object? noHp = null,Object? kelompokTani = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,nama: null == nama ? _self.nama : nama // ignore: cast_nullable_to_non_nullable
as String,alamat: null == alamat ? _self.alamat : alamat // ignore: cast_nullable_to_non_nullable
as String,noHp: null == noHp ? _self.noHp : noHp // ignore: cast_nullable_to_non_nullable
as String,kelompokTani: null == kelompokTani ? _self.kelompokTani : kelompokTani // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PetaniModel].
extension PetaniModelPatterns on PetaniModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PetaniModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PetaniModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PetaniModel value)  $default,){
final _that = this;
switch (_that) {
case _PetaniModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PetaniModel value)?  $default,){
final _that = this;
switch (_that) {
case _PetaniModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nik,  String nama,  String alamat, @JsonKey(name: 'no_hp')  String noHp, @JsonKey(name: 'kelompok_tani')  String kelompokTani)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PetaniModel() when $default != null:
return $default(_that.id,_that.nik,_that.nama,_that.alamat,_that.noHp,_that.kelompokTani);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nik,  String nama,  String alamat, @JsonKey(name: 'no_hp')  String noHp, @JsonKey(name: 'kelompok_tani')  String kelompokTani)  $default,) {final _that = this;
switch (_that) {
case _PetaniModel():
return $default(_that.id,_that.nik,_that.nama,_that.alamat,_that.noHp,_that.kelompokTani);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nik,  String nama,  String alamat, @JsonKey(name: 'no_hp')  String noHp, @JsonKey(name: 'kelompok_tani')  String kelompokTani)?  $default,) {final _that = this;
switch (_that) {
case _PetaniModel() when $default != null:
return $default(_that.id,_that.nik,_that.nama,_that.alamat,_that.noHp,_that.kelompokTani);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PetaniModel extends PetaniModel {
  const _PetaniModel({required this.id, required this.nik, required this.nama, required this.alamat, @JsonKey(name: 'no_hp') required this.noHp, @JsonKey(name: 'kelompok_tani') required this.kelompokTani}): super._();
  factory _PetaniModel.fromJson(Map<String, dynamic> json) => _$PetaniModelFromJson(json);

@override final  String id;
@override final  String nik;
@override final  String nama;
@override final  String alamat;
@override@JsonKey(name: 'no_hp') final  String noHp;
@override@JsonKey(name: 'kelompok_tani') final  String kelompokTani;

/// Create a copy of PetaniModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetaniModelCopyWith<_PetaniModel> get copyWith => __$PetaniModelCopyWithImpl<_PetaniModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PetaniModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PetaniModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.nama, nama) || other.nama == nama)&&(identical(other.alamat, alamat) || other.alamat == alamat)&&(identical(other.noHp, noHp) || other.noHp == noHp)&&(identical(other.kelompokTani, kelompokTani) || other.kelompokTani == kelompokTani));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nik,nama,alamat,noHp,kelompokTani);

@override
String toString() {
  return 'PetaniModel(id: $id, nik: $nik, nama: $nama, alamat: $alamat, noHp: $noHp, kelompokTani: $kelompokTani)';
}


}

/// @nodoc
abstract mixin class _$PetaniModelCopyWith<$Res> implements $PetaniModelCopyWith<$Res> {
  factory _$PetaniModelCopyWith(_PetaniModel value, $Res Function(_PetaniModel) _then) = __$PetaniModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String nik, String nama, String alamat,@JsonKey(name: 'no_hp') String noHp,@JsonKey(name: 'kelompok_tani') String kelompokTani
});




}
/// @nodoc
class __$PetaniModelCopyWithImpl<$Res>
    implements _$PetaniModelCopyWith<$Res> {
  __$PetaniModelCopyWithImpl(this._self, this._then);

  final _PetaniModel _self;
  final $Res Function(_PetaniModel) _then;

/// Create a copy of PetaniModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nik = null,Object? nama = null,Object? alamat = null,Object? noHp = null,Object? kelompokTani = null,}) {
  return _then(_PetaniModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,nama: null == nama ? _self.nama : nama // ignore: cast_nullable_to_non_nullable
as String,alamat: null == alamat ? _self.alamat : alamat // ignore: cast_nullable_to_non_nullable
as String,noHp: null == noHp ? _self.noHp : noHp // ignore: cast_nullable_to_non_nullable
as String,kelompokTani: null == kelompokTani ? _self.kelompokTani : kelompokTani // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PetaniRequestModel {

 String get nik; String get nama; String get alamat;@JsonKey(name: 'no_hp') String get noHp;@JsonKey(name: 'kelompok_tani') String get kelompokTani;
/// Create a copy of PetaniRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetaniRequestModelCopyWith<PetaniRequestModel> get copyWith => _$PetaniRequestModelCopyWithImpl<PetaniRequestModel>(this as PetaniRequestModel, _$identity);

  /// Serializes this PetaniRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniRequestModel&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.nama, nama) || other.nama == nama)&&(identical(other.alamat, alamat) || other.alamat == alamat)&&(identical(other.noHp, noHp) || other.noHp == noHp)&&(identical(other.kelompokTani, kelompokTani) || other.kelompokTani == kelompokTani));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nik,nama,alamat,noHp,kelompokTani);

@override
String toString() {
  return 'PetaniRequestModel(nik: $nik, nama: $nama, alamat: $alamat, noHp: $noHp, kelompokTani: $kelompokTani)';
}


}

/// @nodoc
abstract mixin class $PetaniRequestModelCopyWith<$Res>  {
  factory $PetaniRequestModelCopyWith(PetaniRequestModel value, $Res Function(PetaniRequestModel) _then) = _$PetaniRequestModelCopyWithImpl;
@useResult
$Res call({
 String nik, String nama, String alamat,@JsonKey(name: 'no_hp') String noHp,@JsonKey(name: 'kelompok_tani') String kelompokTani
});




}
/// @nodoc
class _$PetaniRequestModelCopyWithImpl<$Res>
    implements $PetaniRequestModelCopyWith<$Res> {
  _$PetaniRequestModelCopyWithImpl(this._self, this._then);

  final PetaniRequestModel _self;
  final $Res Function(PetaniRequestModel) _then;

/// Create a copy of PetaniRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nik = null,Object? nama = null,Object? alamat = null,Object? noHp = null,Object? kelompokTani = null,}) {
  return _then(_self.copyWith(
nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,nama: null == nama ? _self.nama : nama // ignore: cast_nullable_to_non_nullable
as String,alamat: null == alamat ? _self.alamat : alamat // ignore: cast_nullable_to_non_nullable
as String,noHp: null == noHp ? _self.noHp : noHp // ignore: cast_nullable_to_non_nullable
as String,kelompokTani: null == kelompokTani ? _self.kelompokTani : kelompokTani // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PetaniRequestModel].
extension PetaniRequestModelPatterns on PetaniRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PetaniRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PetaniRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PetaniRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _PetaniRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PetaniRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _PetaniRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nik,  String nama,  String alamat, @JsonKey(name: 'no_hp')  String noHp, @JsonKey(name: 'kelompok_tani')  String kelompokTani)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PetaniRequestModel() when $default != null:
return $default(_that.nik,_that.nama,_that.alamat,_that.noHp,_that.kelompokTani);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nik,  String nama,  String alamat, @JsonKey(name: 'no_hp')  String noHp, @JsonKey(name: 'kelompok_tani')  String kelompokTani)  $default,) {final _that = this;
switch (_that) {
case _PetaniRequestModel():
return $default(_that.nik,_that.nama,_that.alamat,_that.noHp,_that.kelompokTani);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nik,  String nama,  String alamat, @JsonKey(name: 'no_hp')  String noHp, @JsonKey(name: 'kelompok_tani')  String kelompokTani)?  $default,) {final _that = this;
switch (_that) {
case _PetaniRequestModel() when $default != null:
return $default(_that.nik,_that.nama,_that.alamat,_that.noHp,_that.kelompokTani);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PetaniRequestModel implements PetaniRequestModel {
  const _PetaniRequestModel({required this.nik, required this.nama, required this.alamat, @JsonKey(name: 'no_hp') required this.noHp, @JsonKey(name: 'kelompok_tani') required this.kelompokTani});
  factory _PetaniRequestModel.fromJson(Map<String, dynamic> json) => _$PetaniRequestModelFromJson(json);

@override final  String nik;
@override final  String nama;
@override final  String alamat;
@override@JsonKey(name: 'no_hp') final  String noHp;
@override@JsonKey(name: 'kelompok_tani') final  String kelompokTani;

/// Create a copy of PetaniRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetaniRequestModelCopyWith<_PetaniRequestModel> get copyWith => __$PetaniRequestModelCopyWithImpl<_PetaniRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PetaniRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PetaniRequestModel&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.nama, nama) || other.nama == nama)&&(identical(other.alamat, alamat) || other.alamat == alamat)&&(identical(other.noHp, noHp) || other.noHp == noHp)&&(identical(other.kelompokTani, kelompokTani) || other.kelompokTani == kelompokTani));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nik,nama,alamat,noHp,kelompokTani);

@override
String toString() {
  return 'PetaniRequestModel(nik: $nik, nama: $nama, alamat: $alamat, noHp: $noHp, kelompokTani: $kelompokTani)';
}


}

/// @nodoc
abstract mixin class _$PetaniRequestModelCopyWith<$Res> implements $PetaniRequestModelCopyWith<$Res> {
  factory _$PetaniRequestModelCopyWith(_PetaniRequestModel value, $Res Function(_PetaniRequestModel) _then) = __$PetaniRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String nik, String nama, String alamat,@JsonKey(name: 'no_hp') String noHp,@JsonKey(name: 'kelompok_tani') String kelompokTani
});




}
/// @nodoc
class __$PetaniRequestModelCopyWithImpl<$Res>
    implements _$PetaniRequestModelCopyWith<$Res> {
  __$PetaniRequestModelCopyWithImpl(this._self, this._then);

  final _PetaniRequestModel _self;
  final $Res Function(_PetaniRequestModel) _then;

/// Create a copy of PetaniRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nik = null,Object? nama = null,Object? alamat = null,Object? noHp = null,Object? kelompokTani = null,}) {
  return _then(_PetaniRequestModel(
nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,nama: null == nama ? _self.nama : nama // ignore: cast_nullable_to_non_nullable
as String,alamat: null == alamat ? _self.alamat : alamat // ignore: cast_nullable_to_non_nullable
as String,noHp: null == noHp ? _self.noHp : noHp // ignore: cast_nullable_to_non_nullable
as String,kelompokTani: null == kelompokTani ? _self.kelompokTani : kelompokTani // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
