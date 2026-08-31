import 'package:siap/core/models/select_option.dart';
import 'package:siap/core/network/api_endpoint.dart';
import 'package:siap/core/network/dio_client.dart';

class LookupService {
  LookupService(this._client);

  final DioClient _client;

  Future<List<SelectOption>> getPetaniOptions({String? search}) async {
    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.petani,
      queryParameters: {
        'page': 1,
        'limit': 30,
        if (search != null && search.isNotEmpty) 'search': search,
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
        label: item['nama'] as String? ?? '-',
        subtitle: 'NIK: ${item['nik'] ?? '-'}',
      );
    }).toList();
  }

  Future<SelectOption> getPetaniById(String id) async {
    final response = await _client.get<Map<String, dynamic>>(
      ApiEndpoint.petaniDetail(id),
      fromJsonT: (json) => json as Map<String, dynamic>,
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }

    final item = response.data!;
    return SelectOption(
      id: item['id'] as String,
      label: item['nama'] as String? ?? '-',
      subtitle: 'NIK: ${item['nik'] ?? '-'}',
    );
  }

  Future<List<SelectOption>> getLahanOptions({
    String? petaniId,
    String? search,
  }) async {
    final response = await _client.get<List<dynamic>>(
      ApiEndpoint.lahan,
      queryParameters: {
        'page': 1,
        'limit': 30,
        if (petaniId != null && petaniId.isNotEmpty) 'petani_id': petaniId,
        if (search != null && search.isNotEmpty) 'search': search,
      },
      fromJsonT: (json) => json as List<dynamic>,
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }

    return response.data!.map(_mapLahan).toList();
  }

  Future<SelectOption> getLahanById(String id) async {
    final response = await _client.get<Map<String, dynamic>>(
      ApiEndpoint.lahanDetail(id),
      fromJsonT: (json) => json as Map<String, dynamic>,
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }

    return _mapLahan(response.data!);
  }

  SelectOption _mapLahan(dynamic raw) {
    final item = raw as Map<String, dynamic>;
    final petaniNama = item['petani_nama'] as String? ?? '-';
    final namaLahan = item['nama_lahan'] as String? ?? '-';
    return SelectOption(
      id: item['id'] as String,
      label: '$petaniNama — $namaLahan',
      subtitle:
          '${item['kode_lahan'] ?? '-'} • ${item['luas']} ha • ${item['lokasi'] ?? '-'}',
      extra: {
        'nama_lahan': namaLahan,
        'petani_id': item['petani_id'] as String? ?? '',
        'petani_nama': petaniNama,
      },
    );
  }

  Future<List<SelectOption>> getPolisOptions({
    String? status,
    List<String>? statuses,
    String? search,
  }) async {
    if (statuses != null && statuses.isNotEmpty) {
      final merged = <SelectOption>[];
      final seen = <String>{};
      for (final itemStatus in statuses) {
        final options = await getPolisOptions(
          status: itemStatus,
          search: search,
        );
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
        'limit': 30,
        if (status != null && status.isNotEmpty) 'status': status,
        if (search != null && search.isNotEmpty) 'search': search,
      },
      fromJsonT: (json) => json as List<dynamic>,
    );

    if (!response.success || response.data == null) {
      throw Exception(response.message);
    }

    return response.data!.map(_mapPolis).toList();
  }

  SelectOption _mapPolis(dynamic raw) {
    final item = raw as Map<String, dynamic>;
    return SelectOption(
      id: item['id'] as String,
      label: item['nomor_polis'] as String? ?? '-',
      subtitle:
          '${item['petani_nama'] ?? '-'} • ${item['lahan_nama'] ?? '-'} • ${item['status'] ?? '-'}',
      extra: {
        'nomor_polis': item['nomor_polis'] as String? ?? '',
        'petani_nama': item['petani_nama'] as String? ?? '',
        'lahan_nama': item['lahan_nama'] as String? ?? '',
      },
    );
  }
}
