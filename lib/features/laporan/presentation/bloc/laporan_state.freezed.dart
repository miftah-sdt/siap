// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'laporan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LaporanState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaporanState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LaporanState()';
}


}

/// @nodoc
class $LaporanStateCopyWith<$Res>  {
$LaporanStateCopyWith(LaporanState _, $Res Function(LaporanState) __);
}


/// Adds pattern-matching-related methods to [LaporanState].
extension LaporanStatePatterns on LaporanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LaporanInitial value)?  initial,TResult Function( LaporanLoading value)?  loading,TResult Function( LaporanSuccess value)?  success,TResult Function( LaporanError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LaporanInitial() when initial != null:
return initial(_that);case LaporanLoading() when loading != null:
return loading(_that);case LaporanSuccess() when success != null:
return success(_that);case LaporanError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LaporanInitial value)  initial,required TResult Function( LaporanLoading value)  loading,required TResult Function( LaporanSuccess value)  success,required TResult Function( LaporanError value)  error,}){
final _that = this;
switch (_that) {
case LaporanInitial():
return initial(_that);case LaporanLoading():
return loading(_that);case LaporanSuccess():
return success(_that);case LaporanError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LaporanInitial value)?  initial,TResult? Function( LaporanLoading value)?  loading,TResult? Function( LaporanSuccess value)?  success,TResult? Function( LaporanError value)?  error,}){
final _that = this;
switch (_that) {
case LaporanInitial() when initial != null:
return initial(_that);case LaporanLoading() when loading != null:
return loading(_that);case LaporanSuccess() when success != null:
return success(_that);case LaporanError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( LaporanExportResult result)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LaporanInitial() when initial != null:
return initial();case LaporanLoading() when loading != null:
return loading();case LaporanSuccess() when success != null:
return success(_that.result);case LaporanError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( LaporanExportResult result)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LaporanInitial():
return initial();case LaporanLoading():
return loading();case LaporanSuccess():
return success(_that.result);case LaporanError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( LaporanExportResult result)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LaporanInitial() when initial != null:
return initial();case LaporanLoading() when loading != null:
return loading();case LaporanSuccess() when success != null:
return success(_that.result);case LaporanError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LaporanInitial implements LaporanState {
  const LaporanInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaporanInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LaporanState.initial()';
}


}




/// @nodoc


class LaporanLoading implements LaporanState {
  const LaporanLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaporanLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LaporanState.loading()';
}


}




/// @nodoc


class LaporanSuccess implements LaporanState {
  const LaporanSuccess(this.result);
  

 final  LaporanExportResult result;

/// Create a copy of LaporanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaporanSuccessCopyWith<LaporanSuccess> get copyWith => _$LaporanSuccessCopyWithImpl<LaporanSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaporanSuccess&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,result);

@override
String toString() {
  return 'LaporanState.success(result: $result)';
}


}

/// @nodoc
abstract mixin class $LaporanSuccessCopyWith<$Res> implements $LaporanStateCopyWith<$Res> {
  factory $LaporanSuccessCopyWith(LaporanSuccess value, $Res Function(LaporanSuccess) _then) = _$LaporanSuccessCopyWithImpl;
@useResult
$Res call({
 LaporanExportResult result
});




}
/// @nodoc
class _$LaporanSuccessCopyWithImpl<$Res>
    implements $LaporanSuccessCopyWith<$Res> {
  _$LaporanSuccessCopyWithImpl(this._self, this._then);

  final LaporanSuccess _self;
  final $Res Function(LaporanSuccess) _then;

/// Create a copy of LaporanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(LaporanSuccess(
null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as LaporanExportResult,
  ));
}


}

/// @nodoc


class LaporanError implements LaporanState {
  const LaporanError(this.message);
  

 final  String message;

/// Create a copy of LaporanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaporanErrorCopyWith<LaporanError> get copyWith => _$LaporanErrorCopyWithImpl<LaporanError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaporanError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LaporanState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LaporanErrorCopyWith<$Res> implements $LaporanStateCopyWith<$Res> {
  factory $LaporanErrorCopyWith(LaporanError value, $Res Function(LaporanError) _then) = _$LaporanErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LaporanErrorCopyWithImpl<$Res>
    implements $LaporanErrorCopyWith<$Res> {
  _$LaporanErrorCopyWithImpl(this._self, this._then);

  final LaporanError _self;
  final $Res Function(LaporanError) _then;

/// Create a copy of LaporanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LaporanError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
