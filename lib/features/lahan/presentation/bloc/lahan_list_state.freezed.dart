// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lahan_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LahanListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanListState()';
}


}

/// @nodoc
class $LahanListStateCopyWith<$Res>  {
$LahanListStateCopyWith(LahanListState _, $Res Function(LahanListState) __);
}


/// Adds pattern-matching-related methods to [LahanListState].
extension LahanListStatePatterns on LahanListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LahanListInitial value)?  initial,TResult Function( LahanListLoading value)?  loading,TResult Function( LahanListSuccess value)?  success,TResult Function( LahanListError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LahanListInitial() when initial != null:
return initial(_that);case LahanListLoading() when loading != null:
return loading(_that);case LahanListSuccess() when success != null:
return success(_that);case LahanListError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LahanListInitial value)  initial,required TResult Function( LahanListLoading value)  loading,required TResult Function( LahanListSuccess value)  success,required TResult Function( LahanListError value)  error,}){
final _that = this;
switch (_that) {
case LahanListInitial():
return initial(_that);case LahanListLoading():
return loading(_that);case LahanListSuccess():
return success(_that);case LahanListError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LahanListInitial value)?  initial,TResult? Function( LahanListLoading value)?  loading,TResult? Function( LahanListSuccess value)?  success,TResult? Function( LahanListError value)?  error,}){
final _that = this;
switch (_that) {
case LahanListInitial() when initial != null:
return initial(_that);case LahanListLoading() when loading != null:
return loading(_that);case LahanListSuccess() when success != null:
return success(_that);case LahanListError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Lahan> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LahanListInitial() when initial != null:
return initial();case LahanListLoading() when loading != null:
return loading();case LahanListSuccess() when success != null:
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case LahanListError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Lahan> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LahanListInitial():
return initial();case LahanListLoading():
return loading();case LahanListSuccess():
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case LahanListError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Lahan> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LahanListInitial() when initial != null:
return initial();case LahanListLoading() when loading != null:
return loading();case LahanListSuccess() when success != null:
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case LahanListError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LahanListInitial implements LahanListState {
  const LahanListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanListState.initial()';
}


}




/// @nodoc


class LahanListLoading implements LahanListState {
  const LahanListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LahanListState.loading()';
}


}




/// @nodoc


class LahanListSuccess implements LahanListState {
  const LahanListSuccess({required final  List<Lahan> items, required this.page, required this.totalPages, required this.total, required this.searchQuery, this.isLoadingMore = false, this.hasReachedMax = false}): _items = items;
  

 final  List<Lahan> _items;
 List<Lahan> get items {
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

/// Create a copy of LahanListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LahanListSuccessCopyWith<LahanListSuccess> get copyWith => _$LahanListSuccessCopyWithImpl<LahanListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListSuccess&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.total, total) || other.total == total)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,totalPages,total,searchQuery,isLoadingMore,hasReachedMax);

@override
String toString() {
  return 'LahanListState.success(items: $items, page: $page, totalPages: $totalPages, total: $total, searchQuery: $searchQuery, isLoadingMore: $isLoadingMore, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class $LahanListSuccessCopyWith<$Res> implements $LahanListStateCopyWith<$Res> {
  factory $LahanListSuccessCopyWith(LahanListSuccess value, $Res Function(LahanListSuccess) _then) = _$LahanListSuccessCopyWithImpl;
@useResult
$Res call({
 List<Lahan> items, int page, int totalPages, int total, String searchQuery, bool isLoadingMore, bool hasReachedMax
});




}
/// @nodoc
class _$LahanListSuccessCopyWithImpl<$Res>
    implements $LahanListSuccessCopyWith<$Res> {
  _$LahanListSuccessCopyWithImpl(this._self, this._then);

  final LahanListSuccess _self;
  final $Res Function(LahanListSuccess) _then;

/// Create a copy of LahanListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? totalPages = null,Object? total = null,Object? searchQuery = null,Object? isLoadingMore = null,Object? hasReachedMax = null,}) {
  return _then(LahanListSuccess(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Lahan>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
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


class LahanListError implements LahanListState {
  const LahanListError(this.message);
  

 final  String message;

/// Create a copy of LahanListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LahanListErrorCopyWith<LahanListError> get copyWith => _$LahanListErrorCopyWithImpl<LahanListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LahanListError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LahanListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LahanListErrorCopyWith<$Res> implements $LahanListStateCopyWith<$Res> {
  factory $LahanListErrorCopyWith(LahanListError value, $Res Function(LahanListError) _then) = _$LahanListErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LahanListErrorCopyWithImpl<$Res>
    implements $LahanListErrorCopyWith<$Res> {
  _$LahanListErrorCopyWithImpl(this._self, this._then);

  final LahanListError _self;
  final $Res Function(LahanListError) _then;

/// Create a copy of LahanListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LahanListError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
