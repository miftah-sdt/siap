// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pengguna_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PenggunaFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PenggunaFormState()';
}


}

/// @nodoc
class $PenggunaFormStateCopyWith<$Res>  {
$PenggunaFormStateCopyWith(PenggunaFormState _, $Res Function(PenggunaFormState) __);
}


/// Adds pattern-matching-related methods to [PenggunaFormState].
extension PenggunaFormStatePatterns on PenggunaFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PenggunaFormInitial value)?  initial,TResult Function( PenggunaFormLoading value)?  loading,TResult Function( PenggunaFormEditing value)?  editing,TResult Function( PenggunaFormSuccess value)?  success,TResult Function( PenggunaFormError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PenggunaFormInitial() when initial != null:
return initial(_that);case PenggunaFormLoading() when loading != null:
return loading(_that);case PenggunaFormEditing() when editing != null:
return editing(_that);case PenggunaFormSuccess() when success != null:
return success(_that);case PenggunaFormError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PenggunaFormInitial value)  initial,required TResult Function( PenggunaFormLoading value)  loading,required TResult Function( PenggunaFormEditing value)  editing,required TResult Function( PenggunaFormSuccess value)  success,required TResult Function( PenggunaFormError value)  error,}){
final _that = this;
switch (_that) {
case PenggunaFormInitial():
return initial(_that);case PenggunaFormLoading():
return loading(_that);case PenggunaFormEditing():
return editing(_that);case PenggunaFormSuccess():
return success(_that);case PenggunaFormError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PenggunaFormInitial value)?  initial,TResult? Function( PenggunaFormLoading value)?  loading,TResult? Function( PenggunaFormEditing value)?  editing,TResult? Function( PenggunaFormSuccess value)?  success,TResult? Function( PenggunaFormError value)?  error,}){
final _that = this;
switch (_that) {
case PenggunaFormInitial() when initial != null:
return initial(_that);case PenggunaFormLoading() when loading != null:
return loading(_that);case PenggunaFormEditing() when editing != null:
return editing(_that);case PenggunaFormSuccess() when success != null:
return success(_that);case PenggunaFormError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Pengguna pengguna)?  editing,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PenggunaFormInitial() when initial != null:
return initial();case PenggunaFormLoading() when loading != null:
return loading();case PenggunaFormEditing() when editing != null:
return editing(_that.pengguna);case PenggunaFormSuccess() when success != null:
return success();case PenggunaFormError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Pengguna pengguna)  editing,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case PenggunaFormInitial():
return initial();case PenggunaFormLoading():
return loading();case PenggunaFormEditing():
return editing(_that.pengguna);case PenggunaFormSuccess():
return success();case PenggunaFormError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Pengguna pengguna)?  editing,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case PenggunaFormInitial() when initial != null:
return initial();case PenggunaFormLoading() when loading != null:
return loading();case PenggunaFormEditing() when editing != null:
return editing(_that.pengguna);case PenggunaFormSuccess() when success != null:
return success();case PenggunaFormError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class PenggunaFormInitial implements PenggunaFormState {
  const PenggunaFormInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaFormInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PenggunaFormState.initial()';
}


}




/// @nodoc


class PenggunaFormLoading implements PenggunaFormState {
  const PenggunaFormLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaFormLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PenggunaFormState.loading()';
}


}




/// @nodoc


class PenggunaFormEditing implements PenggunaFormState {
  const PenggunaFormEditing(this.pengguna);
  

 final  Pengguna pengguna;

/// Create a copy of PenggunaFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenggunaFormEditingCopyWith<PenggunaFormEditing> get copyWith => _$PenggunaFormEditingCopyWithImpl<PenggunaFormEditing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaFormEditing&&(identical(other.pengguna, pengguna) || other.pengguna == pengguna));
}


@override
int get hashCode => Object.hash(runtimeType,pengguna);

@override
String toString() {
  return 'PenggunaFormState.editing(pengguna: $pengguna)';
}


}

/// @nodoc
abstract mixin class $PenggunaFormEditingCopyWith<$Res> implements $PenggunaFormStateCopyWith<$Res> {
  factory $PenggunaFormEditingCopyWith(PenggunaFormEditing value, $Res Function(PenggunaFormEditing) _then) = _$PenggunaFormEditingCopyWithImpl;
@useResult
$Res call({
 Pengguna pengguna
});




}
/// @nodoc
class _$PenggunaFormEditingCopyWithImpl<$Res>
    implements $PenggunaFormEditingCopyWith<$Res> {
  _$PenggunaFormEditingCopyWithImpl(this._self, this._then);

  final PenggunaFormEditing _self;
  final $Res Function(PenggunaFormEditing) _then;

/// Create a copy of PenggunaFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pengguna = null,}) {
  return _then(PenggunaFormEditing(
null == pengguna ? _self.pengguna : pengguna // ignore: cast_nullable_to_non_nullable
as Pengguna,
  ));
}


}

/// @nodoc


class PenggunaFormSuccess implements PenggunaFormState {
  const PenggunaFormSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaFormSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PenggunaFormState.success()';
}


}




/// @nodoc


class PenggunaFormError implements PenggunaFormState {
  const PenggunaFormError(this.message);
  

 final  String message;

/// Create a copy of PenggunaFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenggunaFormErrorCopyWith<PenggunaFormError> get copyWith => _$PenggunaFormErrorCopyWithImpl<PenggunaFormError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaFormError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PenggunaFormState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PenggunaFormErrorCopyWith<$Res> implements $PenggunaFormStateCopyWith<$Res> {
  factory $PenggunaFormErrorCopyWith(PenggunaFormError value, $Res Function(PenggunaFormError) _then) = _$PenggunaFormErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PenggunaFormErrorCopyWithImpl<$Res>
    implements $PenggunaFormErrorCopyWith<$Res> {
  _$PenggunaFormErrorCopyWithImpl(this._self, this._then);

  final PenggunaFormError _self;
  final $Res Function(PenggunaFormError) _then;

/// Create a copy of PenggunaFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PenggunaFormError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
