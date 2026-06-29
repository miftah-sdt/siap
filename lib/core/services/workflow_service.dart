import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/asuransi/data/models/asuransi_model.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/klaim/data/models/klaim_model.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';

class WorkflowService {
  WorkflowService(this._client);

  final DioClient _client;

  Future<Asuransi> transitionAsuransi({
    required String id,
    required String action,
  }) async {
    final response = await _client.post<AsuransiModel>(
      ApiEndpoint.asuransiWorkflow(id, action),
      fromJsonT: (json) =>
          AsuransiModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!.toEntity();
  }

  Future<Klaim> transitionKlaim({
    required String id,
    required String action,
  }) async {
    final response = await _client.post<KlaimModel>(
      ApiEndpoint.klaimWorkflow(id, action),
      fromJsonT: (json) => KlaimModel.fromJson(json! as Map<String, dynamic>),
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!.toEntity();
  }
}
