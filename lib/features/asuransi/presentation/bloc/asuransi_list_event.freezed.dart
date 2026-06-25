// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asuransi_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsuransiListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiListEvent()';
}


}

/// @nodoc
class $AsuransiListEventCopyWith<$Res>  {
$AsuransiListEventCopyWith(AsuransiListEvent _, $Res Function(AsuransiListEvent) __);
}


/// Adds pattern-matching-related methods to [AsuransiListEvent].
extension AsuransiListEventPatterns on AsuransiListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AsuransiListStarted value)?  started,TResult Function( AsuransiListRefreshed value)?  refreshed,TResult Function( AsuransiListSearched value)?  searched,TResult Function( AsuransiListLoadMore value)?  loadMore,TResult Function( AsuransiListDeleted value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AsuransiListStarted() when started != null:
return started(_that);case AsuransiListRefreshed() when refreshed != null:
return refreshed(_that);case AsuransiListSearched() when searched != null:
return searched(_that);case AsuransiListLoadMore() when loadMore != null:
return loadMore(_that);case AsuransiListDeleted() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AsuransiListStarted value)  started,required TResult Function( AsuransiListRefreshed value)  refreshed,required TResult Function( AsuransiListSearched value)  searched,required TResult Function( AsuransiListLoadMore value)  loadMore,required TResult Function( AsuransiListDeleted value)  deleted,}){
final _that = this;
switch (_that) {
case AsuransiListStarted():
return started(_that);case AsuransiListRefreshed():
return refreshed(_that);case AsuransiListSearched():
return searched(_that);case AsuransiListLoadMore():
return loadMore(_that);case AsuransiListDeleted():
return deleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AsuransiListStarted value)?  started,TResult? Function( AsuransiListRefreshed value)?  refreshed,TResult? Function( AsuransiListSearched value)?  searched,TResult? Function( AsuransiListLoadMore value)?  loadMore,TResult? Function( AsuransiListDeleted value)?  deleted,}){
final _that = this;
switch (_that) {
case AsuransiListStarted() when started != null:
return started(_that);case AsuransiListRefreshed() when refreshed != null:
return refreshed(_that);case AsuransiListSearched() when searched != null:
return searched(_that);case AsuransiListLoadMore() when loadMore != null:
return loadMore(_that);case AsuransiListDeleted() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshed,TResult Function( String query)?  searched,TResult Function()?  loadMore,TResult Function( String id)?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AsuransiListStarted() when started != null:
return started();case AsuransiListRefreshed() when refreshed != null:
return refreshed();case AsuransiListSearched() when searched != null:
return searched(_that.query);case AsuransiListLoadMore() when loadMore != null:
return loadMore();case AsuransiListDeleted() when deleted != null:
return deleted(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshed,required TResult Function( String query)  searched,required TResult Function()  loadMore,required TResult Function( String id)  deleted,}) {final _that = this;
switch (_that) {
case AsuransiListStarted():
return started();case AsuransiListRefreshed():
return refreshed();case AsuransiListSearched():
return searched(_that.query);case AsuransiListLoadMore():
return loadMore();case AsuransiListDeleted():
return deleted(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshed,TResult? Function( String query)?  searched,TResult? Function()?  loadMore,TResult? Function( String id)?  deleted,}) {final _that = this;
switch (_that) {
case AsuransiListStarted() when started != null:
return started();case AsuransiListRefreshed() when refreshed != null:
return refreshed();case AsuransiListSearched() when searched != null:
return searched(_that.query);case AsuransiListLoadMore() when loadMore != null:
return loadMore();case AsuransiListDeleted() when deleted != null:
return deleted(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class AsuransiListStarted implements AsuransiListEvent {
  const AsuransiListStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiListEvent.started()';
}


}




/// @nodoc


class AsuransiListRefreshed implements AsuransiListEvent {
  const AsuransiListRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiListEvent.refreshed()';
}


}




/// @nodoc


class AsuransiListSearched implements AsuransiListEvent {
  const AsuransiListSearched(this.query);
  

 final  String query;

/// Create a copy of AsuransiListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsuransiListSearchedCopyWith<AsuransiListSearched> get copyWith => _$AsuransiListSearchedCopyWithImpl<AsuransiListSearched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListSearched&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'AsuransiListEvent.searched(query: $query)';
}


}

/// @nodoc
abstract mixin class $AsuransiListSearchedCopyWith<$Res> implements $AsuransiListEventCopyWith<$Res> {
  factory $AsuransiListSearchedCopyWith(AsuransiListSearched value, $Res Function(AsuransiListSearched) _then) = _$AsuransiListSearchedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$AsuransiListSearchedCopyWithImpl<$Res>
    implements $AsuransiListSearchedCopyWith<$Res> {
  _$AsuransiListSearchedCopyWithImpl(this._self, this._then);

  final AsuransiListSearched _self;
  final $Res Function(AsuransiListSearched) _then;

/// Create a copy of AsuransiListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(AsuransiListSearched(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AsuransiListLoadMore implements AsuransiListEvent {
  const AsuransiListLoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListLoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiListEvent.loadMore()';
}


}




/// @nodoc


class AsuransiListDeleted implements AsuransiListEvent {
  const AsuransiListDeleted(this.id);
  

 final  String id;

/// Create a copy of AsuransiListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsuransiListDeletedCopyWith<AsuransiListDeleted> get copyWith => _$AsuransiListDeletedCopyWithImpl<AsuransiListDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListDeleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AsuransiListEvent.deleted(id: $id)';
}


}

/// @nodoc
abstract mixin class $AsuransiListDeletedCopyWith<$Res> implements $AsuransiListEventCopyWith<$Res> {
  factory $AsuransiListDeletedCopyWith(AsuransiListDeleted value, $Res Function(AsuransiListDeleted) _then) = _$AsuransiListDeletedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$AsuransiListDeletedCopyWithImpl<$Res>
    implements $AsuransiListDeletedCopyWith<$Res> {
  _$AsuransiListDeletedCopyWithImpl(this._self, this._then);

  final AsuransiListDeleted _self;
  final $Res Function(AsuransiListDeleted) _then;

/// Create a copy of AsuransiListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(AsuransiListDeleted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
