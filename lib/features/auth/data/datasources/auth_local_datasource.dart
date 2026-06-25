import 'package:siap/core/storage/shared_pref_service.dart';
import 'package:siap/features/auth/data/models/auth_response_model.dart';
import 'package:siap/features/auth/domain/entities/user.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuth(AuthResponseModel auth);
  Future<void> saveUser(User user);
  User? getCachedUser();
  Future<void> clearAuth();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this._prefs);

  final SharedPrefService _prefs;

  @override
  Future<void> saveAuth(AuthResponseModel auth) async {
    await _prefs.saveAccessToken(auth.accessToken);
    await _prefs.saveRefreshToken(auth.refreshToken);
    await saveUser(auth.user.toEntity());
  }

  @override
  Future<void> saveUser(User user) async {
    await _prefs.saveUserSession({
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'role': user.role.name,
      'avatar_url': user.avatarUrl,
    });
    await _prefs.saveUserRole(user.role.name);
  }

  @override
  User? getCachedUser() {
    final session = _prefs.getUserSession();
    if (session == null) return null;

    return User(
      id: session['id'] as String,
      name: session['name'] as String,
      email: session['email'] as String,
      role: UserRole.fromString(session['role'] as String),
      avatarUrl: session['avatar_url'] as String?,
    );
  }

  @override
  Future<void> clearAuth() => _prefs.clearSession();
}
