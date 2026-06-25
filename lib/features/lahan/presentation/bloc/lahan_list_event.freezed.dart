// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lahan_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LahanListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanListEvent()';
}


}

/// @nodoc
class $LahanListEventCopyWith<$Res>  {
$LahanListEventCopyWith(LahanListEvent _, $Res Function(LahanListEvent) __);
}


/// Adds pattern-matching-related methods to [LahanListEvent].
extension LahanListEventPatterns on LahanListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LahanListStarted value)?  started,TResult Function( LahanListRefreshed value)?  refreshed,TResult Function( LahanListSearched value)?  searched,TResult Function( LahanListLoadMore value)?  loadMore,TResult Function( LahanListDeleted value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LahanListStarted() when started != null:
return started(_that);case LahanListRefreshed() when refreshed != null:
return refreshed(_that);case LahanListSearched() when searched != null:
return searched(_that);case LahanListLoadMore() when loadMore != null:
return loadMore(_that);case LahanListDeleted() when deleted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LahanListStarted value)  started,required TResult Function( LahanListRefreshed value)  refreshed,required TResult Function( LahanListSearched value)  searched,required TResult Function( LahanListLoadMore value)  loadMore,required TResult Function( LahanListDeleted value)  deleted,}){
final _that = this;
switch (_that) {
case LahanListStarted():
return started(_that);case LahanListRefreshed():
return refreshed(_that);case LahanListSearched():
return searched(_that);case LahanListLoadMore():
return loadMore(_that);case LahanListDeleted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LahanListStarted value)?  started,TResult? Function( LahanListRefreshed value)?  refreshed,TResult? Function( LahanListSearched value)?  searched,TResult? Function( LahanListLoadMore value)?  loadMore,TResult? Function( LahanListDeleted value)?  deleted,}){
final _that = this;
switch (_that) {
case LahanListStarted() when started != null:
return started(_that);case LahanListRefreshed() when refreshed != null:
return refreshed(_that);case LahanListSearched() when searched != null:
return searched(_that);case LahanListLoadMore() when loadMore != null:
return loadMore(_that);case LahanListDeleted() when deleted != null:
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
case LahanListStarted() when started != null:
return started();case LahanListRefreshed() when refreshed != null:
return refreshed();case LahanListSearched() when searched != null:
return searched(_that.query);case LahanListLoadMore() when loadMore != null:
return loadMore();case LahanListDeleted() when deleted != null:
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
case LahanListStarted():
return started();case LahanListRefreshed():
return refreshed();case LahanListSearched():
return searched(_that.query);case LahanListLoadMore():
return loadMore();case LahanListDeleted():
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
case LahanListStarted() when started != null:
return started();case LahanListRefreshed() when refreshed != null:
return refreshed();case LahanListSearched() when searched != null:
return searched(_that.query);case LahanListLoadMore() when loadMore != null:
return loadMore();case LahanListDeleted() when deleted != null:
return deleted(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class LahanListStarted implements LahanListEvent {
  const LahanListStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanListEvent.started()';
}


}




/// @nodoc


class LahanListRefreshed implements LahanListEvent {
  const LahanListRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanListEvent.refreshed()';
}


}




/// @nodoc


class LahanListSearched implements LahanListEvent {
  const LahanListSearched(this.query);
  

 final  String query;

/// Create a copy of LahanListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LahanListSearchedCopyWith<LahanListSearched> get copyWith => _$LahanListSearchedCopyWithImpl<LahanListSearched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListSearched&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'LahanListEvent.searched(query: $query)';
}


}

/// @nodoc
abstract mixin class $LahanListSearchedCopyWith<$Res> implements $LahanListEventCopyWith<$Res> {
  factory $LahanListSearchedCopyWith(LahanListSearched value, $Res Function(LahanListSearched) _then) = _$LahanListSearchedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$LahanListSearchedCopyWithImpl<$Res>
    implements $LahanListSearchedCopyWith<$Res> {
  _$LahanListSearchedCopyWithImpl(this._self, this._then);

  final LahanListSearched _self;
  final $Res Function(LahanListSearched) _then;

/// Create a copy of LahanListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(LahanListSearched(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LahanListLoadMore implements LahanListEvent {
  const LahanListLoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListLoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanListEvent.loadMore()';
}


}




/// @nodoc


class LahanListDeleted implements LahanListEvent {
  const LahanListDeleted(this.id);
  

 final  String id;

/// Create a copy of LahanListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LahanListDeletedCopyWith<LahanListDeleted> get copyWith => _$LahanListDeletedCopyWithImpl<LahanListDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListDeleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'LahanListEvent.deleted(id: $id)';
}


}

/// @nodoc
abstract mixin class $LahanListDeletedCopyWith<$Res> implements $LahanListEventCopyWith<$Res> {
  factory $LahanListDeletedCopyWith(LahanListDeleted value, $Res Function(LahanListDeleted) _then) = _$LahanListDeletedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$LahanListDeletedCopyWithImpl<$Res>
    implements $LahanListDeletedCopyWith<$Res> {
  _$LahanListDeletedCopyWithImpl(this._self, this._then);

  final LahanListDeleted _self;
  final $Res Function(LahanListDeleted) _then;

/// Create a copy of LahanListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(LahanListDeleted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
