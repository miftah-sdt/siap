import 'package:siap/core/utils/result.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';

abstract class KlaimRepository {
  Future<Result<KlaimListResult>> getKlaimList({
    required int page,
    required int limit,
    String? search,
  });

  Future<Result<Klaim>> getKlaimDetail(String id);

  Future<Result<Klaim>> createKlaim({
    required String nomorKlaim,
    required String polisId,
    required String polisNomor,
    required String deskripsi,
    required List<String> buktiKerusakan,
  });

  Future<Result<Klaim>> updateKlaim({
    required String id,
    required String nomorKlaim,
    required String polisId,
    required String polisNomor,
    required String deskripsi,
    required List<String> buktiKerusakan,
  });

  Future<Result<void>> deleteKlaim(String id);
}
