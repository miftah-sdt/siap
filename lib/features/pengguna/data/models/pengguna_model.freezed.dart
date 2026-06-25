// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pengguna_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PenggunaModel {

 String get id; String get name; String get email; String get role;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of PenggunaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenggunaModelCopyWith<PenggunaModel> get copyWith => _$PenggunaModelCopyWithImpl<PenggunaModel>(this as PenggunaModel, _$identity);

  /// Serializes this PenggunaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,role,isActive);

@override
String toString() {
  return 'PenggunaModel(id: $id, name: $name, email: $email, role: $role, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PenggunaModelCopyWith<$Res>  {
  factory $PenggunaModelCopyWith(PenggunaModel value, $Res Function(PenggunaModel) _then) = _$PenggunaModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String role,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$PenggunaModelCopyWithImpl<$Res>
    implements $PenggunaModelCopyWith<$Res> {
  _$PenggunaModelCopyWithImpl(this._self, this._then);

  final PenggunaModel _self;
  final $Res Function(PenggunaModel) _then;

/// Create a copy of PenggunaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PenggunaModel].
extension PenggunaModelPatterns on PenggunaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PenggunaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PenggunaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PenggunaModel value)  $default,){
final _that = this;
switch (_that) {
case _PenggunaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PenggunaModel value)?  $default,){
final _that = this;
switch (_that) {
case _PenggunaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String role, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PenggunaModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String role, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _PenggunaModel():
return $default(_that.id,_that.name,_that.email,_that.role,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String role, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _PenggunaModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PenggunaModel extends PenggunaModel {
  const _PenggunaModel({required this.id, required this.name, required this.email, required this.role, @JsonKey(name: 'is_active') required this.isActive}): super._();
  factory _PenggunaModel.fromJson(Map<String, dynamic> json) => _$PenggunaModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;
@override final  String role;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of PenggunaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PenggunaModelCopyWith<_PenggunaModel> get copyWith => __$PenggunaModelCopyWithImpl<_PenggunaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PenggunaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PenggunaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,role,isActive);

@override
String toString() {
  return 'PenggunaModel(id: $id, name: $name, email: $email, role: $role, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PenggunaModelCopyWith<$Res> implements $PenggunaModelCopyWith<$Res> {
  factory _$PenggunaModelCopyWith(_PenggunaModel value, $Res Function(_PenggunaModel) _then) = __$PenggunaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String role,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$PenggunaModelCopyWithImpl<$Res>
    implements _$PenggunaModelCopyWith<$Res> {
  __$PenggunaModelCopyWithImpl(this._self, this._then);

  final _PenggunaModel _self;
  final $Res Function(_PenggunaModel) _then;

/// Create a copy of PenggunaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,Object? isActive = null,}) {
  return _then(_PenggunaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PenggunaRequestModel {

 String get name; String get email; String get role;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of PenggunaRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenggunaRequestModelCopyWith<PenggunaRequestModel> get copyWith => _$PenggunaRequestModelCopyWithImpl<PenggunaRequestModel>(this as PenggunaRequestModel, _$identity);

  /// Serializes this PenggunaRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,role,isActive);

@override
String toString() {
  return 'PenggunaRequestModel(name: $name, email: $email, role: $role, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PenggunaRequestModelCopyWith<$Res>  {
  factory $PenggunaRequestModelCopyWith(PenggunaRequestModel value, $Res Function(PenggunaRequestModel) _then) = _$PenggunaRequestModelCopyWithImpl;
@useResult
$Res call({
 String name, String email, String role,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$PenggunaRequestModelCopyWithImpl<$Res>
    implements $PenggunaRequestModelCopyWith<$Res> {
  _$PenggunaRequestModelCopyWithImpl(this._self, this._then);

  final PenggunaRequestModel _self;
  final $Res Function(PenggunaRequestModel) _then;

/// Create a copy of PenggunaRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? role = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PenggunaRequestModel].
extension PenggunaRequestModelPatterns on PenggunaRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PenggunaRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PenggunaRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PenggunaRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _PenggunaRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PenggunaRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _PenggunaRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String role, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PenggunaRequestModel() when $default != null:
return $default(_that.name,_that.email,_that.role,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String role, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _PenggunaRequestModel():
return $default(_that.name,_that.email,_that.role,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String role, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _PenggunaRequestModel() when $default != null:
return $default(_that.name,_that.email,_that.role,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PenggunaRequestModel implements PenggunaRequestModel {
  const _PenggunaRequestModel({required this.name, required this.email, required this.role, @JsonKey(name: 'is_active') required this.isActive});
  factory _PenggunaRequestModel.fromJson(Map<String, dynamic> json) => _$PenggunaRequestModelFromJson(json);

@override final  String name;
@override final  String email;
@override final  String role;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of PenggunaRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PenggunaRequestModelCopyWith<_PenggunaRequestModel> get copyWith => __$PenggunaRequestModelCopyWithImpl<_PenggunaRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PenggunaRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PenggunaRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,role,isActive);

@override
String toString() {
  return 'PenggunaRequestModel(name: $name, email: $email, role: $role, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PenggunaRequestModelCopyWith<$Res> implements $PenggunaRequestModelCopyWith<$Res> {
  factory _$PenggunaRequestModelCopyWith(_PenggunaRequestModel value, $Res Function(_PenggunaRequestModel) _then) = __$PenggunaRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String role,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$PenggunaRequestModelCopyWithImpl<$Res>
    implements _$PenggunaRequestModelCopyWith<$Res> {
  __$PenggunaRequestModelCopyWithImpl(this._self, this._then);

  final _PenggunaRequestModel _self;
  final $Res Function(_PenggunaRequestModel) _then;

/// Create a copy of PenggunaRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? role = null,Object? isActive = null,}) {
  return _then(_PenggunaRequestModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
