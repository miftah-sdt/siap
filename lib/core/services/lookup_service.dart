import 'package:siap/core/models/select_option.dart';
import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';

class LookupService {
  LookupService(this._client);

  final DioClient _client;

  Future<List<SelectOption>> getPetaniOptions() async {
    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.petani,
      queryParameters: const {'page': 1, 'limit': 100},
      fromJsonT: (json) => json as List<dynamic>,
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }

    return response.data!.map((raw) {
      final item = raw as Map<String, dynamic>;
      return SelectOption(
        id: item['id'] as String,
        label: item['nama'] as String,
        subtitle: 'NIK: ${item['nik']}',
      );
    }).toList();
  }

  Future<List<SelectOption>> getLahanOptions({String? petaniId}) async {
    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.lahan,
      queryParameters: {
        'page': 1,
        'limit': 100,
        if (petaniId != null && petaniId.isNotEmpty) 'petani_id': petaniId,
      },
      fromJsonT: (json) => json as List<dynamic>,
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }

    return response.data!.map((raw) {
      final item = raw as Map<String, dynamic>;
      final petaniNama = item['petani_nama'] as String? ?? '-';
      final namaLahan = item['nama_lahan'] as String;
      return SelectOption(
        id: item['id'] as String,
        label: '$petaniNama — $namaLahan',
        subtitle:
            '${item['kode_lahan']} • ${item['luas']} ha • ${item['lokasi']}',
        extra: {
          'nama_lahan': namaLahan,
          'petani_id': item['petani_id'] as String? ?? '',
          'petani_nama': petaniNama,
        },
      );
    }).toList();
  }

  Future<List<SelectOption>> getPolisOptions({
    String? status,
    List<String>? statuses,
  }) async {
    if (statuses != null && statuses.isNotEmpty) {
      final merged = <SelectOption>[];
      final seen = <String>{};
      for (final itemStatus in statuses) {
        final options = await getPolisOptions(status: itemStatus);
        for (final option in options) {
          if (seen.add(option.id)) merged.add(option);
        }
      }
      return merged;
    }

    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.asuransi,
      queryParameters: {
        'page': 1,
        'limit': 100,
        if (status != null && status.isNotEmpty) 'status': status,
      },
      fromJsonT: (json) => json as List<dynamic>,
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }

    return response.data!.map((raw) {
      final item = raw as Map<String, dynamic>;
      return SelectOption(
        id: item['id'] as String,
        label: item['nomor_polis'] as String,
        subtitle:
            '${item['petani_nama']} • ${item['lahan_nama']} • ${item['status']}',
        extra: {
          'nomor_polis': item['nomor_polis'] as String,
          'petani_nama': item['petani_nama'] as String,
          'lahan_nama': item['lahan_nama'] as String,
        },
      );
    }).toList();
  }
}
