// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pengguna_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PenggunaFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PenggunaFormEvent()';
}


}

/// @nodoc
class $PenggunaFormEventCopyWith<$Res>  {
$PenggunaFormEventCopyWith(PenggunaFormEvent _, $Res Function(PenggunaFormEvent) __);
}


/// Adds pattern-matching-related methods to [PenggunaFormEvent].
extension PenggunaFormEventPatterns on PenggunaFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PenggunaFormStarted value)?  started,TResult Function( PenggunaFormSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PenggunaFormStarted() when started != null:
return started(_that);case PenggunaFormSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PenggunaFormStarted value)  started,required TResult Function( PenggunaFormSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case PenggunaFormStarted():
return started(_that);case PenggunaFormSubmitted():
return submitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PenggunaFormStarted value)?  started,TResult? Function( PenggunaFormSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case PenggunaFormStarted() when started != null:
return started(_that);case PenggunaFormSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Pengguna? pengguna)?  started,TResult Function( String name,  String email,  UserRole role,  bool isActive)?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PenggunaFormStarted() when started != null:
return started(_that.pengguna);case PenggunaFormSubmitted() when submitted != null:
return submitted(_that.name,_that.email,_that.role,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Pengguna? pengguna)  started,required TResult Function( String name,  String email,  UserRole role,  bool isActive)  submitted,}) {final _that = this;
switch (_that) {
case PenggunaFormStarted():
return started(_that.pengguna);case PenggunaFormSubmitted():
return submitted(_that.name,_that.email,_that.role,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Pengguna? pengguna)?  started,TResult? Function( String name,  String email,  UserRole role,  bool isActive)?  submitted,}) {final _that = this;
switch (_that) {
case PenggunaFormStarted() when started != null:
return started(_that.pengguna);case PenggunaFormSubmitted() when submitted != null:
return submitted(_that.name,_that.email,_that.role,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class PenggunaFormStarted implements PenggunaFormEvent {
  const PenggunaFormStarted({this.pengguna});
  

 final  Pengguna? pengguna;

/// Create a copy of PenggunaFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenggunaFormStartedCopyWith<PenggunaFormStarted> get copyWith => _$PenggunaFormStartedCopyWithImpl<PenggunaFormStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaFormStarted&&(identical(other.pengguna, pengguna) || other.pengguna == pengguna));
}


@override
int get hashCode => Object.hash(runtimeType,pengguna);

@override
String toString() {
  return 'PenggunaFormEvent.started(pengguna: $pengguna)';
}


}

/// @nodoc
abstract mixin class $PenggunaFormStartedCopyWith<$Res> implements $PenggunaFormEventCopyWith<$Res> {
  factory $PenggunaFormStartedCopyWith(PenggunaFormStarted value, $Res Function(PenggunaFormStarted) _then) = _$PenggunaFormStartedCopyWithImpl;
@useResult
$Res call({
 Pengguna? pengguna
});




}
/// @nodoc
class _$PenggunaFormStartedCopyWithImpl<$Res>
    implements $PenggunaFormStartedCopyWith<$Res> {
  _$PenggunaFormStartedCopyWithImpl(this._self, this._then);

  final PenggunaFormStarted _self;
  final $Res Function(PenggunaFormStarted) _then;

/// Create a copy of PenggunaFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pengguna = freezed,}) {
  return _then(PenggunaFormStarted(
pengguna: freezed == pengguna ? _self.pengguna : pengguna // ignore: cast_nullable_to_non_nullable
as Pengguna?,
  ));
}


}

/// @nodoc


class PenggunaFormSubmitted implements PenggunaFormEvent {
  const PenggunaFormSubmitted({required this.name, required this.email, required this.role, required this.isActive});
  

 final  String name;
 final  String email;
 final  UserRole role;
 final  bool isActive;

/// Create a copy of PenggunaFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenggunaFormSubmittedCopyWith<PenggunaFormSubmitted> get copyWith => _$PenggunaFormSubmittedCopyWithImpl<PenggunaFormSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaFormSubmitted&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,role,isActive);

@override
String toString() {
  return 'PenggunaFormEvent.submitted(name: $name, email: $email, role: $role, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PenggunaFormSubmittedCopyWith<$Res> implements $PenggunaFormEventCopyWith<$Res> {
  factory $PenggunaFormSubmittedCopyWith(PenggunaFormSubmitted value, $Res Function(PenggunaFormSubmitted) _then) = _$PenggunaFormSubmittedCopyWithImpl;
@useResult
$Res call({
 String name, String email, UserRole role, bool isActive
});




}
/// @nodoc
class _$PenggunaFormSubmittedCopyWithImpl<$Res>
    implements $PenggunaFormSubmittedCopyWith<$Res> {
  _$PenggunaFormSubmittedCopyWithImpl(this._self, this._then);

  final PenggunaFormSubmitted _self;
  final $Res Function(PenggunaFormSubmitted) _then;

/// Create a copy of PenggunaFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? role = null,Object? isActive = null,}) {
  return _then(PenggunaFormSubmitted(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
