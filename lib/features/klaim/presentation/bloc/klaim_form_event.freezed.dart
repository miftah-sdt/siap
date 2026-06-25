// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'klaim_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KlaimFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KlaimFormEvent()';
}


}

/// @nodoc
class $KlaimFormEventCopyWith<$Res>  {
$KlaimFormEventCopyWith(KlaimFormEvent _, $Res Function(KlaimFormEvent) __);
}


/// Adds pattern-matching-related methods to [KlaimFormEvent].
extension KlaimFormEventPatterns on KlaimFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( KlaimFormStarted value)?  started,TResult Function( KlaimFormSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case KlaimFormStarted() when started != null:
return started(_that);case KlaimFormSubmitted() when submitted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( KlaimFormStarted value)  started,required TResult Function( KlaimFormSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case KlaimFormStarted():
return started(_that);case KlaimFormSubmitted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( KlaimFormStarted value)?  started,TResult? Function( KlaimFormSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case KlaimFormStarted() when started != null:
return started(_that);case KlaimFormSubmitted() when submitted != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Klaim? klaim)?  started,TResult Function( String nomorKlaim,  String polisId,  String polisNomor,  String deskripsi,  List<String> buktiKerusakan)?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case KlaimFormStarted() when started != null:
return started(_that.klaim);case KlaimFormSubmitted() when submitted != null:
return submitted(_that.nomorKlaim,_that.polisId,_that.polisNomor,_that.deskripsi,_that.buktiKerusakan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Klaim? klaim)  started,required TResult Function( String nomorKlaim,  String polisId,  String polisNomor,  String deskripsi,  List<String> buktiKerusakan)  submitted,}) {final _that = this;
switch (_that) {
case KlaimFormStarted():
return started(_that.klaim);case KlaimFormSubmitted():
return submitted(_that.nomorKlaim,_that.polisId,_that.polisNomor,_that.deskripsi,_that.buktiKerusakan);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Klaim? klaim)?  started,TResult? Function( String nomorKlaim,  String polisId,  String polisNomor,  String deskripsi,  List<String> buktiKerusakan)?  submitted,}) {final _that = this;
switch (_that) {
case KlaimFormStarted() when started != null:
return started(_that.klaim);case KlaimFormSubmitted() when submitted != null:
return submitted(_that.nomorKlaim,_that.polisId,_that.polisNomor,_that.deskripsi,_that.buktiKerusakan);case _:
  return null;

}
}

}

/// @nodoc


class KlaimFormStarted implements KlaimFormEvent {
  const KlaimFormStarted({this.klaim});
  

 final  Klaim? klaim;

/// Create a copy of KlaimFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KlaimFormStartedCopyWith<KlaimFormStarted> get copyWith => _$KlaimFormStartedCopyWithImpl<KlaimFormStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimFormStarted&&(identical(other.klaim, klaim) || other.klaim == klaim));
}


@override
int get hashCode => Object.hash(runtimeType,klaim);

@override
String toString() {
  return 'KlaimFormEvent.started(klaim: $klaim)';
}


}

/// @nodoc
abstract mixin class $KlaimFormStartedCopyWith<$Res> implements $KlaimFormEventCopyWith<$Res> {
  factory $KlaimFormStartedCopyWith(KlaimFormStarted value, $Res Function(KlaimFormStarted) _then) = _$KlaimFormStartedCopyWithImpl;
@useResult
$Res call({
 Klaim? klaim
});




}
/// @nodoc
class _$KlaimFormStartedCopyWithImpl<$Res>
    implements $KlaimFormStartedCopyWith<$Res> {
  _$KlaimFormStartedCopyWithImpl(this._self, this._then);

  final KlaimFormStarted _self;
  final $Res Function(KlaimFormStarted) _then;

/// Create a copy of KlaimFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? klaim = freezed,}) {
  return _then(KlaimFormStarted(
klaim: freezed == klaim ? _self.klaim : klaim // ignore: cast_nullable_to_non_nullable
as Klaim?,
  ));
}


}

/// @nodoc


class KlaimFormSubmitted implements KlaimFormEvent {
  const KlaimFormSubmitted({required this.nomorKlaim, required this.polisId, required this.polisNomor, required this.deskripsi, required final  List<String> buktiKerusakan}): _buktiKerusakan = buktiKerusakan;
  

 final  String nomorKlaim;
 final  String polisId;
 final  String polisNomor;
 final  String deskripsi;
 final  List<String> _buktiKerusakan;
 List<String> get buktiKerusakan {
  if (_buktiKerusakan is EqualUnmodifiableListView) return _buktiKerusakan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_buktiKerusakan);
}


/// Create a copy of KlaimFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KlaimFormSubmittedCopyWith<KlaimFormSubmitted> get copyWith => _$KlaimFormSubmittedCopyWithImpl<KlaimFormSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimFormSubmitted&&(identical(other.nomorKlaim, nomorKlaim) || other.nomorKlaim == nomorKlaim)&&(identical(other.polisId, polisId) || other.polisId == polisId)&&(identical(other.polisNomor, polisNomor) || other.polisNomor == polisNomor)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&const DeepCollectionEquality().equals(other._buktiKerusakan, _buktiKerusakan));
}


@override
int get hashCode => Object.hash(runtimeType,nomorKlaim,polisId,polisNomor,deskripsi,const DeepCollectionEquality().hash(_buktiKerusakan));

@override
String toString() {
  return 'KlaimFormEvent.submitted(nomorKlaim: $nomorKlaim, polisId: $polisId, polisNomor: $polisNomor, deskripsi: $deskripsi, buktiKerusakan: $buktiKerusakan)';
}


}

/// @nodoc
abstract mixin class $KlaimFormSubmittedCopyWith<$Res> implements $KlaimFormEventCopyWith<$Res> {
  factory $KlaimFormSubmittedCopyWith(KlaimFormSubmitted value, $Res Function(KlaimFormSubmitted) _then) = _$KlaimFormSubmittedCopyWithImpl;
@useResult
$Res call({
 String nomorKlaim, String polisId, String polisNomor, String deskripsi, List<String> buktiKerusakan
});




}
/// @nodoc
class _$KlaimFormSubmittedCopyWithImpl<$Res>
    implements $KlaimFormSubmittedCopyWith<$Res> {
  _$KlaimFormSubmittedCopyWithImpl(this._self, this._then);

  final KlaimFormSubmitted _self;
  final $Res Function(KlaimFormSubmitted) _then;

/// Create a copy of KlaimFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nomorKlaim = null,Object? polisId = null,Object? polisNomor = null,Object? deskripsi = null,Object? buktiKerusakan = null,}) {
  return _then(KlaimFormSubmitted(
nomorKlaim: null == nomorKlaim ? _self.nomorKlaim : nomorKlaim // ignore: cast_nullable_to_non_nullable
as String,polisId: null == polisId ? _self.polisId : polisId // ignore: cast_nullable_to_non_nullable
as String,polisNomor: null == polisNomor ? _self.polisNomor : polisNomor // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,buktiKerusakan: null == buktiKerusakan ? _self._buktiKerusakan : buktiKerusakan // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
