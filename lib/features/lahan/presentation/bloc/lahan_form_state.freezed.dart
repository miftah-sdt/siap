// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lahan_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LahanFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanFormState()';
}


}

/// @nodoc
class $LahanFormStateCopyWith<$Res>  {
$LahanFormStateCopyWith(LahanFormState _, $Res Function(LahanFormState) __);
}


/// Adds pattern-matching-related methods to [LahanFormState].
extension LahanFormStatePatterns on LahanFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LahanFormInitial value)?  initial,TResult Function( LahanFormLoading value)?  loading,TResult Function( LahanFormEditing value)?  editing,TResult Function( LahanFormSuccess value)?  success,TResult Function( LahanFormError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LahanFormInitial() when initial != null:
return initial(_that);case LahanFormLoading() when loading != null:
return loading(_that);case LahanFormEditing() when editing != null:
return editing(_that);case LahanFormSuccess() when success != null:
return success(_that);case LahanFormError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LahanFormInitial value)  initial,required TResult Function( LahanFormLoading value)  loading,required TResult Function( LahanFormEditing value)  editing,required TResult Function( LahanFormSuccess value)  success,required TResult Function( LahanFormError value)  error,}){
final _that = this;
switch (_that) {
case LahanFormInitial():
return initial(_that);case LahanFormLoading():
return loading(_that);case LahanFormEditing():
return editing(_that);case LahanFormSuccess():
return success(_that);case LahanFormError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LahanFormInitial value)?  initial,TResult? Function( LahanFormLoading value)?  loading,TResult? Function( LahanFormEditing value)?  editing,TResult? Function( LahanFormSuccess value)?  success,TResult? Function( LahanFormError value)?  error,}){
final _that = this;
switch (_that) {
case LahanFormInitial() when initial != null:
return initial(_that);case LahanFormLoading() when loading != null:
return loading(_that);case LahanFormEditing() when editing != null:
return editing(_that);case LahanFormSuccess() when success != null:
return success(_that);case LahanFormError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Lahan lahan)?  editing,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LahanFormInitial() when initial != null:
return initial();case LahanFormLoading() when loading != null:
return loading();case LahanFormEditing() when editing != null:
return editing(_that.lahan);case LahanFormSuccess() when success != null:
return success();case LahanFormError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Lahan lahan)  editing,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LahanFormInitial():
return initial();case LahanFormLoading():
return loading();case LahanFormEditing():
return editing(_that.lahan);case LahanFormSuccess():
return success();case LahanFormError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Lahan lahan)?  editing,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LahanFormInitial() when initial != null:
return initial();case LahanFormLoading() when loading != null:
return loading();case LahanFormEditing() when editing != null:
return editing(_that.lahan);case LahanFormSuccess() when success != null:
return success();case LahanFormError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LahanFormInitial implements LahanFormState {
  const LahanFormInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanFormInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanFormState.initial()';
}


}




/// @nodoc


class LahanFormLoading implements LahanFormState {
  const LahanFormLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanFormLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanFormState.loading()';
}


}




/// @nodoc


class LahanFormEditing implements LahanFormState {
  const LahanFormEditing(this.lahan);
  

 final  Lahan lahan;

/// Create a copy of LahanFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LahanFormEditingCopyWith<LahanFormEditing> get copyWith => _$LahanFormEditingCopyWithImpl<LahanFormEditing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanFormEditing&&(identical(other.lahan, lahan) || other.lahan == lahan));
}


@override
int get hashCode => Object.hash(runtimeType,lahan);

@override
String toString() {
  return 'LahanFormState.editing(lahan: $lahan)';
}


}

/// @nodoc
abstract mixin class $LahanFormEditingCopyWith<$Res> implements $LahanFormStateCopyWith<$Res> {
  factory $LahanFormEditingCopyWith(LahanFormEditing value, $Res Function(LahanFormEditing) _then) = _$LahanFormEditingCopyWithImpl;
@useResult
$Res call({
 Lahan lahan
});




}
/// @nodoc
class _$LahanFormEditingCopyWithImpl<$Res>
    implements $LahanFormEditingCopyWith<$Res> {
  _$LahanFormEditingCopyWithImpl(this._self, this._then);

  final LahanFormEditing _self;
  final $Res Function(LahanFormEditing) _then;

/// Create a copy of LahanFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lahan = null,}) {
  return _then(LahanFormEditing(
null == lahan ? _self.lahan : lahan // ignore: cast_nullable_to_non_nullable
as Lahan,
  ));
}


}

/// @nodoc


class LahanFormSuccess implements LahanFormState {
  const LahanFormSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanFormSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanFormState.success()';
}


}




/// @nodoc


class LahanFormError implements LahanFormState {
  const LahanFormError(this.message);
  

 final  String message;

/// Create a copy of LahanFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LahanFormErrorCopyWith<LahanFormError> get copyWith => _$LahanFormErrorCopyWithImpl<LahanFormError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanFormError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LahanFormState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LahanFormErrorCopyWith<$Res> implements $LahanFormStateCopyWith<$Res> {
  factory $LahanFormErrorCopyWith(LahanFormError value, $Res Function(LahanFormError) _then) = _$LahanFormErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LahanFormErrorCopyWithImpl<$Res>
    implements $LahanFormErrorCopyWith<$Res> {
  _$LahanFormErrorCopyWithImpl(this._self, this._then);

  final LahanFormError _self;
  final $Res Function(LahanFormError) _then;

/// Create a copy of LahanFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LahanFormError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
