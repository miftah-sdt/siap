import 'package:dio/dio.dart';
import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/security/threat_event.dart';

class ThreatReportService {
  ThreatReportService(this._dio);

  final Dio _dio;

  Future<ThreatReportResult> reportThreat({
    required ThreatEvent event,
    String? userId,
    String? appVersion,
    String? idempotencyKey,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoint.securityThreats,
        data: event.toApiPayload(userId: userId, appVersion: appVersion),
        options: Options(
          headers: {
            if (idempotencyKey != null) 'X-Idempotency-Key': idempotencyKey,
          },
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );

      final body = response.data;
      if (body == null) {
        return const ThreatReportResult(
          success: false,
          message: 'Response kosong',
        );
      }

      return ThreatReportResult(
        success: body['success'] as bool? ?? false,
        message: body['message'] as String? ?? '',
        reportId: (body['data'] as Map<String, dynamic>?)?['id'] as String?,
      );
    } on DioException catch (error) {
      return ThreatReportResult(
        success: false,
        message: error.message ?? 'Gagal mengirim laporan ancaman',
      );
    }
  }
}

class ThreatReportResult {
  const ThreatReportResult({
    required this.success,
    required this.message,
    this.reportId,
  });

  final bool success;
  final String message;
  final String? reportId;
}
