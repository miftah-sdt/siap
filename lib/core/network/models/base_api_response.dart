import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_api_response.freezed.dart';
part 'base_api_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseApiResponse<T> with _$BaseApiResponse<T> {
  const factory BaseApiResponse({
    @Default(false) bool success,
    @Default('') String message,
    T? data,
    ResponseMeta? meta,
    Map<String, dynamic>? errors,
  }) = _BaseApiResponse<T>;

  factory BaseApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseApiResponseFromJson(json, fromJsonT);
}

@freezed
abstract class ResponseMeta with _$ResponseMeta {
  const factory ResponseMeta({
    int? page,
    @JsonKey(name: 'per_page') int? perPage,
    int? total,
    @JsonKey(name: 'total_pages') int? totalPages,
  }) = _ResponseMeta;

  factory ResponseMeta.fromJson(Map<String, dynamic> json) =>
      _$ResponseMetaFromJson(json);
}
