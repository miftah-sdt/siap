// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petani_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetaniListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniListEvent()';
}


}

/// @nodoc
class $PetaniListEventCopyWith<$Res>  {
$PetaniListEventCopyWith(PetaniListEvent _, $Res Function(PetaniListEvent) __);
}


/// Adds pattern-matching-related methods to [PetaniListEvent].
extension PetaniListEventPatterns on PetaniListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetaniListStarted value)?  started,TResult Function( PetaniListRefreshed value)?  refreshed,TResult Function( PetaniListSearched value)?  searched,TResult Function( PetaniListLoadMore value)?  loadMore,TResult Function( PetaniListDeleted value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetaniListStarted() when started != null:
return started(_that);case PetaniListRefreshed() when refreshed != null:
return refreshed(_that);case PetaniListSearched() when searched != null:
return searched(_that);case PetaniListLoadMore() when loadMore != null:
return loadMore(_that);case PetaniListDeleted() when deleted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetaniListStarted value)  started,required TResult Function( PetaniListRefreshed value)  refreshed,required TResult Function( PetaniListSearched value)  searched,required TResult Function( PetaniListLoadMore value)  loadMore,required TResult Function( PetaniListDeleted value)  deleted,}){
final _that = this;
switch (_that) {
case PetaniListStarted():
return started(_that);case PetaniListRefreshed():
return refreshed(_that);case PetaniListSearched():
return searched(_that);case PetaniListLoadMore():
return loadMore(_that);case PetaniListDeleted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetaniListStarted value)?  started,TResult? Function( PetaniListRefreshed value)?  refreshed,TResult? Function( PetaniListSearched value)?  searched,TResult? Function( PetaniListLoadMore value)?  loadMore,TResult? Function( PetaniListDeleted value)?  deleted,}){
final _that = this;
switch (_that) {
case PetaniListStarted() when started != null:
return started(_that);case PetaniListRefreshed() when refreshed != null:
return refreshed(_that);case PetaniListSearched() when searched != null:
return searched(_that);case PetaniListLoadMore() when loadMore != null:
return loadMore(_that);case PetaniListDeleted() when deleted != null:
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
case PetaniListStarted() when started != null:
return started();case PetaniListRefreshed() when refreshed != null:
return refreshed();case PetaniListSearched() when searched != null:
return searched(_that.query);case PetaniListLoadMore() when loadMore != null:
return loadMore();case PetaniListDeleted() when deleted != null:
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
case PetaniListStarted():
return started();case PetaniListRefreshed():
return refreshed();case PetaniListSearched():
return searched(_that.query);case PetaniListLoadMore():
return loadMore();case PetaniListDeleted():
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
case PetaniListStarted() when started != null:
return started();case PetaniListRefreshed() when refreshed != null:
return refreshed();case PetaniListSearched() when searched != null:
return searched(_that.query);case PetaniListLoadMore() when loadMore != null:
return loadMore();case PetaniListDeleted() when deleted != null:
return deleted(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class PetaniListStarted implements PetaniListEvent {
  const PetaniListStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniListEvent.started()';
}


}




/// @nodoc


class PetaniListRefreshed implements PetaniListEvent {
  const PetaniListRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniListEvent.refreshed()';
}


}




/// @nodoc


class PetaniListSearched implements PetaniListEvent {
  const PetaniListSearched(this.query);
  

 final  String query;

/// Create a copy of PetaniListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetaniListSearchedCopyWith<PetaniListSearched> get copyWith => _$PetaniListSearchedCopyWithImpl<PetaniListSearched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListSearched&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'PetaniListEvent.searched(query: $query)';
}


}

/// @nodoc
abstract mixin class $PetaniListSearchedCopyWith<$Res> implements $PetaniListEventCopyWith<$Res> {
  factory $PetaniListSearchedCopyWith(PetaniListSearched value, $Res Function(PetaniListSearched) _then) = _$PetaniListSearchedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$PetaniListSearchedCopyWithImpl<$Res>
    implements $PetaniListSearchedCopyWith<$Res> {
  _$PetaniListSearchedCopyWithImpl(this._self, this._then);

  final PetaniListSearched _self;
  final $Res Function(PetaniListSearched) _then;

/// Create a copy of PetaniListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(PetaniListSearched(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PetaniListLoadMore implements PetaniListEvent {
  const PetaniListLoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListLoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniListEvent.loadMore()';
}


}




/// @nodoc


class PetaniListDeleted implements PetaniListEvent {
  const PetaniListDeleted(this.id);
  

 final  String id;

/// Create a copy of PetaniListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetaniListDeletedCopyWith<PetaniListDeleted> get copyWith => _$PetaniListDeletedCopyWithImpl<PetaniListDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListDeleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PetaniListEvent.deleted(id: $id)';
}


}

/// @nodoc
abstract mixin class $PetaniListDeletedCopyWith<$Res> implements $PetaniListEventCopyWith<$Res> {
  factory $PetaniListDeletedCopyWith(PetaniListDeleted value, $Res Function(PetaniListDeleted) _then) = _$PetaniListDeletedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$PetaniListDeletedCopyWithImpl<$Res>
    implements $PetaniListDeletedCopyWith<$Res> {
  _$PetaniListDeletedCopyWithImpl(this._self, this._then);

  final PetaniListDeleted _self;
  final $Res Function(PetaniListDeleted) _then;

/// Create a copy of PetaniListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(PetaniListDeleted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
