// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthCheckStatus value)?  checkAuthStatus,TResult Function( AuthLoginSubmitted value)?  loginSubmitted,TResult Function( AuthLogoutRequested value)?  logoutRequested,TResult Function( AuthForgotPasswordSubmitted value)?  forgotPasswordSubmitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthCheckStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case AuthLoginSubmitted() when loginSubmitted != null:
return loginSubmitted(_that);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case AuthForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthCheckStatus value)  checkAuthStatus,required TResult Function( AuthLoginSubmitted value)  loginSubmitted,required TResult Function( AuthLogoutRequested value)  logoutRequested,required TResult Function( AuthForgotPasswordSubmitted value)  forgotPasswordSubmitted,}){
final _that = this;
switch (_that) {
case AuthCheckStatus():
return checkAuthStatus(_that);case AuthLoginSubmitted():
return loginSubmitted(_that);case AuthLogoutRequested():
return logoutRequested(_that);case AuthForgotPasswordSubmitted():
return forgotPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthCheckStatus value)?  checkAuthStatus,TResult? Function( AuthLoginSubmitted value)?  loginSubmitted,TResult? Function( AuthLogoutRequested value)?  logoutRequested,TResult? Function( AuthForgotPasswordSubmitted value)?  forgotPasswordSubmitted,}){
final _that = this;
switch (_that) {
case AuthCheckStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case AuthLoginSubmitted() when loginSubmitted != null:
return loginSubmitted(_that);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case AuthForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkAuthStatus,TResult Function( String email,  String password)?  loginSubmitted,TResult Function()?  logoutRequested,TResult Function( String email)?  forgotPasswordSubmitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthCheckStatus() when checkAuthStatus != null:
return checkAuthStatus();case AuthLoginSubmitted() when loginSubmitted != null:
return loginSubmitted(_that.email,_that.password);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested();case AuthForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkAuthStatus,required TResult Function( String email,  String password)  loginSubmitted,required TResult Function()  logoutRequested,required TResult Function( String email)  forgotPasswordSubmitted,}) {final _that = this;
switch (_that) {
case AuthCheckStatus():
return checkAuthStatus();case AuthLoginSubmitted():
return loginSubmitted(_that.email,_that.password);case AuthLogoutRequested():
return logoutRequested();case AuthForgotPasswordSubmitted():
return forgotPasswordSubmitted(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkAuthStatus,TResult? Function( String email,  String password)?  loginSubmitted,TResult? Function()?  logoutRequested,TResult? Function( String email)?  forgotPasswordSubmitted,}) {final _that = this;
switch (_that) {
case AuthCheckStatus() when checkAuthStatus != null:
return checkAuthStatus();case AuthLoginSubmitted() when loginSubmitted != null:
return loginSubmitted(_that.email,_that.password);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested();case AuthForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class AuthCheckStatus implements AuthEvent {
  const AuthCheckStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCheckStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkAuthStatus()';
}


}




/// @nodoc


class AuthLoginSubmitted implements AuthEvent {
  const AuthLoginSubmitted({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginSubmittedCopyWith<AuthLoginSubmitted> get copyWith => _$AuthLoginSubmittedCopyWithImpl<AuthLoginSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoginSubmitted&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.loginSubmitted(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthLoginSubmittedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthLoginSubmittedCopyWith(AuthLoginSubmitted value, $Res Function(AuthLoginSubmitted) _then) = _$AuthLoginSubmittedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$AuthLoginSubmittedCopyWithImpl<$Res>
    implements $AuthLoginSubmittedCopyWith<$Res> {
  _$AuthLoginSubmittedCopyWithImpl(this._self, this._then);

  final AuthLoginSubmitted _self;
  final $Res Function(AuthLoginSubmitted) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(AuthLoginSubmitted(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthLogoutRequested implements AuthEvent {
  const AuthLogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutRequested()';
}


}




/// @nodoc


class AuthForgotPasswordSubmitted implements AuthEvent {
  const AuthForgotPasswordSubmitted({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthForgotPasswordSubmittedCopyWith<AuthForgotPasswordSubmitted> get copyWith => _$AuthForgotPasswordSubmittedCopyWithImpl<AuthForgotPasswordSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthForgotPasswordSubmitted&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.forgotPasswordSubmitted(email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthForgotPasswordSubmittedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthForgotPasswordSubmittedCopyWith(AuthForgotPasswordSubmitted value, $Res Function(AuthForgotPasswordSubmitted) _then) = _$AuthForgotPasswordSubmittedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AuthForgotPasswordSubmittedCopyWithImpl<$Res>
    implements $AuthForgotPasswordSubmittedCopyWith<$Res> {
  _$AuthForgotPasswordSubmittedCopyWithImpl(this._self, this._then);

  final AuthForgotPasswordSubmitted _self;
  final $Res Function(AuthForgotPasswordSubmitted) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(AuthForgotPasswordSubmitted(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
