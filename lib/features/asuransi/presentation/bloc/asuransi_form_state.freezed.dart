// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asuransi_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsuransiFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiFormState()';
}


}

/// @nodoc
class $AsuransiFormStateCopyWith<$Res>  {
$AsuransiFormStateCopyWith(AsuransiFormState _, $Res Function(AsuransiFormState) __);
}


/// Adds pattern-matching-related methods to [AsuransiFormState].
extension AsuransiFormStatePatterns on AsuransiFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AsuransiFormInitial value)?  initial,TResult Function( AsuransiFormLoading value)?  loading,TResult Function( AsuransiFormEditing value)?  editing,TResult Function( AsuransiFormSuccess value)?  success,TResult Function( AsuransiFormError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AsuransiFormInitial() when initial != null:
return initial(_that);case AsuransiFormLoading() when loading != null:
return loading(_that);case AsuransiFormEditing() when editing != null:
return editing(_that);case AsuransiFormSuccess() when success != null:
return success(_that);case AsuransiFormError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AsuransiFormInitial value)  initial,required TResult Function( AsuransiFormLoading value)  loading,required TResult Function( AsuransiFormEditing value)  editing,required TResult Function( AsuransiFormSuccess value)  success,required TResult Function( AsuransiFormError value)  error,}){
final _that = this;
switch (_that) {
case AsuransiFormInitial():
return initial(_that);case AsuransiFormLoading():
return loading(_that);case AsuransiFormEditing():
return editing(_that);case AsuransiFormSuccess():
return success(_that);case AsuransiFormError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AsuransiFormInitial value)?  initial,TResult? Function( AsuransiFormLoading value)?  loading,TResult? Function( AsuransiFormEditing value)?  editing,TResult? Function( AsuransiFormSuccess value)?  success,TResult? Function( AsuransiFormError value)?  error,}){
final _that = this;
switch (_that) {
case AsuransiFormInitial() when initial != null:
return initial(_that);case AsuransiFormLoading() when loading != null:
return loading(_that);case AsuransiFormEditing() when editing != null:
return editing(_that);case AsuransiFormSuccess() when success != null:
return success(_that);case AsuransiFormError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Asuransi asuransi)?  editing,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AsuransiFormInitial() when initial != null:
return initial();case AsuransiFormLoading() when loading != null:
return loading();case AsuransiFormEditing() when editing != null:
return editing(_that.asuransi);case AsuransiFormSuccess() when success != null:
return success();case AsuransiFormError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Asuransi asuransi)  editing,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AsuransiFormInitial():
return initial();case AsuransiFormLoading():
return loading();case AsuransiFormEditing():
return editing(_that.asuransi);case AsuransiFormSuccess():
return success();case AsuransiFormError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Asuransi asuransi)?  editing,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AsuransiFormInitial() when initial != null:
return initial();case AsuransiFormLoading() when loading != null:
return loading();case AsuransiFormEditing() when editing != null:
return editing(_that.asuransi);case AsuransiFormSuccess() when success != null:
return success();case AsuransiFormError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AsuransiFormInitial implements AsuransiFormState {
  const AsuransiFormInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiFormInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiFormState.initial()';
}


}




/// @nodoc


class AsuransiFormLoading implements AsuransiFormState {
  const AsuransiFormLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiFormLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiFormState.loading()';
}


}




/// @nodoc


class AsuransiFormEditing implements AsuransiFormState {
  const AsuransiFormEditing(this.asuransi);
  

 final  Asuransi asuransi;

/// Create a copy of AsuransiFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsuransiFormEditingCopyWith<AsuransiFormEditing> get copyWith => _$AsuransiFormEditingCopyWithImpl<AsuransiFormEditing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiFormEditing&&(identical(other.asuransi, asuransi) || other.asuransi == asuransi));
}


@override
int get hashCode => Object.hash(runtimeType,asuransi);

@override
String toString() {
  return 'AsuransiFormState.editing(asuransi: $asuransi)';
}


}

/// @nodoc
abstract mixin class $AsuransiFormEditingCopyWith<$Res> implements $AsuransiFormStateCopyWith<$Res> {
  factory $AsuransiFormEditingCopyWith(AsuransiFormEditing value, $Res Function(AsuransiFormEditing) _then) = _$AsuransiFormEditingCopyWithImpl;
@useResult
$Res call({
 Asuransi asuransi
});




}
/// @nodoc
class _$AsuransiFormEditingCopyWithImpl<$Res>
    implements $AsuransiFormEditingCopyWith<$Res> {
  _$AsuransiFormEditingCopyWithImpl(this._self, this._then);

  final AsuransiFormEditing _self;
  final $Res Function(AsuransiFormEditing) _then;

/// Create a copy of AsuransiFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? asuransi = null,}) {
  return _then(AsuransiFormEditing(
null == asuransi ? _self.asuransi : asuransi // ignore: cast_nullable_to_non_nullable
as Asuransi,
  ));
}


}

/// @nodoc


class AsuransiFormSuccess implements AsuransiFormState {
  const AsuransiFormSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiFormSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiFormState.success()';
}


}




/// @nodoc


class AsuransiFormError implements AsuransiFormState {
  const AsuransiFormError(this.message);
  

 final  String message;

/// Create a copy of AsuransiFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsuransiFormErrorCopyWith<AsuransiFormError> get copyWith => _$AsuransiFormErrorCopyWithImpl<AsuransiFormError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiFormError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AsuransiFormState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AsuransiFormErrorCopyWith<$Res> implements $AsuransiFormStateCopyWith<$Res> {
  factory $AsuransiFormErrorCopyWith(AsuransiFormError value, $Res Function(AsuransiFormError) _then) = _$AsuransiFormErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AsuransiFormErrorCopyWithImpl<$Res>
    implements $AsuransiFormErrorCopyWith<$Res> {
  _$AsuransiFormErrorCopyWithImpl(this._self, this._then);

  final AsuransiFormError _self;
  final $Res Function(AsuransiFormError) _then;

/// Create a copy of AsuransiFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AsuransiFormError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
