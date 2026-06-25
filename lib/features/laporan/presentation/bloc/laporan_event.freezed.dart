// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'laporan_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LaporanEvent {

 LaporanFilter get filter;
/// Create a copy of LaporanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaporanEventCopyWith<LaporanEvent> get copyWith => _$LaporanEventCopyWithImpl<LaporanEvent>(this as LaporanEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaporanEvent&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'LaporanEvent(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $LaporanEventCopyWith<$Res>  {
  factory $LaporanEventCopyWith(LaporanEvent value, $Res Function(LaporanEvent) _then) = _$LaporanEventCopyWithImpl;
@useResult
$Res call({
 LaporanFilter filter
});




}
/// @nodoc
class _$LaporanEventCopyWithImpl<$Res>
    implements $LaporanEventCopyWith<$Res> {
  _$LaporanEventCopyWithImpl(this._self, this._then);

  final LaporanEvent _self;
  final $Res Function(LaporanEvent) _then;

/// Create a copy of LaporanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as LaporanFilter,
  ));
}

}


/// Adds pattern-matching-related methods to [LaporanEvent].
extension LaporanEventPatterns on LaporanEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LaporanExportPdf value)?  exportPdf,TResult Function( LaporanExportExcel value)?  exportExcel,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LaporanExportPdf() when exportPdf != null:
return exportPdf(_that);case LaporanExportExcel() when exportExcel != null:
return exportExcel(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LaporanExportPdf value)  exportPdf,required TResult Function( LaporanExportExcel value)  exportExcel,}){
final _that = this;
switch (_that) {
case LaporanExportPdf():
return exportPdf(_that);case LaporanExportExcel():
return exportExcel(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LaporanExportPdf value)?  exportPdf,TResult? Function( LaporanExportExcel value)?  exportExcel,}){
final _that = this;
switch (_that) {
case LaporanExportPdf() when exportPdf != null:
return exportPdf(_that);case LaporanExportExcel() when exportExcel != null:
return exportExcel(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LaporanFilter filter)?  exportPdf,TResult Function( LaporanFilter filter)?  exportExcel,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LaporanExportPdf() when exportPdf != null:
return exportPdf(_that.filter);case LaporanExportExcel() when exportExcel != null:
return exportExcel(_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LaporanFilter filter)  exportPdf,required TResult Function( LaporanFilter filter)  exportExcel,}) {final _that = this;
switch (_that) {
case LaporanExportPdf():
return exportPdf(_that.filter);case LaporanExportExcel():
return exportExcel(_that.filter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LaporanFilter filter)?  exportPdf,TResult? Function( LaporanFilter filter)?  exportExcel,}) {final _that = this;
switch (_that) {
case LaporanExportPdf() when exportPdf != null:
return exportPdf(_that.filter);case LaporanExportExcel() when exportExcel != null:
return exportExcel(_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class LaporanExportPdf implements LaporanEvent {
  const LaporanExportPdf({required this.filter});
  

@override final  LaporanFilter filter;

/// Create a copy of LaporanEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaporanExportPdfCopyWith<LaporanExportPdf> get copyWith => _$LaporanExportPdfCopyWithImpl<LaporanExportPdf>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaporanExportPdf&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'LaporanEvent.exportPdf(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $LaporanExportPdfCopyWith<$Res> implements $LaporanEventCopyWith<$Res> {
  factory $LaporanExportPdfCopyWith(LaporanExportPdf value, $Res Function(LaporanExportPdf) _then) = _$LaporanExportPdfCopyWithImpl;
@override @useResult
$Res call({
 LaporanFilter filter
});




}
/// @nodoc
class _$LaporanExportPdfCopyWithImpl<$Res>
    implements $LaporanExportPdfCopyWith<$Res> {
  _$LaporanExportPdfCopyWithImpl(this._self, this._then);

  final LaporanExportPdf _self;
  final $Res Function(LaporanExportPdf) _then;

/// Create a copy of LaporanEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(LaporanExportPdf(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as LaporanFilter,
  ));
}


}

/// @nodoc


class LaporanExportExcel implements LaporanEvent {
  const LaporanExportExcel({required this.filter});
  

@override final  LaporanFilter filter;

/// Create a copy of LaporanEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaporanExportExcelCopyWith<LaporanExportExcel> get copyWith => _$LaporanExportExcelCopyWithImpl<LaporanExportExcel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaporanExportExcel&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'LaporanEvent.exportExcel(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $LaporanExportExcelCopyWith<$Res> implements $LaporanEventCopyWith<$Res> {
  factory $LaporanExportExcelCopyWith(LaporanExportExcel value, $Res Function(LaporanExportExcel) _then) = _$LaporanExportExcelCopyWithImpl;
@override @useResult
$Res call({
 LaporanFilter filter
});




}
/// @nodoc
class _$LaporanExportExcelCopyWithImpl<$Res>
    implements $LaporanExportExcelCopyWith<$Res> {
  _$LaporanExportExcelCopyWithImpl(this._self, this._then);

  final LaporanExportExcel _self;
  final $Res Function(LaporanExportExcel) _then;

/// Create a copy of LaporanEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(LaporanExportExcel(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as LaporanFilter,
  ));
}


}

// dart format on
