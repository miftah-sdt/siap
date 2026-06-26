// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asuransi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AsuransiModel {

 String get id;@JsonKey(name: 'nomor_polis') String get nomorPolis;@JsonKey(name: 'petani_id') String get petaniId;@JsonKey(name: 'petani_nama') String get petaniNama;@JsonKey(name: 'lahan_id') String get lahanId;@JsonKey(name: 'lahan_nama') String get lahanNama; String get status; List<String> get documents;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'risk_score') int? get riskScore;@JsonKey(name: 'risk_level') String? get riskLevel;@JsonKey(name: 'score_factors') List<dynamic>? get scoreFactorsRaw;@JsonKey(name: 'scored_at') String? get scoredAt;@JsonKey(name: 'askrindo_ref') String? get askrindoRef;@JsonKey(name: 'askrindo_status') String? get askrindoStatus;
/// Create a copy of AsuransiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsuransiModelCopyWith<AsuransiModel> get copyWith => _$AsuransiModelCopyWithImpl<AsuransiModel>(this as AsuransiModel, _$identity);

  /// Serializes this AsuransiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nomorPolis, nomorPolis) || other.nomorPolis == nomorPolis)&&(identical(other.petaniId, petaniId) || other.petaniId == petaniId)&&(identical(other.petaniNama, petaniNama) || other.petaniNama == petaniNama)&&(identical(other.lahanId, lahanId) || other.lahanId == lahanId)&&(identical(other.lahanNama, lahanNama) || other.lahanNama == lahanNama)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.documents, documents)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.riskScore, riskScore) || other.riskScore == riskScore)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&const DeepCollectionEquality().equals(other.scoreFactorsRaw, scoreFactorsRaw)&&(identical(other.scoredAt, scoredAt) || other.scoredAt == scoredAt)&&(identical(other.askrindoRef, askrindoRef) || other.askrindoRef == askrindoRef)&&(identical(other.askrindoStatus, askrindoStatus) || other.askrindoStatus == askrindoStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nomorPolis,petaniId,petaniNama,lahanId,lahanNama,status,const DeepCollectionEquality().hash(documents),createdAt,riskScore,riskLevel,const DeepCollectionEquality().hash(scoreFactorsRaw),scoredAt,askrindoRef,askrindoStatus);

@override
String toString() {
  return 'AsuransiModel(id: $id, nomorPolis: $nomorPolis, petaniId: $petaniId, petaniNama: $petaniNama, lahanId: $lahanId, lahanNama: $lahanNama, status: $status, documents: $documents, createdAt: $createdAt, riskScore: $riskScore, riskLevel: $riskLevel, scoreFactorsRaw: $scoreFactorsRaw, scoredAt: $scoredAt, askrindoRef: $askrindoRef, askrindoStatus: $askrindoStatus)';
}


}

