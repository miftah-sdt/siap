import 'package:siap/core/utils/result.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';

abstract class LahanRepository {
  Future<Result<LahanListResult>> getLahanList({
    required int page,
    required int limit,
    String? search,
    String? petaniId,
  });

  Future<Result<Lahan>> getLahanDetail(String id);

  Future<Result<Lahan>> createLahan({
    required String petaniId,
    required String petaniNama,
    required String kodeLahan,
    required String namaLahan,
    required double luas,
    required String lokasi,
    String? koordinat,
  });

  Future<Result<Lahan>> updateLahan({
    required String id,
    required String petaniId,
    required String petaniNama,
    required String kodeLahan,
    required String namaLahan,
    required double luas,
    required String lokasi,
    String? koordinat,
  });

  Future<Result<void>> deleteLahan(String id);
}
