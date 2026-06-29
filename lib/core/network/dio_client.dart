import 'package:dio/dio.dart';
import 'package:siap/core/config/app_config.dart';
import 'package:siap/core/network/dio_interceptor.dart';
import 'package:siap/core/network/models/base_api_response.dart';
import 'package:siap/core/network/network_exceptions.dart';
import 'package:siap/core/network/ssl_pinning.dart';
import 'package:siap/core/storage/shared_pref_service.dart';

class DioClient {
  DioClient({
    required AppConfig appConfig,
    required SharedPrefService sharedPrefService,
  }) : _appConfig = appConfig,
       _sharedPrefService = sharedPrefService {
    _dio = Dio(
      BaseOptions(
        baseUrl: _appConfig.baseUrl,
        connectTimeout: _appConfig.connectTimeout,
        receiveTimeout: _appConfig.receiveTimeout,
        headers: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(sharedPrefService: _sharedPrefService, dio: _dio),
      LoggingInterceptor(enabled: _appConfig.enableNetworkLogging),
    ]);

    configureSslPinning(_dio, _appConfig.sslPinningConfig);
  }

  final AppConfig _appConfig;
  final SharedPrefService _sharedPrefService;
  late final Dio _dio;

  Dio get dio => _dio;

  Future<BaseApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  }) => _request(
    () =>
        _dio.get<Map<String, dynamic>>(path, queryParameters: queryParameters),
    fromJsonT: fromJsonT,
  );

  Future<BaseApiResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  }) => _request(
    () => _dio.post<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    ),
    fromJsonT: fromJsonT,
  );

  Future<BaseApiResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  }) => _request(
    () => _dio.put<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    ),
    fromJsonT: fromJsonT,
  );

  Future<BaseApiResponse<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  }) => _request(
    () => _dio.patch<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    ),
    fromJsonT: fromJsonT,
  );

  Future<BaseApiResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  }) => _request(
    () => _dio.delete<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    ),
    fromJsonT: fromJsonT,
  );

  Future<BaseApiResponse<T>> _request<T>(
    Future<Response<Map<String, dynamic>>> Function() call, {
    required T Function(Object? json) fromJsonT,
  }) async {
    try {
      final response = await call();
      final data = response.data;
      if (data == null) {
        return const BaseApiResponse(
          success: false,
          message: 'Response kosong dari server.',
        );
      }
      return BaseApiResponse.fromJson(data, fromJsonT);
    } on DioException catch (error) {
      throw NetworkExceptionHandler.handle(error);
    }
  }
}
