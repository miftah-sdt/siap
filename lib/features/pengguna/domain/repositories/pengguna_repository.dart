import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';

abstract class PenggunaRepository {
  Future<Result<PenggunaListResult>> getPenggunaList({
    required int page,
    required int limit,
    String? search,
  });

  Future<Result<Pengguna>> getPenggunaDetail(String id);

  Future<Result<Pengguna>> createPengguna({
    required String name,
    required String email,
    required UserRole role,
    required bool isActive,
  });

  Future<Result<Pengguna>> updatePengguna({
    required String id,
    required String name,
    required String email,
    required UserRole role,
    required bool isActive,
  });

  Future<Result<void>> deletePengguna(String id);
}
