// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petani_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetaniFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniFormEvent()';
}


}

/// @nodoc
class $PetaniFormEventCopyWith<$Res>  {
$PetaniFormEventCopyWith(PetaniFormEvent _, $Res Function(PetaniFormEvent) __);
}


/// Adds pattern-matching-related methods to [PetaniFormEvent].
extension PetaniFormEventPatterns on PetaniFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetaniFormStarted value)?  started,TResult Function( PetaniFormSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetaniFormStarted() when started != null:
return started(_that);case PetaniFormSubmitted() when submitted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetaniFormStarted value)  started,required TResult Function( PetaniFormSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case PetaniFormStarted():
return started(_that);case PetaniFormSubmitted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetaniFormStarted value)?  started,TResult? Function( PetaniFormSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case PetaniFormStarted() when started != null:
return started(_that);case PetaniFormSubmitted() when submitted != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Petani? petani)?  started,TResult Function( String nik,  String nama,  String alamat,  String noHp,  String kelompokTani)?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetaniFormStarted() when started != null:
return started(_that.petani);case PetaniFormSubmitted() when submitted != null:
return submitted(_that.nik,_that.nama,_that.alamat,_that.noHp,_that.kelompokTani);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Petani? petani)  started,required TResult Function( String nik,  String nama,  String alamat,  String noHp,  String kelompokTani)  submitted,}) {final _that = this;
switch (_that) {
case PetaniFormStarted():
return started(_that.petani);case PetaniFormSubmitted():
return submitted(_that.nik,_that.nama,_that.alamat,_that.noHp,_that.kelompokTani);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Petani? petani)?  started,TResult? Function( String nik,  String nama,  String alamat,  String noHp,  String kelompokTani)?  submitted,}) {final _that = this;
switch (_that) {
case PetaniFormStarted() when started != null:
return started(_that.petani);case PetaniFormSubmitted() when submitted != null:
return submitted(_that.nik,_that.nama,_that.alamat,_that.noHp,_that.kelompokTani);case _:
  return null;

}
}

}

/// @nodoc


class PetaniFormStarted implements PetaniFormEvent {
  const PetaniFormStarted({this.petani});
  

 final  Petani? petani;

/// Create a copy of PetaniFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetaniFormStartedCopyWith<PetaniFormStarted> get copyWith => _$PetaniFormStartedCopyWithImpl<PetaniFormStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniFormStarted&&(identical(other.petani, petani) || other.petani == petani));
}


@override
int get hashCode => Object.hash(runtimeType,petani);

@override
String toString() {
  return 'PetaniFormEvent.started(petani: $petani)';
}


}

/// @nodoc
abstract mixin class $PetaniFormStartedCopyWith<$Res> implements $PetaniFormEventCopyWith<$Res> {
  factory $PetaniFormStartedCopyWith(PetaniFormStarted value, $Res Function(PetaniFormStarted) _then) = _$PetaniFormStartedCopyWithImpl;
@useResult
$Res call({
 Petani? petani
});




}
/// @nodoc
class _$PetaniFormStartedCopyWithImpl<$Res>
    implements $PetaniFormStartedCopyWith<$Res> {
  _$PetaniFormStartedCopyWithImpl(this._self, this._then);

  final PetaniFormStarted _self;
  final $Res Function(PetaniFormStarted) _then;

/// Create a copy of PetaniFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petani = freezed,}) {
  return _then(PetaniFormStarted(
petani: freezed == petani ? _self.petani : petani // ignore: cast_nullable_to_non_nullable
as Petani?,
  ));
}


}

/// @nodoc


class PetaniFormSubmitted implements PetaniFormEvent {
  const PetaniFormSubmitted({required this.nik, required this.nama, required this.alamat, required this.noHp, required this.kelompokTani});
  

 final  String nik;
 final  String nama;
 final  String alamat;
 final  String noHp;
 final  String kelompokTani;

/// Create a copy of PetaniFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetaniFormSubmittedCopyWith<PetaniFormSubmitted> get copyWith => _$PetaniFormSubmittedCopyWithImpl<PetaniFormSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniFormSubmitted&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.nama, nama) || other.nama == nama)&&(identical(other.alamat, alamat) || other.alamat == alamat)&&(identical(other.noHp, noHp) || other.noHp == noHp)&&(identical(other.kelompokTani, kelompokTani) || other.kelompokTani == kelompokTani));
}


@override
int get hashCode => Object.hash(runtimeType,nik,nama,alamat,noHp,kelompokTani);

@override
String toString() {
  return 'PetaniFormEvent.submitted(nik: $nik, nama: $nama, alamat: $alamat, noHp: $noHp, kelompokTani: $kelompokTani)';
}


}

/// @nodoc
abstract mixin class $PetaniFormSubmittedCopyWith<$Res> implements $PetaniFormEventCopyWith<$Res> {
  factory $PetaniFormSubmittedCopyWith(PetaniFormSubmitted value, $Res Function(PetaniFormSubmitted) _then) = _$PetaniFormSubmittedCopyWithImpl;
@useResult
$Res call({
 String nik, String nama, String alamat, String noHp, String kelompokTani
});




}
/// @nodoc
class _$PetaniFormSubmittedCopyWithImpl<$Res>
    implements $PetaniFormSubmittedCopyWith<$Res> {
  _$PetaniFormSubmittedCopyWithImpl(this._self, this._then);

  final PetaniFormSubmitted _self;
  final $Res Function(PetaniFormSubmitted) _then;

/// Create a copy of PetaniFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nik = null,Object? nama = null,Object? alamat = null,Object? noHp = null,Object? kelompokTani = null,}) {
  return _then(PetaniFormSubmitted(
nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,nama: null == nama ? _self.nama : nama // ignore: cast_nullable_to_non_nullable
as String,alamat: null == alamat ? _self.alamat : alamat // ignore: cast_nullable_to_non_nullable
as String,noHp: null == noHp ? _self.noHp : noHp // ignore: cast_nullable_to_non_nullable
as String,kelompokTani: null == kelompokTani ? _self.kelompokTani : kelompokTani // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