/// @nodoc
abstract mixin class $AsuransiModelCopyWith<$Res>  {
  factory $AsuransiModelCopyWith(AsuransiModel value, $Res Function(AsuransiModel) _then) = _$AsuransiModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'nomor_polis') String nomorPolis,@JsonKey(name: 'petani_id') String petaniId,@JsonKey(name: 'petani_nama') String petaniNama,@JsonKey(name: 'lahan_id') String lahanId,@JsonKey(name: 'lahan_nama') String lahanNama, String status, List<String> documents,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'risk_score') int? riskScore,@JsonKey(name: 'risk_level') String? riskLevel,@JsonKey(name: 'score_factors') List<dynamic>? scoreFactorsRaw,@JsonKey(name: 'scored_at') String? scoredAt,@JsonKey(name: 'askrindo_ref') String? askrindoRef,@JsonKey(name: 'askrindo_status') String? askrindoStatus
});




}
/// @nodoc
class _$AsuransiModelCopyWithImpl<$Res>
    implements $AsuransiModelCopyWith<$Res> {
  _$AsuransiModelCopyWithImpl(this._self, this._then);

  final AsuransiModel _self;
  final $Res Function(AsuransiModel) _then;

/// Create a copy of AsuransiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nomorPolis = null,Object? petaniId = null,Object? petaniNama = null,Object? lahanId = null,Object? lahanNama = null,Object? status = null,Object? documents = null,Object? createdAt = null,Object? riskScore = freezed,Object? riskLevel = freezed,Object? scoreFactorsRaw = freezed,Object? scoredAt = freezed,Object? askrindoRef = freezed,Object? askrindoStatus = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nomorPolis: null == nomorPolis ? _self.nomorPolis : nomorPolis // ignore: cast_nullable_to_non_nullable
as String,petaniId: null == petaniId ? _self.petaniId : petaniId // ignore: cast_nullable_to_non_nullable
as String,petaniNama: null == petaniNama ? _self.petaniNama : petaniNama // ignore: cast_nullable_to_non_nullable
as String,lahanId: null == lahanId ? _self.lahanId : lahanId // ignore: cast_nullable_to_non_nullable
as String,lahanNama: null == lahanNama ? _self.lahanNama : lahanNama // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,riskScore: freezed == riskScore ? _self.riskScore : riskScore // ignore: cast_nullable_to_non_nullable
as int?,riskLevel: freezed == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String?,scoreFactorsRaw: freezed == scoreFactorsRaw ? _self.scoreFactorsRaw : scoreFactorsRaw // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,scoredAt: freezed == scoredAt ? _self.scoredAt : scoredAt // ignore: cast_nullable_to_non_nullable
as String?,askrindoRef: freezed == askrindoRef ? _self.askrindoRef : askrindoRef // ignore: cast_nullable_to_non_nullable
as String?,askrindoStatus: freezed == askrindoStatus ? _self.askrindoStatus : askrindoStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AsuransiModel].
extension AsuransiModelPatterns on AsuransiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AsuransiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AsuransiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AsuransiModel value)  $default,){
final _that = this;
switch (_that) {
case _AsuransiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AsuransiModel value)?  $default,){
final _that = this;
switch (_that) {
case _AsuransiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'nomor_polis')  String nomorPolis, @JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'lahan_id')  String lahanId, @JsonKey(name: 'lahan_nama')  String lahanNama,  String status,  List<String> documents, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'risk_score')  int? riskScore, @JsonKey(name: 'risk_level')  String? riskLevel, @JsonKey(name: 'score_factors')  List<dynamic>? scoreFactorsRaw, @JsonKey(name: 'scored_at')  String? scoredAt, @JsonKey(name: 'askrindo_ref')  String? askrindoRef, @JsonKey(name: 'askrindo_status')  String? askrindoStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AsuransiModel() when $default != null:
return $default(_that.id,_that.nomorPolis,_that.petaniId,_that.petaniNama,_that.lahanId,_that.lahanNama,_that.status,_that.documents,_that.createdAt,_that.riskScore,_that.riskLevel,_that.scoreFactorsRaw,_that.scoredAt,_that.askrindoRef,_that.askrindoStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'nomor_polis')  String nomorPolis, @JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'lahan_id')  String lahanId, @JsonKey(name: 'lahan_nama')  String lahanNama,  String status,  List<String> documents, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'risk_score')  int? riskScore, @JsonKey(name: 'risk_level')  String? riskLevel, @JsonKey(name: 'score_factors')  List<dynamic>? scoreFactorsRaw, @JsonKey(name: 'scored_at')  String? scoredAt, @JsonKey(name: 'askrindo_ref')  String? askrindoRef, @JsonKey(name: 'askrindo_status')  String? askrindoStatus)  $default,) {final _that = this;
switch (_that) {
case _AsuransiModel():
return $default(_that.id,_that.nomorPolis,_that.petaniId,_that.petaniNama,_that.lahanId,_that.lahanNama,_that.status,_that.documents,_that.createdAt,_that.riskScore,_that.riskLevel,_that.scoreFactorsRaw,_that.scoredAt,_that.askrindoRef,_that.askrindoStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'nomor_polis')  String nomorPolis, @JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'lahan_id')  String lahanId, @JsonKey(name: 'lahan_nama')  String lahanNama,  String status,  List<String> documents, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'risk_score')  int? riskScore, @JsonKey(name: 'risk_level')  String? riskLevel, @JsonKey(name: 'score_factors')  List<dynamic>? scoreFactorsRaw, @JsonKey(name: 'scored_at')  String? scoredAt, @JsonKey(name: 'askrindo_ref')  String? askrindoRef, @JsonKey(name: 'askrindo_status')  String? askrindoStatus)?  $default,) {final _that = this;
switch (_that) {
case _AsuransiModel() when $default != null:
return $default(_that.id,_that.nomorPolis,_that.petaniId,_that.petaniNama,_that.lahanId,_that.lahanNama,_that.status,_that.documents,_that.createdAt,_that.riskScore,_that.riskLevel,_that.scoreFactorsRaw,_that.scoredAt,_that.askrindoRef,_that.askrindoStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AsuransiModel extends AsuransiModel {
  const _AsuransiModel({required this.id, @JsonKey(name: 'nomor_polis') required this.nomorPolis, @JsonKey(name: 'petani_id') required this.petaniId, @JsonKey(name: 'petani_nama') required this.petaniNama, @JsonKey(name: 'lahan_id') required this.lahanId, @JsonKey(name: 'lahan_nama') required this.lahanNama, required this.status, required final  List<String> documents, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'risk_score') this.riskScore, @JsonKey(name: 'risk_level') this.riskLevel, @JsonKey(name: 'score_factors') final  List<dynamic>? scoreFactorsRaw, @JsonKey(name: 'scored_at') this.scoredAt, @JsonKey(name: 'askrindo_ref') this.askrindoRef, @JsonKey(name: 'askrindo_status') this.askrindoStatus}): _documents = documents,_scoreFactorsRaw = scoreFactorsRaw,super._();
  factory _AsuransiModel.fromJson(Map<String, dynamic> json) => _$AsuransiModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'nomor_polis') final  String nomorPolis;
@override@JsonKey(name: 'petani_id') final  String petaniId;
@override@JsonKey(name: 'petani_nama') final  String petaniNama;
@override@JsonKey(name: 'lahan_id') final  String lahanId;
@override@JsonKey(name: 'lahan_nama') final  String lahanNama;
@override final  String status;
 final  List<String> _documents;
@override List<String> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'risk_score') final  int? riskScore;
@override@JsonKey(name: 'risk_level') final  String? riskLevel;
 final  List<dynamic>? _scoreFactorsRaw;
@override@JsonKey(name: 'score_factors') List<dynamic>? get scoreFactorsRaw {
  final value = _scoreFactorsRaw;
  if (value == null) return null;
  if (_scoreFactorsRaw is EqualUnmodifiableListView) return _scoreFactorsRaw;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'scored_at') final  String? scoredAt;
@override@JsonKey(name: 'askrindo_ref') final  String? askrindoRef;
@override@JsonKey(name: 'askrindo_status') final  String? askrindoStatus;

/// Create a copy of AsuransiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AsuransiModelCopyWith<_AsuransiModel> get copyWith => __$AsuransiModelCopyWithImpl<_AsuransiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AsuransiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AsuransiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nomorPolis, nomorPolis) || other.nomorPolis == nomorPolis)&&(identical(other.petaniId, petaniId) || other.petaniId == petaniId)&&(identical(other.petaniNama, petaniNama) || other.petaniNama == petaniNama)&&(identical(other.lahanId, lahanId) || other.lahanId == lahanId)&&(identical(other.lahanNama, lahanNama) || other.lahanNama == lahanNama)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._documents, _documents)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.riskScore, riskScore) || other.riskScore == riskScore)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&const DeepCollectionEquality().equals(other._scoreFactorsRaw, _scoreFactorsRaw)&&(identical(other.scoredAt, scoredAt) || other.scoredAt == scoredAt)&&(identical(other.askrindoRef, askrindoRef) || other.askrindoRef == askrindoRef)&&(identical(other.askrindoStatus, askrindoStatus) || other.askrindoStatus == askrindoStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nomorPolis,petaniId,petaniNama,lahanId,lahanNama,status,const DeepCollectionEquality().hash(_documents),createdAt,riskScore,riskLevel,const DeepCollectionEquality().hash(_scoreFactorsRaw),scoredAt,askrindoRef,askrindoStatus);

@override
String toString() {
  return 'AsuransiModel(id: $id, nomorPolis: $nomorPolis, petaniId: $petaniId, petaniNama: $petaniNama, lahanId: $lahanId, lahanNama: $lahanNama, status: $status, documents: $documents, createdAt: $createdAt, riskScore: $riskScore, riskLevel: $riskLevel, scoreFactorsRaw: $scoreFactorsRaw, scoredAt: $scoredAt, askrindoRef: $askrindoRef, askrindoStatus: $askrindoStatus)';
}


}

