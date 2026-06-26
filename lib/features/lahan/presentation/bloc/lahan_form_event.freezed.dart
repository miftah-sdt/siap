// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lahan_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LahanFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanFormEvent()';
}


}

/// @nodoc
class $LahanFormEventCopyWith<$Res>  {
$LahanFormEventCopyWith(LahanFormEvent _, $Res Function(LahanFormEvent) __);
}


/// Adds pattern-matching-related methods to [LahanFormEvent].
extension LahanFormEventPatterns on LahanFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LahanFormStarted value)?  started,TResult Function( LahanFormSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LahanFormStarted() when started != null:
return started(_that);case LahanFormSubmitted() when submitted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LahanFormStarted value)  started,required TResult Function( LahanFormSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case LahanFormStarted():
return started(_that);case LahanFormSubmitted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LahanFormStarted value)?  started,TResult? Function( LahanFormSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case LahanFormStarted() when started != null:
return started(_that);case LahanFormSubmitted() when submitted != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Lahan? lahan)?  started,TResult Function( String petaniId,  String petaniNama,  String kodeLahan,  String namaLahan,  double luas,  String lokasi,  String? koordinat)?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LahanFormStarted() when started != null:
return started(_that.lahan);case LahanFormSubmitted() when submitted != null:
return submitted(_that.petaniId,_that.petaniNama,_that.kodeLahan,_that.namaLahan,_that.luas,_that.lokasi,_that.koordinat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Lahan? lahan)  started,required TResult Function( String petaniId,  String petaniNama,  String kodeLahan,  String namaLahan,  double luas,  String lokasi,  String? koordinat)  submitted,}) {final _that = this;
switch (_that) {
case LahanFormStarted():
return started(_that.lahan);case LahanFormSubmitted():
return submitted(_that.petaniId,_that.petaniNama,_that.kodeLahan,_that.namaLahan,_that.luas,_that.lokasi,_that.koordinat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Lahan? lahan)?  started,TResult? Function( String petaniId,  String petaniNama,  String kodeLahan,  String namaLahan,  double luas,  String lokasi,  String? koordinat)?  submitted,}) {final _that = this;
switch (_that) {
case LahanFormStarted() when started != null:
return started(_that.lahan);case LahanFormSubmitted() when submitted != null:
return submitted(_that.petaniId,_that.petaniNama,_that.kodeLahan,_that.namaLahan,_that.luas,_that.lokasi,_that.koordinat);case _:
  return null;

}
}

}

/// @nodoc


class LahanFormStarted implements LahanFormEvent {
  const LahanFormStarted({this.lahan});
  

 final  Lahan? lahan;

/// Create a copy of LahanFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LahanFormStartedCopyWith<LahanFormStarted> get copyWith => _$LahanFormStartedCopyWithImpl<LahanFormStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanFormStarted&&(identical(other.lahan, lahan) || other.lahan == lahan));
}


@override
int get hashCode => Object.hash(runtimeType,lahan);

@override
String toString() {
  return 'LahanFormEvent.started(lahan: $lahan)';
}


}

/// @nodoc
abstract mixin class $LahanFormStartedCopyWith<$Res> implements $LahanFormEventCopyWith<$Res> {
  factory $LahanFormStartedCopyWith(LahanFormStarted value, $Res Function(LahanFormStarted) _then) = _$LahanFormStartedCopyWithImpl;
@useResult
$Res call({
 Lahan? lahan
});




}
/// @nodoc
class _$LahanFormStartedCopyWithImpl<$Res>
    implements $LahanFormStartedCopyWith<$Res> {
  _$LahanFormStartedCopyWithImpl(this._self, this._then);

  final LahanFormStarted _self;
  final $Res Function(LahanFormStarted) _then;

/// Create a copy of LahanFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lahan = freezed,}) {
  return _then(LahanFormStarted(
lahan: freezed == lahan ? _self.lahan : lahan // ignore: cast_nullable_to_non_nullable
as Lahan?,
  ));
}


}

/// @nodoc


class LahanFormSubmitted implements LahanFormEvent {
  const LahanFormSubmitted({required this.petaniId, required this.petaniNama, required this.kodeLahan, required this.namaLahan, required this.luas, required this.lokasi, this.koordinat});
  

 final  String petaniId;
 final  String petaniNama;
 final  String kodeLahan;
 final  String namaLahan;
 final  double luas;
 final  String lokasi;
 final  String? koordinat;

/// Create a copy of LahanFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LahanFormSubmittedCopyWith<LahanFormSubmitted> get copyWith => _$LahanFormSubmittedCopyWithImpl<LahanFormSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanFormSubmitted&&(identical(other.petaniId, petaniId) || other.petaniId == petaniId)&&(identical(other.petaniNama, petaniNama) || other.petaniNama == petaniNama)&&(identical(other.kodeLahan, kodeLahan) || other.kodeLahan == kodeLahan)&&(identical(other.namaLahan, namaLahan) || other.namaLahan == namaLahan)&&(identical(other.luas, luas) || other.luas == luas)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.koordinat, koordinat) || other.koordinat == koordinat));
}


@override
int get hashCode => Object.hash(runtimeType,petaniId,petaniNama,kodeLahan,namaLahan,luas,lokasi,koordinat);

@override
String toString() {
  return 'LahanFormEvent.submitted(petaniId: $petaniId, petaniNama: $petaniNama, kodeLahan: $kodeLahan, namaLahan: $namaLahan, luas: $luas, lokasi: $lokasi, koordinat: $koordinat)';
}


}

/// @nodoc
abstract mixin class $LahanFormSubmittedCopyWith<$Res> implements $LahanFormEventCopyWith<$Res> {
  factory $LahanFormSubmittedCopyWith(LahanFormSubmitted value, $Res Function(LahanFormSubmitted) _then) = _$LahanFormSubmittedCopyWithImpl;
@useResult
$Res call({
 String petaniId, String petaniNama, String kodeLahan, String namaLahan, double luas, String lokasi, String? koordinat
});




}
/// @nodoc
class _$LahanFormSubmittedCopyWithImpl<$Res>
    implements $LahanFormSubmittedCopyWith<$Res> {
  _$LahanFormSubmittedCopyWithImpl(this._self, this._then);

  final LahanFormSubmitted _self;
  final $Res Function(LahanFormSubmitted) _then;

/// Create a copy of LahanFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petaniId = null,Object? petaniNama = null,Object? kodeLahan = null,Object? namaLahan = null,Object? luas = null,Object? lokasi = null,Object? koordinat = freezed,}) {
  return _then(LahanFormSubmitted(
petaniId: null == petaniId ? _self.petaniId : petaniId // ignore: cast_nullable_to_non_nullable
as String,petaniNama: null == petaniNama ? _self.petaniNama : petaniNama // ignore: cast_nullable_to_non_nullable
as String,kodeLahan: null == kodeLahan ? _self.kodeLahan : kodeLahan // ignore: cast_nullable_to_non_nullable
as String,namaLahan: null == namaLahan ? _self.namaLahan : namaLahan // ignore: cast_nullable_to_non_nullable
as String,luas: null == luas ? _self.luas : luas // ignore: cast_nullable_to_non_nullable
as double,lokasi: null == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String,koordinat: freezed == koordinat ? _self.koordinat : koordinat // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
