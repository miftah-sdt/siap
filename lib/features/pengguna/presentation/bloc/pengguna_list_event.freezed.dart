// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pengguna_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PenggunaListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PenggunaListEvent()';
}


}

/// @nodoc
class $PenggunaListEventCopyWith<$Res>  {
$PenggunaListEventCopyWith(PenggunaListEvent _, $Res Function(PenggunaListEvent) __);
}


/// Adds pattern-matching-related methods to [PenggunaListEvent].
extension PenggunaListEventPatterns on PenggunaListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PenggunaListStarted value)?  started,TResult Function( PenggunaListRefreshed value)?  refreshed,TResult Function( PenggunaListSearched value)?  searched,TResult Function( PenggunaListLoadMore value)?  loadMore,TResult Function( PenggunaListDeleted value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PenggunaListStarted() when started != null:
return started(_that);case PenggunaListRefreshed() when refreshed != null:
return refreshed(_that);case PenggunaListSearched() when searched != null:
return searched(_that);case PenggunaListLoadMore() when loadMore != null:
return loadMore(_that);case PenggunaListDeleted() when deleted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PenggunaListStarted value)  started,required TResult Function( PenggunaListRefreshed value)  refreshed,required TResult Function( PenggunaListSearched value)  searched,required TResult Function( PenggunaListLoadMore value)  loadMore,required TResult Function( PenggunaListDeleted value)  deleted,}){
final _that = this;
switch (_that) {
case PenggunaListStarted():
return started(_that);case PenggunaListRefreshed():
return refreshed(_that);case PenggunaListSearched():
return searched(_that);case PenggunaListLoadMore():
return loadMore(_that);case PenggunaListDeleted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PenggunaListStarted value)?  started,TResult? Function( PenggunaListRefreshed value)?  refreshed,TResult? Function( PenggunaListSearched value)?  searched,TResult? Function( PenggunaListLoadMore value)?  loadMore,TResult? Function( PenggunaListDeleted value)?  deleted,}){
final _that = this;
switch (_that) {
case PenggunaListStarted() when started != null:
return started(_that);case PenggunaListRefreshed() when refreshed != null:
return refreshed(_that);case PenggunaListSearched() when searched != null:
return searched(_that);case PenggunaListLoadMore() when loadMore != null:
return loadMore(_that);case PenggunaListDeleted() when deleted != null:
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
case PenggunaListStarted() when started != null:
return started();case PenggunaListRefreshed() when refreshed != null:
return refreshed();case PenggunaListSearched() when searched != null:
return searched(_that.query);case PenggunaListLoadMore() when loadMore != null:
return loadMore();case PenggunaListDeleted() when deleted != null:
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
case PenggunaListStarted():
return started();case PenggunaListRefreshed():
return refreshed();case PenggunaListSearched():
return searched(_that.query);case PenggunaListLoadMore():
return loadMore();case PenggunaListDeleted():
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
case PenggunaListStarted() when started != null:
return started();case PenggunaListRefreshed() when refreshed != null:
return refreshed();case PenggunaListSearched() when searched != null:
return searched(_that.query);case PenggunaListLoadMore() when loadMore != null:
return loadMore();case PenggunaListDeleted() when deleted != null:
return deleted(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class PenggunaListStarted implements PenggunaListEvent {
  const PenggunaListStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaListStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PenggunaListEvent.started()';
}


}




/// @nodoc


class PenggunaListRefreshed implements PenggunaListEvent {
  const PenggunaListRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaListRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PenggunaListEvent.refreshed()';
}


}




/// @nodoc


class PenggunaListSearched implements PenggunaListEvent {
  const PenggunaListSearched(this.query);
  

 final  String query;

/// Create a copy of PenggunaListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenggunaListSearchedCopyWith<PenggunaListSearched> get copyWith => _$PenggunaListSearchedCopyWithImpl<PenggunaListSearched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaListSearched&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'PenggunaListEvent.searched(query: $query)';
}


}

/// @nodoc
abstract mixin class $PenggunaListSearchedCopyWith<$Res> implements $PenggunaListEventCopyWith<$Res> {
  factory $PenggunaListSearchedCopyWith(PenggunaListSearched value, $Res Function(PenggunaListSearched) _then) = _$PenggunaListSearchedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$PenggunaListSearchedCopyWithImpl<$Res>
    implements $PenggunaListSearchedCopyWith<$Res> {
  _$PenggunaListSearchedCopyWithImpl(this._self, this._then);

  final PenggunaListSearched _self;
  final $Res Function(PenggunaListSearched) _then;

/// Create a copy of PenggunaListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(PenggunaListSearched(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PenggunaListLoadMore implements PenggunaListEvent {
  const PenggunaListLoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaListLoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PenggunaListEvent.loadMore()';
}


}




/// @nodoc


class PenggunaListDeleted implements PenggunaListEvent {
  const PenggunaListDeleted(this.id);
  

 final  String id;

/// Create a copy of PenggunaListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenggunaListDeletedCopyWith<PenggunaListDeleted> get copyWith => _$PenggunaListDeletedCopyWithImpl<PenggunaListDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenggunaListDeleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PenggunaListEvent.deleted(id: $id)';
}


}

/// @nodoc
abstract mixin class $PenggunaListDeletedCopyWith<$Res> implements $PenggunaListEventCopyWith<$Res> {
  factory $PenggunaListDeletedCopyWith(PenggunaListDeleted value, $Res Function(PenggunaListDeleted) _then) = _$PenggunaListDeletedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$PenggunaListDeletedCopyWithImpl<$Res>
    implements $PenggunaListDeletedCopyWith<$Res> {
  _$PenggunaListDeletedCopyWithImpl(this._self, this._then);

  final PenggunaListDeleted _self;
  final $Res Function(PenggunaListDeleted) _then;

/// Create a copy of PenggunaListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(PenggunaListDeleted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
