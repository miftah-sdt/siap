// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asuransi_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsuransiListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiListState()';
}


}

/// @nodoc
class $AsuransiListStateCopyWith<$Res>  {
$AsuransiListStateCopyWith(AsuransiListState _, $Res Function(AsuransiListState) __);
}


/// Adds pattern-matching-related methods to [AsuransiListState].
extension AsuransiListStatePatterns on AsuransiListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AsuransiListInitial value)?  initial,TResult Function( AsuransiListLoading value)?  loading,TResult Function( AsuransiListSuccess value)?  success,TResult Function( AsuransiListError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AsuransiListInitial() when initial != null:
return initial(_that);case AsuransiListLoading() when loading != null:
return loading(_that);case AsuransiListSuccess() when success != null:
return success(_that);case AsuransiListError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AsuransiListInitial value)  initial,required TResult Function( AsuransiListLoading value)  loading,required TResult Function( AsuransiListSuccess value)  success,required TResult Function( AsuransiListError value)  error,}){
final _that = this;
switch (_that) {
case AsuransiListInitial():
return initial(_that);case AsuransiListLoading():
return loading(_that);case AsuransiListSuccess():
return success(_that);case AsuransiListError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AsuransiListInitial value)?  initial,TResult? Function( AsuransiListLoading value)?  loading,TResult? Function( AsuransiListSuccess value)?  success,TResult? Function( AsuransiListError value)?  error,}){
final _that = this;
switch (_that) {
case AsuransiListInitial() when initial != null:
return initial(_that);case AsuransiListLoading() when loading != null:
return loading(_that);case AsuransiListSuccess() when success != null:
return success(_that);case AsuransiListError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Asuransi> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AsuransiListInitial() when initial != null:
return initial();case AsuransiListLoading() when loading != null:
return loading();case AsuransiListSuccess() when success != null:
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case AsuransiListError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Asuransi> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AsuransiListInitial():
return initial();case AsuransiListLoading():
return loading();case AsuransiListSuccess():
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case AsuransiListError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Asuransi> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AsuransiListInitial() when initial != null:
return initial();case AsuransiListLoading() when loading != null:
return loading();case AsuransiListSuccess() when success != null:
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case AsuransiListError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AsuransiListInitial implements AsuransiListState {
  const AsuransiListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiListState.initial()';
}


}




/// @nodoc


class AsuransiListLoading implements AsuransiListState {
  const AsuransiListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsuransiListState.loading()';
}


}




/// @nodoc


class AsuransiListSuccess implements AsuransiListState {
  const AsuransiListSuccess({required final  List<Asuransi> items, required this.page, required this.totalPages, required this.total, required this.searchQuery, this.isLoadingMore = false, this.hasReachedMax = false}): _items = items;
  

 final  List<Asuransi> _items;
 List<Asuransi> get items {
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

/// Create a copy of AsuransiListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsuransiListSuccessCopyWith<AsuransiListSuccess> get copyWith => _$AsuransiListSuccessCopyWithImpl<AsuransiListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListSuccess&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.total, total) || other.total == total)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,totalPages,total,searchQuery,isLoadingMore,hasReachedMax);

@override
String toString() {
  return 'AsuransiListState.success(items: $items, page: $page, totalPages: $totalPages, total: $total, searchQuery: $searchQuery, isLoadingMore: $isLoadingMore, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class $AsuransiListSuccessCopyWith<$Res> implements $AsuransiListStateCopyWith<$Res> {
  factory $AsuransiListSuccessCopyWith(AsuransiListSuccess value, $Res Function(AsuransiListSuccess) _then) = _$AsuransiListSuccessCopyWithImpl;
@useResult
$Res call({
 List<Asuransi> items, int page, int totalPages, int total, String searchQuery, bool isLoadingMore, bool hasReachedMax
});




}
/// @nodoc
class _$AsuransiListSuccessCopyWithImpl<$Res>
    implements $AsuransiListSuccessCopyWith<$Res> {
  _$AsuransiListSuccessCopyWithImpl(this._self, this._then);

  final AsuransiListSuccess _self;
  final $Res Function(AsuransiListSuccess) _then;

/// Create a copy of AsuransiListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? totalPages = null,Object? total = null,Object? searchQuery = null,Object? isLoadingMore = null,Object? hasReachedMax = null,}) {
  return _then(AsuransiListSuccess(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Asuransi>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
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


class AsuransiListError implements AsuransiListState {
  const AsuransiListError(this.message);
  

 final  String message;

/// Create a copy of AsuransiListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsuransiListErrorCopyWith<AsuransiListError> get copyWith => _$AsuransiListErrorCopyWithImpl<AsuransiListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsuransiListError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AsuransiListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AsuransiListErrorCopyWith<$Res> implements $AsuransiListStateCopyWith<$Res> {
  factory $AsuransiListErrorCopyWith(AsuransiListError value, $Res Function(AsuransiListError) _then) = _$AsuransiListErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AsuransiListErrorCopyWithImpl<$Res>
    implements $AsuransiListErrorCopyWith<$Res> {
  _$AsuransiListErrorCopyWithImpl(this._self, this._then);

  final AsuransiListError _self;
  final $Res Function(AsuransiListError) _then;

/// Create a copy of AsuransiListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AsuransiListError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
