import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/storage/shared_pref_service.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required SharedPrefService sharedPrefService,
    required Dio dio,
  }) : _sharedPrefService = sharedPrefService,
       _dio = dio;

  final SharedPrefService _sharedPrefService;
  final Dio _dio;

  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _sharedPrefService.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401 ||
        _isAuthEndpoint(err.requestOptions.path)) {
      handler.next(err);
      return;
    }

    try {
      await _refreshTokenIfNeeded();
      final response = await _retry(err.requestOptions);
      handler.resolve(response);
    } catch (_) {
      await _sharedPrefService.clearSession();
      handler.next(err);
    }
  }

  bool _isAuthEndpoint(String path) {
    return path.contains(ApiEndpoint.refreshToken);
  }

  Future<void> _refreshTokenIfNeeded() async {
    if (_isRefreshing) {
      return _refreshCompleter!.future;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<void>();

    try {
      final refreshToken = _sharedPrefService.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        throw StateError('Refresh token not found');
      }

      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoint.refreshToken,
        data: {'refresh_token': refreshToken},
        options: Options(headers: {'Authorization': 'Bearer $refreshToken'}),
      );

      final data = response.data?['data'] as Map<String, dynamic>?;
      final accessToken = data?['access_token'] as String?;
      final newRefreshToken = data?['refresh_token'] as String?;

      if (accessToken == null) {
        throw StateError('Access token not returned');
      }

      await _sharedPrefService.saveAccessToken(accessToken);
      if (newRefreshToken != null) {
        await _sharedPrefService.saveRefreshToken(newRefreshToken);
      }

      _refreshCompleter!.complete();
    } catch (error, stackTrace) {
      _refreshCompleter!.completeError(error, stackTrace);
      rethrow;
    } finally {
      _isRefreshing = false;
      _refreshCompleter = null;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions options) {
    final token = _sharedPrefService.getAccessToken();
    final headers = Map<String, dynamic>.from(options.headers);
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return _dio.request<dynamic>(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(
        method: options.method,
        headers: headers,
        contentType: options.contentType,
        responseType: options.responseType,
        extra: options.extra,
      ),
    );
  }
}

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({required this.enabled});

  final bool enabled;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enabled && kDebugMode) {
      debugPrint('[DIO] --> ${options.method} ${options.uri}');
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (enabled && kDebugMode) {
      debugPrint(
        '[DIO] <-- ${response.statusCode} ${response.requestOptions.uri}',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enabled && kDebugMode) {
      debugPrint(
        '[DIO] xx ${err.response?.statusCode} ${err.requestOptions.uri}',
      );
    }
    handler.next(err);
  }
}
