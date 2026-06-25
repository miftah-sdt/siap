// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petani_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetaniFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniFormState()';
}


}

/// @nodoc
class $PetaniFormStateCopyWith<$Res>  {
$PetaniFormStateCopyWith(PetaniFormState _, $Res Function(PetaniFormState) __);
}


/// Adds pattern-matching-related methods to [PetaniFormState].
extension PetaniFormStatePatterns on PetaniFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetaniFormInitial value)?  initial,TResult Function( PetaniFormLoading value)?  loading,TResult Function( PetaniFormEditing value)?  editing,TResult Function( PetaniFormSuccess value)?  success,TResult Function( PetaniFormError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetaniFormInitial() when initial != null:
return initial(_that);case PetaniFormLoading() when loading != null:
return loading(_that);case PetaniFormEditing() when editing != null:
return editing(_that);case PetaniFormSuccess() when success != null:
return success(_that);case PetaniFormError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetaniFormInitial value)  initial,required TResult Function( PetaniFormLoading value)  loading,required TResult Function( PetaniFormEditing value)  editing,required TResult Function( PetaniFormSuccess value)  success,required TResult Function( PetaniFormError value)  error,}){
final _that = this;
switch (_that) {
case PetaniFormInitial():
return initial(_that);case PetaniFormLoading():
return loading(_that);case PetaniFormEditing():
return editing(_that);case PetaniFormSuccess():
return success(_that);case PetaniFormError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetaniFormInitial value)?  initial,TResult? Function( PetaniFormLoading value)?  loading,TResult? Function( PetaniFormEditing value)?  editing,TResult? Function( PetaniFormSuccess value)?  success,TResult? Function( PetaniFormError value)?  error,}){
final _that = this;
switch (_that) {
case PetaniFormInitial() when initial != null:
return initial(_that);case PetaniFormLoading() when loading != null:
return loading(_that);case PetaniFormEditing() when editing != null:
return editing(_that);case PetaniFormSuccess() when success != null:
return success(_that);case PetaniFormError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Petani petani)?  editing,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetaniFormInitial() when initial != null:
return initial();case PetaniFormLoading() when loading != null:
return loading();case PetaniFormEditing() when editing != null:
return editing(_that.petani);case PetaniFormSuccess() when success != null:
return success();case PetaniFormError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Petani petani)  editing,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case PetaniFormInitial():
return initial();case PetaniFormLoading():
return loading();case PetaniFormEditing():
return editing(_that.petani);case PetaniFormSuccess():
return success();case PetaniFormError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Petani petani)?  editing,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case PetaniFormInitial() when initial != null:
return initial();case PetaniFormLoading() when loading != null:
return loading();case PetaniFormEditing() when editing != null:
return editing(_that.petani);case PetaniFormSuccess() when success != null:
return success();case PetaniFormError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class PetaniFormInitial implements PetaniFormState {
  const PetaniFormInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniFormInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniFormState.initial()';
}


}




/// @nodoc


class PetaniFormLoading implements PetaniFormState {
  const PetaniFormLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniFormLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniFormState.loading()';
}


}




/// @nodoc


class PetaniFormEditing implements PetaniFormState {
  const PetaniFormEditing(this.petani);
  

 final  Petani petani;

/// Create a copy of PetaniFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetaniFormEditingCopyWith<PetaniFormEditing> get copyWith => _$PetaniFormEditingCopyWithImpl<PetaniFormEditing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniFormEditing&&(identical(other.petani, petani) || other.petani == petani));
}


@override
int get hashCode => Object.hash(runtimeType,petani);

@override
String toString() {
  return 'PetaniFormState.editing(petani: $petani)';
}


}

/// @nodoc
abstract mixin class $PetaniFormEditingCopyWith<$Res> implements $PetaniFormStateCopyWith<$Res> {
  factory $PetaniFormEditingCopyWith(PetaniFormEditing value, $Res Function(PetaniFormEditing) _then) = _$PetaniFormEditingCopyWithImpl;
@useResult
$Res call({
 Petani petani
});




}
/// @nodoc
class _$PetaniFormEditingCopyWithImpl<$Res>
    implements $PetaniFormEditingCopyWith<$Res> {
  _$PetaniFormEditingCopyWithImpl(this._self, this._then);

  final PetaniFormEditing _self;
  final $Res Function(PetaniFormEditing) _then;

/// Create a copy of PetaniFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petani = null,}) {
  return _then(PetaniFormEditing(
null == petani ? _self.petani : petani // ignore: cast_nullable_to_non_nullable
as Petani,
  ));
}


}

/// @nodoc


class PetaniFormSuccess implements PetaniFormState {
  const PetaniFormSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniFormSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniFormState.success()';
}


}




/// @nodoc


class PetaniFormError implements PetaniFormState {
  const PetaniFormError(this.message);
  

 final  String message;

/// Create a copy of PetaniFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetaniFormErrorCopyWith<PetaniFormError> get copyWith => _$PetaniFormErrorCopyWithImpl<PetaniFormError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniFormError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PetaniFormState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PetaniFormErrorCopyWith<$Res> implements $PetaniFormStateCopyWith<$Res> {
  factory $PetaniFormErrorCopyWith(PetaniFormError value, $Res Function(PetaniFormError) _then) = _$PetaniFormErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PetaniFormErrorCopyWithImpl<$Res>
    implements $PetaniFormErrorCopyWith<$Res> {
  _$PetaniFormErrorCopyWithImpl(this._self, this._then);

  final PetaniFormError _self;
  final $Res Function(PetaniFormError) _then;

/// Create a copy of PetaniFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PetaniFormError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
