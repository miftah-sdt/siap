import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siap/core/constants/app_constants.dart';

class SharedPrefService {
  SharedPrefService(this._prefs);

  final SharedPreferences _prefs;

  Future<bool> saveAccessToken(String token) =>
      _prefs.setString(AppConstants.accessTokenKey, token);

  String? getAccessToken() => _prefs.getString(AppConstants.accessTokenKey);

  Future<bool> saveRefreshToken(String token) =>
      _prefs.setString(AppConstants.refreshTokenKey, token);

  String? getRefreshToken() => _prefs.getString(AppConstants.refreshTokenKey);

  Future<bool> saveUserSession(Map<String, dynamic> session) =>
      _prefs.setString(AppConstants.userSessionKey, jsonEncode(session));

  Map<String, dynamic>? getUserSession() {
    final raw = _prefs.getString(AppConstants.userSessionKey);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<bool> saveUserRole(String role) =>
      _prefs.setString(AppConstants.userRoleKey, role);

  String? getUserRole() => _prefs.getString(AppConstants.userRoleKey);

  Future<bool> saveUserPetaniId(String petaniId) =>
      _prefs.setString(AppConstants.userPetaniIdKey, petaniId);

  String? getUserPetaniId() => _prefs.getString(AppConstants.userPetaniIdKey);

  Future<bool> saveThemeMode(ThemeMode mode) =>
      _prefs.setString(AppConstants.themeModeKey, mode.name);

  ThemeMode getThemeMode() {
    final value = _prefs.getString(AppConstants.themeModeKey);
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  bool get isLoggedIn {
    final token = getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> clearSession() async {
    await _prefs.remove(AppConstants.accessTokenKey);
    await _prefs.remove(AppConstants.refreshTokenKey);
    await _prefs.remove(AppConstants.userSessionKey);
    await _prefs.remove(AppConstants.userRoleKey);
    await _prefs.remove(AppConstants.userPetaniIdKey);
  }

  Future<bool> clearAll() => _prefs.clear();
}
