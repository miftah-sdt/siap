import 'package:siap/core/models/rfi_models.dart';
import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';

class RfiRemoteService {
  RfiRemoteService(this._client);

  final DioClient _client;

  Future<UnderwritingScore> scoreLahan(String lahanId) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApiEndpoint.underwritingScore,
      data: {'lahan_id': lahanId},
      fromJsonT: (json) => json as Map<String, dynamic>,
    );
    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return UnderwritingScore.fromJson(response.data!);
  }

  Future<UnderwritingScore> scoreAsuransi(String asuransiId) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApiEndpoint.underwritingScore,
      data: {'asuransi_id': asuransiId},
      fromJsonT: (json) => json as Map<String, dynamic>,
    );
    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return UnderwritingScore.fromAsuransiJson(response.data!);
  }

  Future<List<OptAlert>> getOptAlerts({String? lahanId, String? region}) async {
    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.optAlerts,
      queryParameters: {
        if (lahanId != null) 'lahan_id': lahanId,
        if (region != null) 'region': region,
      },
      fromJsonT: (json) => json as List<dynamic>,
    );
    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!
        .map((e) => OptAlert.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Map<String, dynamic>> submitToAskrindo(String asuransiId) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApiEndpoint.askrindoPolicies,
      data: {'asuransi_id': asuransiId},
      fromJsonT: (json) => json as Map<String, dynamic>,
    );
    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }
}
