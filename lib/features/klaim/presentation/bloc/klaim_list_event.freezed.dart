// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'klaim_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KlaimListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KlaimListEvent()';
}


}

/// @nodoc
class $KlaimListEventCopyWith<$Res>  {
$KlaimListEventCopyWith(KlaimListEvent _, $Res Function(KlaimListEvent) __);
}


/// Adds pattern-matching-related methods to [KlaimListEvent].
extension KlaimListEventPatterns on KlaimListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( KlaimListStarted value)?  started,TResult Function( KlaimListRefreshed value)?  refreshed,TResult Function( KlaimListSearched value)?  searched,TResult Function( KlaimListLoadMore value)?  loadMore,TResult Function( KlaimListDeleted value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case KlaimListStarted() when started != null:
return started(_that);case KlaimListRefreshed() when refreshed != null:
return refreshed(_that);case KlaimListSearched() when searched != null:
return searched(_that);case KlaimListLoadMore() when loadMore != null:
return loadMore(_that);case KlaimListDeleted() when deleted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( KlaimListStarted value)  started,required TResult Function( KlaimListRefreshed value)  refreshed,required TResult Function( KlaimListSearched value)  searched,required TResult Function( KlaimListLoadMore value)  loadMore,required TResult Function( KlaimListDeleted value)  deleted,}){
final _that = this;
switch (_that) {
case KlaimListStarted():
return started(_that);case KlaimListRefreshed():
return refreshed(_that);case KlaimListSearched():
return searched(_that);case KlaimListLoadMore():
return loadMore(_that);case KlaimListDeleted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( KlaimListStarted value)?  started,TResult? Function( KlaimListRefreshed value)?  refreshed,TResult? Function( KlaimListSearched value)?  searched,TResult? Function( KlaimListLoadMore value)?  loadMore,TResult? Function( KlaimListDeleted value)?  deleted,}){
final _that = this;
switch (_that) {
case KlaimListStarted() when started != null:
return started(_that);case KlaimListRefreshed() when refreshed != null:
return refreshed(_that);case KlaimListSearched() when searched != null:
return searched(_that);case KlaimListLoadMore() when loadMore != null:
return loadMore(_that);case KlaimListDeleted() when deleted != null:
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
case KlaimListStarted() when started != null:
return started();case KlaimListRefreshed() when refreshed != null:
return refreshed();case KlaimListSearched() when searched != null:
return searched(_that.query);case KlaimListLoadMore() when loadMore != null:
return loadMore();case KlaimListDeleted() when deleted != null:
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
case KlaimListStarted():
return started();case KlaimListRefreshed():
return refreshed();case KlaimListSearched():
return searched(_that.query);case KlaimListLoadMore():
return loadMore();case KlaimListDeleted():
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
case KlaimListStarted() when started != null:
return started();case KlaimListRefreshed() when refreshed != null:
return refreshed();case KlaimListSearched() when searched != null:
return searched(_that.query);case KlaimListLoadMore() when loadMore != null:
return loadMore();case KlaimListDeleted() when deleted != null:
return deleted(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class KlaimListStarted implements KlaimListEvent {
  const KlaimListStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KlaimListEvent.started()';
}


}




/// @nodoc


class KlaimListRefreshed implements KlaimListEvent {
  const KlaimListRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KlaimListEvent.refreshed()';
}


}




/// @nodoc


class KlaimListSearched implements KlaimListEvent {
  const KlaimListSearched(this.query);
  

 final  String query;

/// Create a copy of KlaimListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KlaimListSearchedCopyWith<KlaimListSearched> get copyWith => _$KlaimListSearchedCopyWithImpl<KlaimListSearched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListSearched&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'KlaimListEvent.searched(query: $query)';
}


}

/// @nodoc
abstract mixin class $KlaimListSearchedCopyWith<$Res> implements $KlaimListEventCopyWith<$Res> {
  factory $KlaimListSearchedCopyWith(KlaimListSearched value, $Res Function(KlaimListSearched) _then) = _$KlaimListSearchedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$KlaimListSearchedCopyWithImpl<$Res>
    implements $KlaimListSearchedCopyWith<$Res> {
  _$KlaimListSearchedCopyWithImpl(this._self, this._then);

  final KlaimListSearched _self;
  final $Res Function(KlaimListSearched) _then;

/// Create a copy of KlaimListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(KlaimListSearched(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class KlaimListLoadMore implements KlaimListEvent {
  const KlaimListLoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListLoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KlaimListEvent.loadMore()';
}


}




/// @nodoc


class KlaimListDeleted implements KlaimListEvent {
  const KlaimListDeleted(this.id);
  

 final  String id;

/// Create a copy of KlaimListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KlaimListDeletedCopyWith<KlaimListDeleted> get copyWith => _$KlaimListDeletedCopyWithImpl<KlaimListDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListDeleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'KlaimListEvent.deleted(id: $id)';
}


}

/// @nodoc
abstract mixin class $KlaimListDeletedCopyWith<$Res> implements $KlaimListEventCopyWith<$Res> {
  factory $KlaimListDeletedCopyWith(KlaimListDeleted value, $Res Function(KlaimListDeleted) _then) = _$KlaimListDeletedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$KlaimListDeletedCopyWithImpl<$Res>
    implements $KlaimListDeletedCopyWith<$Res> {
  _$KlaimListDeletedCopyWithImpl(this._self, this._then);

  final KlaimListDeleted _self;
  final $Res Function(KlaimListDeleted) _then;

/// Create a copy of KlaimListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(KlaimListDeleted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
