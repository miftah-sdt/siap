// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardSummaryModel {

@JsonKey(name: 'total_petani') int get totalPetani;@JsonKey(name: 'total_lahan') int get totalLahan;@JsonKey(name: 'total_polis') int get totalPolis;@JsonKey(name: 'total_klaim') int get totalKlaim;
/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryModelCopyWith<DashboardSummaryModel> get copyWith => _$DashboardSummaryModelCopyWithImpl<DashboardSummaryModel>(this as DashboardSummaryModel, _$identity);

  /// Serializes this DashboardSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummaryModel&&(identical(other.totalPetani, totalPetani) || other.totalPetani == totalPetani)&&(identical(other.totalLahan, totalLahan) || other.totalLahan == totalLahan)&&(identical(other.totalPolis, totalPolis) || other.totalPolis == totalPolis)&&(identical(other.totalKlaim, totalKlaim) || other.totalKlaim == totalKlaim));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPetani,totalLahan,totalPolis,totalKlaim);

@override
String toString() {
  return 'DashboardSummaryModel(totalPetani: $totalPetani, totalLahan: $totalLahan, totalPolis: $totalPolis, totalKlaim: $totalKlaim)';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryModelCopyWith<$Res>  {
  factory $DashboardSummaryModelCopyWith(DashboardSummaryModel value, $Res Function(DashboardSummaryModel) _then) = _$DashboardSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_petani') int totalPetani,@JsonKey(name: 'total_lahan') int totalLahan,@JsonKey(name: 'total_polis') int totalPolis,@JsonKey(name: 'total_klaim') int totalKlaim
});




}
/// @nodoc
class _$DashboardSummaryModelCopyWithImpl<$Res>
    implements $DashboardSummaryModelCopyWith<$Res> {
  _$DashboardSummaryModelCopyWithImpl(this._self, this._then);

  final DashboardSummaryModel _self;
  final $Res Function(DashboardSummaryModel) _then;

/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalPetani = null,Object? totalLahan = null,Object? totalPolis = null,Object? totalKlaim = null,}) {
  return _then(_self.copyWith(
totalPetani: null == totalPetani ? _self.totalPetani : totalPetani // ignore: cast_nullable_to_non_nullable
as int,totalLahan: null == totalLahan ? _self.totalLahan : totalLahan // ignore: cast_nullable_to_non_nullable
as int,totalPolis: null == totalPolis ? _self.totalPolis : totalPolis // ignore: cast_nullable_to_non_nullable
as int,totalKlaim: null == totalKlaim ? _self.totalKlaim : totalKlaim // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardSummaryModel].
extension DashboardSummaryModelPatterns on DashboardSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_petani')  int totalPetani, @JsonKey(name: 'total_lahan')  int totalLahan, @JsonKey(name: 'total_polis')  int totalPolis, @JsonKey(name: 'total_klaim')  int totalKlaim)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
return $default(_that.totalPetani,_that.totalLahan,_that.totalPolis,_that.totalKlaim);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_petani')  int totalPetani, @JsonKey(name: 'total_lahan')  int totalLahan, @JsonKey(name: 'total_polis')  int totalPolis, @JsonKey(name: 'total_klaim')  int totalKlaim)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryModel():
return $default(_that.totalPetani,_that.totalLahan,_that.totalPolis,_that.totalKlaim);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_petani')  int totalPetani, @JsonKey(name: 'total_lahan')  int totalLahan, @JsonKey(name: 'total_polis')  int totalPolis, @JsonKey(name: 'total_klaim')  int totalKlaim)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
return $default(_that.totalPetani,_that.totalLahan,_that.totalPolis,_that.totalKlaim);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardSummaryModel extends DashboardSummaryModel {
  const _DashboardSummaryModel({@JsonKey(name: 'total_petani') required this.totalPetani, @JsonKey(name: 'total_lahan') required this.totalLahan, @JsonKey(name: 'total_polis') required this.totalPolis, @JsonKey(name: 'total_klaim') required this.totalKlaim}): super._();
  factory _DashboardSummaryModel.fromJson(Map<String, dynamic> json) => _$DashboardSummaryModelFromJson(json);

@override@JsonKey(name: 'total_petani') final  int totalPetani;
@override@JsonKey(name: 'total_lahan') final  int totalLahan;
@override@JsonKey(name: 'total_polis') final  int totalPolis;
@override@JsonKey(name: 'total_klaim') final  int totalKlaim;

/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryModelCopyWith<_DashboardSummaryModel> get copyWith => __$DashboardSummaryModelCopyWithImpl<_DashboardSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummaryModel&&(identical(other.totalPetani, totalPetani) || other.totalPetani == totalPetani)&&(identical(other.totalLahan, totalLahan) || other.totalLahan == totalLahan)&&(identical(other.totalPolis, totalPolis) || other.totalPolis == totalPolis)&&(identical(other.totalKlaim, totalKlaim) || other.totalKlaim == totalKlaim));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPetani,totalLahan,totalPolis,totalKlaim);

@override
String toString() {
  return 'DashboardSummaryModel(totalPetani: $totalPetani, totalLahan: $totalLahan, totalPolis: $totalPolis, totalKlaim: $totalKlaim)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryModelCopyWith<$Res> implements $DashboardSummaryModelCopyWith<$Res> {
  factory _$DashboardSummaryModelCopyWith(_DashboardSummaryModel value, $Res Function(_DashboardSummaryModel) _then) = __$DashboardSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_petani') int totalPetani,@JsonKey(name: 'total_lahan') int totalLahan,@JsonKey(name: 'total_polis') int totalPolis,@JsonKey(name: 'total_klaim') int totalKlaim
});




}
/// @nodoc
class __$DashboardSummaryModelCopyWithImpl<$Res>
    implements _$DashboardSummaryModelCopyWith<$Res> {
  __$DashboardSummaryModelCopyWithImpl(this._self, this._then);

  final _DashboardSummaryModel _self;
  final $Res Function(_DashboardSummaryModel) _then;

/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalPetani = null,Object? totalLahan = null,Object? totalPolis = null,Object? totalKlaim = null,}) {
  return _then(_DashboardSummaryModel(
totalPetani: null == totalPetani ? _self.totalPetani : totalPetani // ignore: cast_nullable_to_non_nullable
as int,totalLahan: null == totalLahan ? _self.totalLahan : totalLahan // ignore: cast_nullable_to_non_nullable
as int,totalPolis: null == totalPolis ? _self.totalPolis : totalPolis // ignore: cast_nullable_to_non_nullable
as int,totalKlaim: null == totalKlaim ? _self.totalKlaim : totalKlaim // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChartPointModel {

 String get label; double get value;
/// Create a copy of ChartPointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartPointModelCopyWith<ChartPointModel> get copyWith => _$ChartPointModelCopyWithImpl<ChartPointModel>(this as ChartPointModel, _$identity);

  /// Serializes this ChartPointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartPointModel&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value);

@override
String toString() {
  return 'ChartPointModel(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class $ChartPointModelCopyWith<$Res>  {
  factory $ChartPointModelCopyWith(ChartPointModel value, $Res Function(ChartPointModel) _then) = _$ChartPointModelCopyWithImpl;
@useResult
$Res call({
 String label, double value
});




}
/// @nodoc
class _$ChartPointModelCopyWithImpl<$Res>
    implements $ChartPointModelCopyWith<$Res> {
  _$ChartPointModelCopyWithImpl(this._self, this._then);

  final ChartPointModel _self;
  final $Res Function(ChartPointModel) _then;

/// Create a copy of ChartPointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartPointModel].
extension ChartPointModelPatterns on ChartPointModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartPointModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartPointModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartPointModel value)  $default,){
final _that = this;
switch (_that) {
case _ChartPointModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartPointModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChartPointModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  double value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartPointModel() when $default != null:
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  double value)  $default,) {final _that = this;
switch (_that) {
case _ChartPointModel():
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  double value)?  $default,) {final _that = this;
switch (_that) {
case _ChartPointModel() when $default != null:
return $default(_that.label,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChartPointModel extends ChartPointModel {
  const _ChartPointModel({required this.label, required this.value}): super._();
  factory _ChartPointModel.fromJson(Map<String, dynamic> json) => _$ChartPointModelFromJson(json);

@override final  String label;
@override final  double value;

/// Create a copy of ChartPointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartPointModelCopyWith<_ChartPointModel> get copyWith => __$ChartPointModelCopyWithImpl<_ChartPointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChartPointModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartPointModel&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value);

@override
String toString() {
  return 'ChartPointModel(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ChartPointModelCopyWith<$Res> implements $ChartPointModelCopyWith<$Res> {
  factory _$ChartPointModelCopyWith(_ChartPointModel value, $Res Function(_ChartPointModel) _then) = __$ChartPointModelCopyWithImpl;
@override @useResult
$Res call({
 String label, double value
});




}
/// @nodoc
class __$ChartPointModelCopyWithImpl<$Res>
    implements _$ChartPointModelCopyWith<$Res> {
  __$ChartPointModelCopyWithImpl(this._self, this._then);

  final _ChartPointModel _self;
  final $Res Function(_ChartPointModel) _then;

/// Create a copy of ChartPointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,}) {
  return _then(_ChartPointModel(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DashboardChartsModel {

@JsonKey(name: 'monthly_registrations') List<ChartPointModel> get monthlyRegistrations;@JsonKey(name: 'monthly_claims') List<ChartPointModel> get monthlyClaims;
/// Create a copy of DashboardChartsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardChartsModelCopyWith<DashboardChartsModel> get copyWith => _$DashboardChartsModelCopyWithImpl<DashboardChartsModel>(this as DashboardChartsModel, _$identity);

  /// Serializes this DashboardChartsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardChartsModel&&const DeepCollectionEquality().equals(other.monthlyRegistrations, monthlyRegistrations)&&const DeepCollectionEquality().equals(other.monthlyClaims, monthlyClaims));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(monthlyRegistrations),const DeepCollectionEquality().hash(monthlyClaims));

@override
String toString() {
  return 'DashboardChartsModel(monthlyRegistrations: $monthlyRegistrations, monthlyClaims: $monthlyClaims)';
}


}

/// @nodoc
abstract mixin class $DashboardChartsModelCopyWith<$Res>  {
  factory $DashboardChartsModelCopyWith(DashboardChartsModel value, $Res Function(DashboardChartsModel) _then) = _$DashboardChartsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'monthly_registrations') List<ChartPointModel> monthlyRegistrations,@JsonKey(name: 'monthly_claims') List<ChartPointModel> monthlyClaims
});




}
/// @nodoc
class _$DashboardChartsModelCopyWithImpl<$Res>
    implements $DashboardChartsModelCopyWith<$Res> {
  _$DashboardChartsModelCopyWithImpl(this._self, this._then);

  final DashboardChartsModel _self;
  final $Res Function(DashboardChartsModel) _then;

/// Create a copy of DashboardChartsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monthlyRegistrations = null,Object? monthlyClaims = null,}) {
  return _then(_self.copyWith(
monthlyRegistrations: null == monthlyRegistrations ? _self.monthlyRegistrations : monthlyRegistrations // ignore: cast_nullable_to_non_nullable
as List<ChartPointModel>,monthlyClaims: null == monthlyClaims ? _self.monthlyClaims : monthlyClaims // ignore: cast_nullable_to_non_nullable
as List<ChartPointModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardChartsModel].
extension DashboardChartsModelPatterns on DashboardChartsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardChartsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardChartsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardChartsModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardChartsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardChartsModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardChartsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'monthly_registrations')  List<ChartPointModel> monthlyRegistrations, @JsonKey(name: 'monthly_claims')  List<ChartPointModel> monthlyClaims)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardChartsModel() when $default != null:
return $default(_that.monthlyRegistrations,_that.monthlyClaims);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'monthly_registrations')  List<ChartPointModel> monthlyRegistrations, @JsonKey(name: 'monthly_claims')  List<ChartPointModel> monthlyClaims)  $default,) {final _that = this;
switch (_that) {
case _DashboardChartsModel():
return $default(_that.monthlyRegistrations,_that.monthlyClaims);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'monthly_registrations')  List<ChartPointModel> monthlyRegistrations, @JsonKey(name: 'monthly_claims')  List<ChartPointModel> monthlyClaims)?  $default,) {final _that = this;
switch (_that) {
case _DashboardChartsModel() when $default != null:
return $default(_that.monthlyRegistrations,_that.monthlyClaims);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardChartsModel extends DashboardChartsModel {
  const _DashboardChartsModel({@JsonKey(name: 'monthly_registrations') required final  List<ChartPointModel> monthlyRegistrations, @JsonKey(name: 'monthly_claims') required final  List<ChartPointModel> monthlyClaims}): _monthlyRegistrations = monthlyRegistrations,_monthlyClaims = monthlyClaims,super._();
  factory _DashboardChartsModel.fromJson(Map<String, dynamic> json) => _$DashboardChartsModelFromJson(json);

 final  List<ChartPointModel> _monthlyRegistrations;
@override@JsonKey(name: 'monthly_registrations') List<ChartPointModel> get monthlyRegistrations {
  if (_monthlyRegistrations is EqualUnmodifiableListView) return _monthlyRegistrations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_monthlyRegistrations);
}

 final  List<ChartPointModel> _monthlyClaims;
@override@JsonKey(name: 'monthly_claims') List<ChartPointModel> get monthlyClaims {
  if (_monthlyClaims is EqualUnmodifiableListView) return _monthlyClaims;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_monthlyClaims);
}


/// Create a copy of DashboardChartsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardChartsModelCopyWith<_DashboardChartsModel> get copyWith => __$DashboardChartsModelCopyWithImpl<_DashboardChartsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardChartsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardChartsModel&&const DeepCollectionEquality().equals(other._monthlyRegistrations, _monthlyRegistrations)&&const DeepCollectionEquality().equals(other._monthlyClaims, _monthlyClaims));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_monthlyRegistrations),const DeepCollectionEquality().hash(_monthlyClaims));

@override
String toString() {
  return 'DashboardChartsModel(monthlyRegistrations: $monthlyRegistrations, monthlyClaims: $monthlyClaims)';
}


}

/// @nodoc
abstract mixin class _$DashboardChartsModelCopyWith<$Res> implements $DashboardChartsModelCopyWith<$Res> {
  factory _$DashboardChartsModelCopyWith(_DashboardChartsModel value, $Res Function(_DashboardChartsModel) _then) = __$DashboardChartsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'monthly_registrations') List<ChartPointModel> monthlyRegistrations,@JsonKey(name: 'monthly_claims') List<ChartPointModel> monthlyClaims
});




}
/// @nodoc
class __$DashboardChartsModelCopyWithImpl<$Res>
    implements _$DashboardChartsModelCopyWith<$Res> {
  __$DashboardChartsModelCopyWithImpl(this._self, this._then);

  final _DashboardChartsModel _self;
  final $Res Function(_DashboardChartsModel) _then;

/// Create a copy of DashboardChartsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monthlyRegistrations = null,Object? monthlyClaims = null,}) {
  return _then(_DashboardChartsModel(
monthlyRegistrations: null == monthlyRegistrations ? _self._monthlyRegistrations : monthlyRegistrations // ignore: cast_nullable_to_non_nullable
as List<ChartPointModel>,monthlyClaims: null == monthlyClaims ? _self._monthlyClaims : monthlyClaims // ignore: cast_nullable_to_non_nullable
as List<ChartPointModel>,
  ));
}


}

// dart format on
