import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/features/petani/data/models/petani_model.dart';

class RegistrationService {
  RegistrationService(this._client);

  final DioClient _client;

  Future<void> registerPetani({
    required String nik,
    required String nama,
    required String alamat,
    required String noHp,
    required String kelompokTani,
    required String email,
    required String password,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApiEndpoint.registerPetani,
      data: {
        'nik': nik,
        'nama': nama,
        'alamat': alamat,
        'no_hp': noHp,
        'kelompok_tani': kelompokTani,
        'email': email,
        'password': password,
      },
      fromJsonT: (json) => json as Map<String, dynamic>,
    );

    if (!response.success) {
      throw Exception(response.message);
    }
  }

  Future<PetaniModel> approvePetani(String id) async {
    final response = await _client.post<PetaniModel>(
      ApiEndpoint.petaniApprove(id),
      fromJsonT: (json) => PetaniModel.fromJson(json! as Map<String, dynamic>),
    );
    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  Future<PetaniModel> rejectPetani(String id) async {
    final response = await _client.post<PetaniModel>(
      ApiEndpoint.petaniReject(id),
      fromJsonT: (json) => PetaniModel.fromJson(json! as Map<String, dynamic>),
    );
    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }
    return response.data!;
  }
}
