// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petani_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetaniListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniListState()';
}


}

/// @nodoc
class $PetaniListStateCopyWith<$Res>  {
$PetaniListStateCopyWith(PetaniListState _, $Res Function(PetaniListState) __);
}


/// Adds pattern-matching-related methods to [PetaniListState].
extension PetaniListStatePatterns on PetaniListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetaniListInitial value)?  initial,TResult Function( PetaniListLoading value)?  loading,TResult Function( PetaniListSuccess value)?  success,TResult Function( PetaniListError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetaniListInitial() when initial != null:
return initial(_that);case PetaniListLoading() when loading != null:
return loading(_that);case PetaniListSuccess() when success != null:
return success(_that);case PetaniListError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetaniListInitial value)  initial,required TResult Function( PetaniListLoading value)  loading,required TResult Function( PetaniListSuccess value)  success,required TResult Function( PetaniListError value)  error,}){
final _that = this;
switch (_that) {
case PetaniListInitial():
return initial(_that);case PetaniListLoading():
return loading(_that);case PetaniListSuccess():
return success(_that);case PetaniListError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetaniListInitial value)?  initial,TResult? Function( PetaniListLoading value)?  loading,TResult? Function( PetaniListSuccess value)?  success,TResult? Function( PetaniListError value)?  error,}){
final _that = this;
switch (_that) {
case PetaniListInitial() when initial != null:
return initial(_that);case PetaniListLoading() when loading != null:
return loading(_that);case PetaniListSuccess() when success != null:
return success(_that);case PetaniListError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Petani> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetaniListInitial() when initial != null:
return initial();case PetaniListLoading() when loading != null:
return loading();case PetaniListSuccess() when success != null:
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case PetaniListError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Petani> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case PetaniListInitial():
return initial();case PetaniListLoading():
return loading();case PetaniListSuccess():
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case PetaniListError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Petani> items,  int page,  int totalPages,  int total,  String searchQuery,  bool isLoadingMore,  bool hasReachedMax)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case PetaniListInitial() when initial != null:
return initial();case PetaniListLoading() when loading != null:
return loading();case PetaniListSuccess() when success != null:
return success(_that.items,_that.page,_that.totalPages,_that.total,_that.searchQuery,_that.isLoadingMore,_that.hasReachedMax);case PetaniListError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class PetaniListInitial implements PetaniListState {
  const PetaniListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniListState.initial()';
}


}




/// @nodoc


class PetaniListLoading implements PetaniListState {
  const PetaniListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetaniListState.loading()';
}


}




/// @nodoc


class PetaniListSuccess implements PetaniListState {
  const PetaniListSuccess({required final  List<Petani> items, required this.page, required this.totalPages, required this.total, required this.searchQuery, this.isLoadingMore = false, this.hasReachedMax = false}): _items = items;
  

 final  List<Petani> _items;
 List<Petani> get items {
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

/// Create a copy of PetaniListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetaniListSuccessCopyWith<PetaniListSuccess> get copyWith => _$PetaniListSuccessCopyWithImpl<PetaniListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListSuccess&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.total, total) || other.total == total)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,totalPages,total,searchQuery,isLoadingMore,hasReachedMax);

@override
String toString() {
  return 'PetaniListState.success(items: $items, page: $page, totalPages: $totalPages, total: $total, searchQuery: $searchQuery, isLoadingMore: $isLoadingMore, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class $PetaniListSuccessCopyWith<$Res> implements $PetaniListStateCopyWith<$Res> {
  factory $PetaniListSuccessCopyWith(PetaniListSuccess value, $Res Function(PetaniListSuccess) _then) = _$PetaniListSuccessCopyWithImpl;
@useResult
$Res call({
 List<Petani> items, int page, int totalPages, int total, String searchQuery, bool isLoadingMore, bool hasReachedMax
});




}
/// @nodoc
class _$PetaniListSuccessCopyWithImpl<$Res>
    implements $PetaniListSuccessCopyWith<$Res> {
  _$PetaniListSuccessCopyWithImpl(this._self, this._then);

  final PetaniListSuccess _self;
  final $Res Function(PetaniListSuccess) _then;

/// Create a copy of PetaniListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? totalPages = null,Object? total = null,Object? searchQuery = null,Object? isLoadingMore = null,Object? hasReachedMax = null,}) {
  return _then(PetaniListSuccess(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Petani>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
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


class PetaniListError implements PetaniListState {
  const PetaniListError(this.message);
  

 final  String message;

/// Create a copy of PetaniListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetaniListErrorCopyWith<PetaniListError> get copyWith => _$PetaniListErrorCopyWithImpl<PetaniListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetaniListError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PetaniListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PetaniListErrorCopyWith<$Res> implements $PetaniListStateCopyWith<$Res> {
  factory $PetaniListErrorCopyWith(PetaniListError value, $Res Function(PetaniListError) _then) = _$PetaniListErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PetaniListErrorCopyWithImpl<$Res>
    implements $PetaniListErrorCopyWith<$Res> {
  _$PetaniListErrorCopyWithImpl(this._self, this._then);

  final PetaniListError _self;
  final $Res Function(PetaniListError) _then;

/// Create a copy of PetaniListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PetaniListError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
