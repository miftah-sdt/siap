import 'package:siap/core/utils/result.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';

abstract class PetaniRepository {
  Future<Result<PetaniListResult>> getPetaniList({
    required int page,
    required int limit,
    String? search,
  });

  Future<Result<Petani>> getPetaniDetail(String id);

  Future<Result<Petani>> createPetani({
    required String nik,
    required String nama,
    required String alamat,
    required String noHp,
    required String kelompokTani,
  });

  Future<Result<Petani>> updatePetani({
    required String id,
    required String nik,
    required String nama,
    required String alamat,
    required String noHp,
    required String kelompokTani,
  });

  Future<Result<void>> deletePetani(String id);
}
