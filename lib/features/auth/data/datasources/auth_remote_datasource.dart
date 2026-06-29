import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/auth/data/models/auth_response_model.dart';
import 'package:siap/features/auth/data/models/login_request_model.dart';
import 'package:siap/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequestModel request);
  Future<void> logout();
  Future<void> forgotPassword(String email);
  Future<void> resetPassword({required String token, required String password});
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<UserModel> getProfile();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    final response = await _client.post<AuthResponseModel>(
      ApiEndpoint.login,
      data: request.toJson(),
      fromJsonT: (json) =>
          AuthResponseModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  @override
  Future<void> logout() async {
    await _client.post<Map<String, dynamic>>(
      ApiEndpoint.logout,
      fromJsonT: (json) => json as Map<String, dynamic>,
    );
  }

  @override
  Future<void> forgotPassword(String email) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApiEndpoint.forgotPassword,
      data: {'email': email},
      fromJsonT: (json) => json as Map<String, dynamic>,
    );

    if (!response.success) {
      throw Exception(response.message);
    }
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String password,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApiEndpoint.resetPassword,
      data: {'token': token, 'password': password},
      fromJsonT: (json) => json as Map<String, dynamic>,
    );
    if (!response.success) {
      throw Exception(response.message);
    }
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApiEndpoint.changePassword,
      data: {'current_password': currentPassword, 'new_password': newPassword},
      fromJsonT: (json) => json as Map<String, dynamic>,
    );
    if (!response.success) {
      throw Exception(response.message);
    }
  }

  @override
  Future<UserModel> getProfile() async {
    final response = await _client.get<UserModel>(
      ApiEndpoint.profile,
      fromJsonT: (json) => UserModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }
}
