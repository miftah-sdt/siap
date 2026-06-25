// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asuransi_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsuransiFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiFormEvent()';
}


}

/// @nodoc
class $AsuransiFormEventCopyWith<$Res>  {
$AsuransiFormEventCopyWith(AsuransiFormEvent _, $Res Function(AsuransiFormEvent) __);
}


/// Adds pattern-matching-related methods to [AsuransiFormEvent].
extension AsuransiFormEventPatterns on AsuransiFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AsuransiFormStarted value)?  started,TResult Function( AsuransiFormSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AsuransiFormStarted() when started != null:
return started(_that);case AsuransiFormSubmitted() when submitted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AsuransiFormStarted value)  started,required TResult Function( AsuransiFormSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case AsuransiFormStarted():
return started(_that);case AsuransiFormSubmitted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AsuransiFormStarted value)?  started,TResult? Function( AsuransiFormSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case AsuransiFormStarted() when started != null:
return started(_that);case AsuransiFormSubmitted() when submitted != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Asuransi? asuransi)?  started,TResult Function( String nomorPolis,  String petaniId,  String petaniNama,  String lahanId,  String lahanNama,  List<String> documents)?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AsuransiFormStarted() when started != null:
return started(_that.asuransi);case AsuransiFormSubmitted() when submitted != null:
return submitted(_that.nomorPolis,_that.petaniId,_that.petaniNama,_that.lahanId,_that.lahanNama,_that.documents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Asuransi? asuransi)  started,required TResult Function( String nomorPolis,  String petaniId,  String petaniNama,  String lahanId,  String lahanNama,  List<String> documents)  submitted,}) {final _that = this;
switch (_that) {
case AsuransiFormStarted():
return started(_that.asuransi);case AsuransiFormSubmitted():
return submitted(_that.nomorPolis,_that.petaniId,_that.petaniNama,_that.lahanId,_that.lahanNama,_that.documents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Asuransi? asuransi)?  started,TResult? Function( String nomorPolis,  String petaniId,  String petaniNama,  String lahanId,  String lahanNama,  List<String> documents)?  submitted,}) {final _that = this;
switch (_that) {
case AsuransiFormStarted() when started != null:
return started(_that.asuransi);case AsuransiFormSubmitted() when submitted != null:
return submitted(_that.nomorPolis,_that.petaniId,_that.petaniNama,_that.lahanId,_that.lahanNama,_that.documents);case _:
  return null;

}
}

}

/// @nodoc


class AsuransiFormStarted implements AsuransiFormEvent {
  const AsuransiFormStarted({this.asuransi});
  

 final  Asuransi? asuransi;

/// Create a copy of AsuransiFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsuransiFormStartedCopyWith<AsuransiFormStarted> get copyWith => _$AsuransiFormStartedCopyWithImpl<AsuransiFormStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiFormStarted&&(identical(other.asuransi, asuransi) || other.asuransi == asuransi));
}


@override
int get hashCode => Object.hash(runtimeType,asuransi);

@override
String toString() {
  return 'AsuransiFormEvent.started(asuransi: $asuransi)';
}


}

/// @nodoc
abstract mixin class $AsuransiFormStartedCopyWith<$Res> implements $AsuransiFormEventCopyWith<$Res> {
  factory $AsuransiFormStartedCopyWith(AsuransiFormStarted value, $Res Function(AsuransiFormStarted) _then) = _$AsuransiFormStartedCopyWithImpl;
@useResult
$Res call({
 Asuransi? asuransi
});




}
/// @nodoc
class _$AsuransiFormStartedCopyWithImpl<$Res>
    implements $AsuransiFormStartedCopyWith<$Res> {
  _$AsuransiFormStartedCopyWithImpl(this._self, this._then);

  final AsuransiFormStarted _self;
  final $Res Function(AsuransiFormStarted) _then;

/// Create a copy of AsuransiFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? asuransi = freezed,}) {
  return _then(AsuransiFormStarted(
asuransi: freezed == asuransi ? _self.asuransi : asuransi // ignore: cast_nullable_to_non_nullable
as Asuransi?,
  ));
}


}

/// @nodoc


class AsuransiFormSubmitted implements AsuransiFormEvent {
  const AsuransiFormSubmitted({required this.nomorPolis, required this.petaniId, required this.petaniNama, required this.lahanId, required this.lahanNama, required final  List<String> documents}): _documents = documents;
  

 final  String nomorPolis;
 final  String petaniId;
 final  String petaniNama;
 final  String lahanId;
 final  String lahanNama;
 final  List<String> _documents;
 List<String> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}


/// Create a copy of AsuransiFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsuransiFormSubmittedCopyWith<AsuransiFormSubmitted> get copyWith => _$AsuransiFormSubmittedCopyWithImpl<AsuransiFormSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiFormSubmitted&&(identical(other.nomorPolis, nomorPolis) || other.nomorPolis == nomorPolis)&&(identical(other.petaniId, petaniId) || other.petaniId == petaniId)&&(identical(other.petaniNama, petaniNama) || other.petaniNama == petaniNama)&&(identical(other.lahanId, lahanId) || other.lahanId == lahanId)&&(identical(other.lahanNama, lahanNama) || other.lahanNama == lahanNama)&&const DeepCollectionEquality().equals(other._documents, _documents));
}


@override
int get hashCode => Object.hash(runtimeType,nomorPolis,petaniId,petaniNama,lahanId,lahanNama,const DeepCollectionEquality().hash(_documents));

@override
String toString() {
  return 'AsuransiFormEvent.submitted(nomorPolis: $nomorPolis, petaniId: $petaniId, petaniNama: $petaniNama, lahanId: $lahanId, lahanNama: $lahanNama, documents: $documents)';
}


}

/// @nodoc
abstract mixin class $AsuransiFormSubmittedCopyWith<$Res> implements $AsuransiFormEventCopyWith<$Res> {
  factory $AsuransiFormSubmittedCopyWith(AsuransiFormSubmitted value, $Res Function(AsuransiFormSubmitted) _then) = _$AsuransiFormSubmittedCopyWithImpl;
@useResult
$Res call({
 String nomorPolis, String petaniId, String petaniNama, String lahanId, String lahanNama, List<String> documents
});




}
/// @nodoc
class _$AsuransiFormSubmittedCopyWithImpl<$Res>
    implements $AsuransiFormSubmittedCopyWith<$Res> {
  _$AsuransiFormSubmittedCopyWithImpl(this._self, this._then);

  final AsuransiFormSubmitted _self;
  final $Res Function(AsuransiFormSubmitted) _then;

/// Create a copy of AsuransiFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nomorPolis = null,Object? petaniId = null,Object? petaniNama = null,Object? lahanId = null,Object? lahanNama = null,Object? documents = null,}) {
  return _then(AsuransiFormSubmitted(
nomorPolis: null == nomorPolis ? _self.nomorPolis : nomorPolis // ignore: cast_nullable_to_non_nullable
as String,petaniId: null == petaniId ? _self.petaniId : petaniId // ignore: cast_nullable_to_non_nullable
as String,petaniNama: null == petaniNama ? _self.petaniNama : petaniNama // ignore: cast_nullable_to_non_nullable
as String,lahanId: null == lahanId ? _self.lahanId : lahanId // ignore: cast_nullable_to_non_nullable
as String,lahanNama: null == lahanNama ? _self.lahanNama : lahanNama // ignore: cast_nullable_to_non_nullable
as String,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
