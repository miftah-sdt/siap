// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseApiResponse<T> {

 bool get success; String get message; T? get data; ResponseMeta? get meta; Map<String, dynamic>? get errors;
/// Create a copy of BaseApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseApiResponseCopyWith<T, BaseApiResponse<T>> get copyWith => _$BaseApiResponseCopyWithImpl<T, BaseApiResponse<T>>(this as BaseApiResponse<T>, _$identity);

  /// Serializes this BaseApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseApiResponse<T>&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),meta,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'BaseApiResponse<$T>(success: $success, message: $message, data: $data, meta: $meta, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $BaseApiResponseCopyWith<T,$Res>  {
  factory $BaseApiResponseCopyWith(BaseApiResponse<T> value, $Res Function(BaseApiResponse<T>) _then) = _$BaseApiResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, T? data, ResponseMeta? meta, Map<String, dynamic>? errors
});


$ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$BaseApiResponseCopyWithImpl<T,$Res>
    implements $BaseApiResponseCopyWith<T, $Res> {
  _$BaseApiResponseCopyWithImpl(this._self, this._then);

  final BaseApiResponse<T> _self;
  final $Res Function(BaseApiResponse<T>) _then;

/// Create a copy of BaseApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,Object? meta = freezed,Object? errors = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of BaseApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [BaseApiResponse].
extension BaseApiResponsePatterns<T> on BaseApiResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseApiResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseApiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseApiResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _BaseApiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseApiResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BaseApiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  T? data,  ResponseMeta? meta,  Map<String, dynamic>? errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseApiResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  T? data,  ResponseMeta? meta,  Map<String, dynamic>? errors)  $default,) {final _that = this;
switch (_that) {
case _BaseApiResponse():
return $default(_that.success,_that.message,_that.data,_that.meta,_that.errors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  T? data,  ResponseMeta? meta,  Map<String, dynamic>? errors)?  $default,) {final _that = this;
switch (_that) {
case _BaseApiResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _BaseApiResponse<T> implements BaseApiResponse<T> {
  const _BaseApiResponse({this.success = false, this.message = '', this.data, this.meta, final  Map<String, dynamic>? errors}): _errors = errors;
  factory _BaseApiResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$BaseApiResponseFromJson(json,fromJsonT);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  T? data;
@override final  ResponseMeta? meta;
 final  Map<String, dynamic>? _errors;
@override Map<String, dynamic>? get errors {
  final value = _errors;
  if (value == null) return null;
  if (_errors is EqualUnmodifiableMapView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of BaseApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseApiResponseCopyWith<T, _BaseApiResponse<T>> get copyWith => __$BaseApiResponseCopyWithImpl<T, _BaseApiResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$BaseApiResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseApiResponse<T>&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),meta,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'BaseApiResponse<$T>(success: $success, message: $message, data: $data, meta: $meta, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$BaseApiResponseCopyWith<T,$Res> implements $BaseApiResponseCopyWith<T, $Res> {
  factory _$BaseApiResponseCopyWith(_BaseApiResponse<T> value, $Res Function(_BaseApiResponse<T>) _then) = __$BaseApiResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, T? data, ResponseMeta? meta, Map<String, dynamic>? errors
});


@override $ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$BaseApiResponseCopyWithImpl<T,$Res>
    implements _$BaseApiResponseCopyWith<T, $Res> {
  __$BaseApiResponseCopyWithImpl(this._self, this._then);

  final _BaseApiResponse<T> _self;
  final $Res Function(_BaseApiResponse<T>) _then;

/// Create a copy of BaseApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,Object? meta = freezed,Object? errors = freezed,}) {
  return _then(_BaseApiResponse<T>(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,errors: freezed == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of BaseApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$ResponseMeta {

 int? get page;@JsonKey(name: 'per_page') int? get perPage; int? get total;@JsonKey(name: 'total_pages') int? get totalPages;
/// Create a copy of ResponseMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseMetaCopyWith<ResponseMeta> get copyWith => _$ResponseMetaCopyWithImpl<ResponseMeta>(this as ResponseMeta, _$identity);

  /// Serializes this ResponseMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseMeta&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,perPage,total,totalPages);

@override
String toString() {
  return 'ResponseMeta(page: $page, perPage: $perPage, total: $total, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $ResponseMetaCopyWith<$Res>  {
  factory $ResponseMetaCopyWith(ResponseMeta value, $Res Function(ResponseMeta) _then) = _$ResponseMetaCopyWithImpl;
@useResult
$Res call({
 int? page,@JsonKey(name: 'per_page') int? perPage, int? total,@JsonKey(name: 'total_pages') int? totalPages
});




}
/// @nodoc
class _$ResponseMetaCopyWithImpl<$Res>
    implements $ResponseMetaCopyWith<$Res> {
  _$ResponseMetaCopyWithImpl(this._self, this._then);

  final ResponseMeta _self;
  final $Res Function(ResponseMeta) _then;

/// Create a copy of ResponseMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = freezed,Object? perPage = freezed,Object? total = freezed,Object? totalPages = freezed,}) {
  return _then(_self.copyWith(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResponseMeta].
extension ResponseMetaPatterns on ResponseMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResponseMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResponseMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResponseMeta value)  $default,){
final _that = this;
switch (_that) {
case _ResponseMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResponseMeta value)?  $default,){
final _that = this;
switch (_that) {
case _ResponseMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? page, @JsonKey(name: 'per_page')  int? perPage,  int? total, @JsonKey(name: 'total_pages')  int? totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponseMeta() when $default != null:
return $default(_that.page,_that.perPage,_that.total,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? page, @JsonKey(name: 'per_page')  int? perPage,  int? total, @JsonKey(name: 'total_pages')  int? totalPages)  $default,) {final _that = this;
switch (_that) {
case _ResponseMeta():
return $default(_that.page,_that.perPage,_that.total,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? page, @JsonKey(name: 'per_page')  int? perPage,  int? total, @JsonKey(name: 'total_pages')  int? totalPages)?  $default,) {final _that = this;
switch (_that) {
case _ResponseMeta() when $default != null:
return $default(_that.page,_that.perPage,_that.total,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResponseMeta implements ResponseMeta {
  const _ResponseMeta({this.page, @JsonKey(name: 'per_page') this.perPage, this.total, @JsonKey(name: 'total_pages') this.totalPages});
  factory _ResponseMeta.fromJson(Map<String, dynamic> json) => _$ResponseMetaFromJson(json);

@override final  int? page;
@override@JsonKey(name: 'per_page') final  int? perPage;
@override final  int? total;
@override@JsonKey(name: 'total_pages') final  int? totalPages;

/// Create a copy of ResponseMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseMetaCopyWith<_ResponseMeta> get copyWith => __$ResponseMetaCopyWithImpl<_ResponseMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseMeta&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,perPage,total,totalPages);

@override
String toString() {
  return 'ResponseMeta(page: $page, perPage: $perPage, total: $total, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$ResponseMetaCopyWith<$Res> implements $ResponseMetaCopyWith<$Res> {
  factory _$ResponseMetaCopyWith(_ResponseMeta value, $Res Function(_ResponseMeta) _then) = __$ResponseMetaCopyWithImpl;
@override @useResult
$Res call({
 int? page,@JsonKey(name: 'per_page') int? perPage, int? total,@JsonKey(name: 'total_pages') int? totalPages
});




}
/// @nodoc
class __$ResponseMetaCopyWithImpl<$Res>
    implements _$ResponseMetaCopyWith<$Res> {
  __$ResponseMetaCopyWithImpl(this._self, this._then);

  final _ResponseMeta _self;
  final $Res Function(_ResponseMeta) _then;

/// Create a copy of ResponseMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = freezed,Object? perPage = freezed,Object? total = freezed,Object? totalPages = freezed,}) {
  return _then(_ResponseMeta(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