/// @nodoc
abstract mixin class _$AsuransiModelCopyWith<$Res> implements $AsuransiModelCopyWith<$Res> {
  factory _$AsuransiModelCopyWith(_AsuransiModel value, $Res Function(_AsuransiModel) _then) = __$AsuransiModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'nomor_polis') String nomorPolis,@JsonKey(name: 'petani_id') String petaniId,@JsonKey(name: 'petani_nama') String petaniNama,@JsonKey(name: 'lahan_id') String lahanId,@JsonKey(name: 'lahan_nama') String lahanNama, String status, List<String> documents,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'risk_score') int? riskScore,@JsonKey(name: 'risk_level') String? riskLevel,@JsonKey(name: 'score_factors') List<dynamic>? scoreFactorsRaw,@JsonKey(name: 'scored_at') String? scoredAt,@JsonKey(name: 'askrindo_ref') String? askrindoRef,@JsonKey(name: 'askrindo_status') String? askrindoStatus
});




}
/// @nodoc
class __$AsuransiModelCopyWithImpl<$Res>
    implements _$AsuransiModelCopyWith<$Res> {
  __$AsuransiModelCopyWithImpl(this._self, this._then);

  final _AsuransiModel _self;
  final $Res Function(_AsuransiModel) _then;

/// Create a copy of AsuransiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nomorPolis = null,Object? petaniId = null,Object? petaniNama = null,Object? lahanId = null,Object? lahanNama = null,Object? status = null,Object? documents = null,Object? createdAt = null,Object? riskScore = freezed,Object? riskLevel = freezed,Object? scoreFactorsRaw = freezed,Object? scoredAt = freezed,Object? askrindoRef = freezed,Object? askrindoStatus = freezed,}) {
  return _then(_AsuransiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nomorPolis: null == nomorPolis ? _self.nomorPolis : nomorPolis // ignore: cast_nullable_to_non_nullable
as String,petaniId: null == petaniId ? _self.petaniId : petaniId // ignore: cast_nullable_to_non_nullable
as String,petaniNama: null == petaniNama ? _self.petaniNama : petaniNama // ignore: cast_nullable_to_non_nullable
as String,lahanId: null == lahanId ? _self.lahanId : lahanId // ignore: cast_nullable_to_non_nullable
as String,lahanNama: null == lahanNama ? _self.lahanNama : lahanNama // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,riskScore: freezed == riskScore ? _self.riskScore : riskScore // ignore: cast_nullable_to_non_nullable
as int?,riskLevel: freezed == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String?,scoreFactorsRaw: freezed == scoreFactorsRaw ? _self._scoreFactorsRaw : scoreFactorsRaw // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,scoredAt: freezed == scoredAt ? _self.scoredAt : scoredAt // ignore: cast_nullable_to_non_nullable
as String?,askrindoRef: freezed == askrindoRef ? _self.askrindoRef : askrindoRef // ignore: cast_nullable_to_non_nullable
as String?,askrindoStatus: freezed == askrindoStatus ? _self.askrindoStatus : askrindoStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AsuransiRequestModel {

@JsonKey(name: 'nomor_polis') String get nomorPolis;@JsonKey(name: 'petani_id') String get petaniId;@JsonKey(name: 'petani_nama') String get petaniNama;@JsonKey(name: 'lahan_id') String get lahanId;@JsonKey(name: 'lahan_nama') String get lahanNama; List<String> get documents;
/// Create a copy of AsuransiRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsuransiRequestModelCopyWith<AsuransiRequestModel> get copyWith => _$AsuransiRequestModelCopyWithImpl<AsuransiRequestModel>(this as AsuransiRequestModel, _$identity);

  /// Serializes this AsuransiRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiRequestModel&&(identical(other.nomorPolis, nomorPolis) || other.nomorPolis == nomorPolis)&&(identical(other.petaniId, petaniId) || other.petaniId == petaniId)&&(identical(other.petaniNama, petaniNama) || other.petaniNama == petaniNama)&&(identical(other.lahanId, lahanId) || other.lahanId == lahanId)&&(identical(other.lahanNama, lahanNama) || other.lahanNama == lahanNama)&&const DeepCollectionEquality().equals(other.documents, documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nomorPolis,petaniId,petaniNama,lahanId,lahanNama,const DeepCollectionEquality().hash(documents));

@override
String toString() {
  return 'AsuransiRequestModel(nomorPolis: $nomorPolis, petaniId: $petaniId, petaniNama: $petaniNama, lahanId: $lahanId, lahanNama: $lahanNama, documents: $documents)';
}


}

/// @nodoc
abstract mixin class $AsuransiRequestModelCopyWith<$Res>  {
  factory $AsuransiRequestModelCopyWith(AsuransiRequestModel value, $Res Function(AsuransiRequestModel) _then) = _$AsuransiRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'nomor_polis') String nomorPolis,@JsonKey(name: 'petani_id') String petaniId,@JsonKey(name: 'petani_nama') String petaniNama,@JsonKey(name: 'lahan_id') String lahanId,@JsonKey(name: 'lahan_nama') String lahanNama, List<String> documents
});




}
/// @nodoc
class _$AsuransiRequestModelCopyWithImpl<$Res>
    implements $AsuransiRequestModelCopyWith<$Res> {
  _$AsuransiRequestModelCopyWithImpl(this._self, this._then);

  final AsuransiRequestModel _self;
  final $Res Function(AsuransiRequestModel) _then;

/// Create a copy of AsuransiRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nomorPolis = null,Object? petaniId = null,Object? petaniNama = null,Object? lahanId = null,Object? lahanNama = null,Object? documents = null,}) {
  return _then(_self.copyWith(
nomorPolis: null == nomorPolis ? _self.nomorPolis : nomorPolis // ignore: cast_nullable_to_non_nullable
as String,petaniId: null == petaniId ? _self.petaniId : petaniId // ignore: cast_nullable_to_non_nullable
as String,petaniNama: null == petaniNama ? _self.petaniNama : petaniNama // ignore: cast_nullable_to_non_nullable
as String,lahanId: null == lahanId ? _self.lahanId : lahanId // ignore: cast_nullable_to_non_nullable
as String,lahanNama: null == lahanNama ? _self.lahanNama : lahanNama // ignore: cast_nullable_to_non_nullable
as String,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AsuransiRequestModel].
extension AsuransiRequestModelPatterns on AsuransiRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AsuransiRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AsuransiRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AsuransiRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _AsuransiRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AsuransiRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _AsuransiRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'nomor_polis')  String nomorPolis, @JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'lahan_id')  String lahanId, @JsonKey(name: 'lahan_nama')  String lahanNama,  List<String> documents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AsuransiRequestModel() when $default != null:
return $default(_that.nomorPolis,_that.petaniId,_that.petaniNama,_that.lahanId,_that.lahanNama,_that.documents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'nomor_polis')  String nomorPolis, @JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'lahan_id')  String lahanId, @JsonKey(name: 'lahan_nama')  String lahanNama,  List<String> documents)  $default,) {final _that = this;
switch (_that) {
case _AsuransiRequestModel():
return $default(_that.nomorPolis,_that.petaniId,_that.petaniNama,_that.lahanId,_that.lahanNama,_that.documents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'nomor_polis')  String nomorPolis, @JsonKey(name: 'petani_id')  String petaniId, @JsonKey(name: 'petani_nama')  String petaniNama, @JsonKey(name: 'lahan_id')  String lahanId, @JsonKey(name: 'lahan_nama')  String lahanNama,  List<String> documents)?  $default,) {final _that = this;
switch (_that) {
case _AsuransiRequestModel() when $default != null:
return $default(_that.nomorPolis,_that.petaniId,_that.petaniNama,_that.lahanId,_that.lahanNama,_that.documents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AsuransiRequestModel implements AsuransiRequestModel {
  const _AsuransiRequestModel({@JsonKey(name: 'nomor_polis') required this.nomorPolis, @JsonKey(name: 'petani_id') required this.petaniId, @JsonKey(name: 'petani_nama') required this.petaniNama, @JsonKey(name: 'lahan_id') required this.lahanId, @JsonKey(name: 'lahan_nama') required this.lahanNama, required final  List<String> documents}): _documents = documents;
  factory _AsuransiRequestModel.fromJson(Map<String, dynamic> json) => _$AsuransiRequestModelFromJson(json);

@override@JsonKey(name: 'nomor_polis') final  String nomorPolis;
@override@JsonKey(name: 'petani_id') final  String petaniId;
@override@JsonKey(name: 'petani_nama') final  String petaniNama;
@override@JsonKey(name: 'lahan_id') final  String lahanId;
@override@JsonKey(name: 'lahan_nama') final  String lahanNama;
 final  List<String> _documents;
@override List<String> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}


/// Create a copy of AsuransiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AsuransiRequestModelCopyWith<_AsuransiRequestModel> get copyWith => __$AsuransiRequestModelCopyWithImpl<_AsuransiRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AsuransiRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AsuransiRequestModel&&(identical(other.nomorPolis, nomorPolis) || other.nomorPolis == nomorPolis)&&(identical(other.petaniId, petaniId) || other.petaniId == petaniId)&&(identical(other.petaniNama, petaniNama) || other.petaniNama == petaniNama)&&(identical(other.lahanId, lahanId) || other.lahanId == lahanId)&&(identical(other.lahanNama, lahanNama) || other.lahanNama == lahanNama)&&const DeepCollectionEquality().equals(other._documents, _documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nomorPolis,petaniId,petaniNama,lahanId,lahanNama,const DeepCollectionEquality().hash(_documents));

@override
String toString() {
  return 'AsuransiRequestModel(nomorPolis: $nomorPolis, petaniId: $petaniId, petaniNama: $petaniNama, lahanId: $lahanId, lahanNama: $lahanNama, documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$AsuransiRequestModelCopyWith<$Res> implements $AsuransiRequestModelCopyWith<$Res> {
  factory _$AsuransiRequestModelCopyWith(_AsuransiRequestModel value, $Res Function(_AsuransiRequestModel) _then) = __$AsuransiRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'nomor_polis') String nomorPolis,@JsonKey(name: 'petani_id') String petaniId,@JsonKey(name: 'petani_nama') String petaniNama,@JsonKey(name: 'lahan_id') String lahanId,@JsonKey(name: 'lahan_nama') String lahanNama, List<String> documents
});




}
/// @nodoc
class __$AsuransiRequestModelCopyWithImpl<$Res>
    implements _$AsuransiRequestModelCopyWith<$Res> {
  __$AsuransiRequestModelCopyWithImpl(this._self, this._then);

  final _AsuransiRequestModel _self;
  final $Res Function(_AsuransiRequestModel) _then;

/// Create a copy of AsuransiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nomorPolis = null,Object? petaniId = null,Object? petaniNama = null,Object? lahanId = null,Object? lahanNama = null,Object? documents = null,}) {
  return _then(_AsuransiRequestModel(
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
