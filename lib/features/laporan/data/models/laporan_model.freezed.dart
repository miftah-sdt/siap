// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'laporan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LaporanExportResultModel {

@JsonKey(name: 'file_name') String get fileName;@JsonKey(name: 'download_url') String get downloadUrl;
/// Create a copy of LaporanExportResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaporanExportResultModelCopyWith<LaporanExportResultModel> get copyWith => _$LaporanExportResultModelCopyWithImpl<LaporanExportResultModel>(this as LaporanExportResultModel, _$identity);

  /// Serializes this LaporanExportResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaporanExportResultModel&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileName,downloadUrl);

@override
String toString() {
  return 'LaporanExportResultModel(fileName: $fileName, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class $LaporanExportResultModelCopyWith<$Res>  {
  factory $LaporanExportResultModelCopyWith(LaporanExportResultModel value, $Res Function(LaporanExportResultModel) _then) = _$LaporanExportResultModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'file_name') String fileName,@JsonKey(name: 'download_url') String downloadUrl
});




}
/// @nodoc
class _$LaporanExportResultModelCopyWithImpl<$Res>
    implements $LaporanExportResultModelCopyWith<$Res> {
  _$LaporanExportResultModelCopyWithImpl(this._self, this._then);

  final LaporanExportResultModel _self;
  final $Res Function(LaporanExportResultModel) _then;

/// Create a copy of LaporanExportResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileName = null,Object? downloadUrl = null,}) {
  return _then(_self.copyWith(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LaporanExportResultModel].
extension LaporanExportResultModelPatterns on LaporanExportResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LaporanExportResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LaporanExportResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LaporanExportResultModel value)  $default,){
final _that = this;
switch (_that) {
case _LaporanExportResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LaporanExportResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _LaporanExportResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'download_url')  String downloadUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LaporanExportResultModel() when $default != null:
return $default(_that.fileName,_that.downloadUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'download_url')  String downloadUrl)  $default,) {final _that = this;
switch (_that) {
case _LaporanExportResultModel():
return $default(_that.fileName,_that.downloadUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'download_url')  String downloadUrl)?  $default,) {final _that = this;
switch (_that) {
case _LaporanExportResultModel() when $default != null:
return $default(_that.fileName,_that.downloadUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LaporanExportResultModel extends LaporanExportResultModel {
  const _LaporanExportResultModel({@JsonKey(name: 'file_name') required this.fileName, @JsonKey(name: 'download_url') required this.downloadUrl}): super._();
  factory _LaporanExportResultModel.fromJson(Map<String, dynamic> json) => _$LaporanExportResultModelFromJson(json);

@override@JsonKey(name: 'file_name') final  String fileName;
@override@JsonKey(name: 'download_url') final  String downloadUrl;

/// Create a copy of LaporanExportResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaporanExportResultModelCopyWith<_LaporanExportResultModel> get copyWith => __$LaporanExportResultModelCopyWithImpl<_LaporanExportResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LaporanExportResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaporanExportResultModel&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileName,downloadUrl);

@override
String toString() {
  return 'LaporanExportResultModel(fileName: $fileName, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class _$LaporanExportResultModelCopyWith<$Res> implements $LaporanExportResultModelCopyWith<$Res> {
  factory _$LaporanExportResultModelCopyWith(_LaporanExportResultModel value, $Res Function(_LaporanExportResultModel) _then) = __$LaporanExportResultModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'file_name') String fileName,@JsonKey(name: 'download_url') String downloadUrl
});




}
/// @nodoc
class __$LaporanExportResultModelCopyWithImpl<$Res>
    implements _$LaporanExportResultModelCopyWith<$Res> {
  __$LaporanExportResultModelCopyWithImpl(this._self, this._then);

  final _LaporanExportResultModel _self;
  final $Res Function(_LaporanExportResultModel) _then;

/// Create a copy of LaporanExportResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? downloadUrl = null,}) {
  return _then(_LaporanExportResultModel(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LaporanExportRequestModel {

 String get type;@JsonKey(name: 'start_date') String? get startDate;@JsonKey(name: 'end_date') String? get endDate; String? get status; String get format;
/// Create a copy of LaporanExportRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaporanExportRequestModelCopyWith<LaporanExportRequestModel> get copyWith => _$LaporanExportRequestModelCopyWithImpl<LaporanExportRequestModel>(this as LaporanExportRequestModel, _$identity);

  /// Serializes this LaporanExportRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaporanExportRequestModel&&(identical(other.type, type) || other.type == type)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.format, format) || other.format == format));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,startDate,endDate,status,format);

@override
String toString() {
  return 'LaporanExportRequestModel(type: $type, startDate: $startDate, endDate: $endDate, status: $status, format: $format)';
}


}

/// @nodoc
abstract mixin class $LaporanExportRequestModelCopyWith<$Res>  {
  factory $LaporanExportRequestModelCopyWith(LaporanExportRequestModel value, $Res Function(LaporanExportRequestModel) _then) = _$LaporanExportRequestModelCopyWithImpl;
@useResult
$Res call({
 String type,@JsonKey(name: 'start_date') String? startDate,@JsonKey(name: 'end_date') String? endDate, String? status, String format
});




}
/// @nodoc
class _$LaporanExportRequestModelCopyWithImpl<$Res>
    implements $LaporanExportRequestModelCopyWith<$Res> {
  _$LaporanExportRequestModelCopyWithImpl(this._self, this._then);

  final LaporanExportRequestModel _self;
  final $Res Function(LaporanExportRequestModel) _then;

/// Create a copy of LaporanExportRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? startDate = freezed,Object? endDate = freezed,Object? status = freezed,Object? format = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LaporanExportRequestModel].
extension LaporanExportRequestModelPatterns on LaporanExportRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LaporanExportRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LaporanExportRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LaporanExportRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _LaporanExportRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LaporanExportRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _LaporanExportRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'end_date')  String? endDate,  String? status,  String format)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LaporanExportRequestModel() when $default != null:
return $default(_that.type,_that.startDate,_that.endDate,_that.status,_that.format);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'end_date')  String? endDate,  String? status,  String format)  $default,) {final _that = this;
switch (_that) {
case _LaporanExportRequestModel():
return $default(_that.type,_that.startDate,_that.endDate,_that.status,_that.format);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'end_date')  String? endDate,  String? status,  String format)?  $default,) {final _that = this;
switch (_that) {
case _LaporanExportRequestModel() when $default != null:
return $default(_that.type,_that.startDate,_that.endDate,_that.status,_that.format);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LaporanExportRequestModel implements LaporanExportRequestModel {
  const _LaporanExportRequestModel({required this.type, @JsonKey(name: 'start_date') this.startDate, @JsonKey(name: 'end_date') this.endDate, this.status, required this.format});
  factory _LaporanExportRequestModel.fromJson(Map<String, dynamic> json) => _$LaporanExportRequestModelFromJson(json);

@override final  String type;
@override@JsonKey(name: 'start_date') final  String? startDate;
@override@JsonKey(name: 'end_date') final  String? endDate;
@override final  String? status;
@override final  String format;

/// Create a copy of LaporanExportRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaporanExportRequestModelCopyWith<_LaporanExportRequestModel> get copyWith => __$LaporanExportRequestModelCopyWithImpl<_LaporanExportRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LaporanExportRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaporanExportRequestModel&&(identical(other.type, type) || other.type == type)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.format, format) || other.format == format));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,startDate,endDate,status,format);

@override
String toString() {
  return 'LaporanExportRequestModel(type: $type, startDate: $startDate, endDate: $endDate, status: $status, format: $format)';
}


}

/// @nodoc
abstract mixin class _$LaporanExportRequestModelCopyWith<$Res> implements $LaporanExportRequestModelCopyWith<$Res> {
  factory _$LaporanExportRequestModelCopyWith(_LaporanExportRequestModel value, $Res Function(_LaporanExportRequestModel) _then) = __$LaporanExportRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String type,@JsonKey(name: 'start_date') String? startDate,@JsonKey(name: 'end_date') String? endDate, String? status, String format
});




}
/// @nodoc
class __$LaporanExportRequestModelCopyWithImpl<$Res>
    implements _$LaporanExportRequestModelCopyWith<$Res> {
  __$LaporanExportRequestModelCopyWithImpl(this._self, this._then);

  final _LaporanExportRequestModel _self;
  final $Res Function(_LaporanExportRequestModel) _then;

/// Create a copy of LaporanExportRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? startDate = freezed,Object? endDate = freezed,Object? status = freezed,Object? format = null,}) {
  return _then(_LaporanExportRequestModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
