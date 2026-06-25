import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = AuthCheckStatus;
  const factory AuthEvent.loginSubmitted({
    required String email,
    required String password,
  }) = AuthLoginSubmitted;
  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;
  const factory AuthEvent.forgotPasswordSubmitted({required String email}) =
      AuthForgotPasswordSubmitted;
}
