import 'package:siap/core/utils/result.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';

abstract class AsuransiRepository {
  Future<Result<AsuransiListResult>> getAsuransiList({
    required int page,
    required int limit,
    String? search,
  });

  Future<Result<Asuransi>> getAsuransiDetail(String id);

  Future<Result<Asuransi>> createAsuransi({
    required String nomorPolis,
    required String petaniId,
    required String petaniNama,
    required String lahanId,
    required String lahanNama,
    required List<String> documents,
  });

  Future<Result<Asuransi>> updateAsuransi({
    required String id,
    required String nomorPolis,
    required String petaniId,
    required String petaniNama,
    required String lahanId,
    required String lahanNama,
    required List<String> documents,
  });

  Future<Result<void>> deleteAsuransi(String id);
}
