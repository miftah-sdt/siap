// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'klaim_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KlaimListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KlaimListState()';
}


}

/// @nodoc
class $KlaimListStateCopyWith<$Res>  {
$KlaimListStateCopyWith(KlaimListState _, $Res Function(KlaimListState) __);
}


/// Adds pattern-matching-related methods to [KlaimListState].
extension KlaimListStatePatterns on KlaimListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( KlaimListInitial value)?  initial,TResult Function( KlaimListLoading value)?  loading,TResult Function( KlaimListSuccess value)?  success,TResult Function( KlaimListError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case KlaimListInitial() when initial != null:
return initial(_that);case KlaimListLoading() when loading != null:
return loading(_that);case KlaimListSuccess() when success != null:
return success(_that);case KlaimListError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( KlaimListInitial value)  initial,required TResult Function( KlaimListLoading value)  loading,required TResult Function( KlaimListSuccess value)  success,required TResult Function( KlaimListError value)  error,}){
final _that = this;
switch (_that) {
case KlaimListInitial():
return initial(_that);case KlaimListLoading():
return loading(_that);case KlaimListSuccess():
return success(_that);case KlaimListError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( KlaimListInitial value)?  initial,TResult? Function( KlaimListLoading value)?  loading,TResult? Function( KlaimListSuccess value)?  success,TResult? Function( KlaimListError value)?  error,}){
final _that = this;
switch (_that) {
case KlaimListInitial() when initial != null:
return initial(_that);case KlaimListLoading() when loading != null:
return loading(_that);case KlaimListSuccess() when success != null:
return success(_that);case KlaimListError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Klaim> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case KlaimListInitial() when initial != null:
return initial();case KlaimListLoading() when loading != null:
return loading();case KlaimListSuccess() when success != null:
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case KlaimListError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Klaim> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case KlaimListInitial():
return initial();case KlaimListLoading():
return loading();case KlaimListSuccess():
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case KlaimListError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Klaim> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case KlaimListInitial() when initial != null:
return initial();case KlaimListLoading() when loading != null:
return loading();case KlaimListSuccess() when success != null:
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case KlaimListError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class KlaimListInitial implements KlaimListState {
  const KlaimListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KlaimListState.initial()';
}


}




/// @nodoc


class KlaimListLoading implements KlaimListState {
  const KlaimListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KlaimListState.loading()';
}


}




/// @nodoc


class KlaimListSuccess implements KlaimListState {
  const KlaimListSuccess({required final  List<Klaim> items, required this.page, required this.totalPages, required this.total, required this.searchQuery, this.isLoadingMore = false, this.hasReachedMax = false}): _items = items;
  

 final  List<Klaim> _items;
 List<Klaim> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  int page;
 final  int totalPages;
 final  int total;
 final  String searchQuery;
@JsonKey() final  bool isLoadingMore;
@JsonKey() final  bool hasReachedMax;

/// Create a copy of KlaimListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KlaimListSuccessCopyWith<KlaimListSuccess> get copyWith => _$KlaimListSuccessCopyWithImpl<KlaimListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListSuccess&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.total, total) || other.total == total)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,totalPages,total,searchQuery,isLoadingMore,hasReachedMax);

@override
String toString() {
  return 'KlaimListState.success(items: $items, page: $page, totalPages: $totalPages, total: $total, searchQuery: $searchQuery, isLoadingMore: $isLoadingMore, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class $KlaimListSuccessCopyWith<$Res> implements $KlaimListStateCopyWith<$Res> {
  factory $KlaimListSuccessCopyWith(KlaimListSuccess value, $Res Function(KlaimListSuccess) _then) = _$KlaimListSuccessCopyWithImpl;
@useResult
$Res call({
 List<Klaim> items, int page, int totalPages, int total, String searchQuery, bool isLoadingMore, bool hasReachedMax
});




}
/// @nodoc
class _$KlaimListSuccessCopyWithImpl<$Res>
    implements $KlaimListSuccessCopyWith<$Res> {
  _$KlaimListSuccessCopyWithImpl(this._self, this._then);

  final KlaimListSuccess _self;
  final $Res Function(KlaimListSuccess) _then;

/// Create a copy of KlaimListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? totalPages = null,Object? total = null,Object? searchQuery = null,Object? isLoadingMore = null,Object? hasReachedMax = null,}) {
  return _then(KlaimListSuccess(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Klaim>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class KlaimListError implements KlaimListState {
  const KlaimListError(this.message);
  

 final  String message;

/// Create a copy of KlaimListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KlaimListErrorCopyWith<KlaimListError> get copyWith => _$KlaimListErrorCopyWithImpl<KlaimListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KlaimListError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'KlaimListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $KlaimListErrorCopyWith<$Res> implements $KlaimListStateCopyWith<$Res> {
  factory $KlaimListErrorCopyWith(KlaimListError value, $Res Function(KlaimListError) _then) = _$KlaimListErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$KlaimListErrorCopyWithImpl<$Res>
    implements $KlaimListErrorCopyWith<$Res> {
  _$KlaimListErrorCopyWithImpl(this._self, this._then);

  final KlaimListError _self;
  final $Res Function(KlaimListError) _then;

/// Create a copy of KlaimListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(KlaimListError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
