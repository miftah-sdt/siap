import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/exception_mapper.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/pengguna/data/datasources/pengguna_remote_datasource.dart';
import 'package:siap/features/pengguna/data/models/pengguna_model.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';
import 'package:siap/features/pengguna/domain/repositories/pengguna_repository.dart';

class PenggunaRepositoryImpl implements PenggunaRepository {
  PenggunaRepositoryImpl(this._remote);

  final PenggunaRemoteDataSource _remote;

  PenggunaRequestModel _toRequest({
    required String name,
    required String email,
    required UserRole role,
    required bool isActive,
  }) {
    return PenggunaRequestModel(
      name: name,
      email: email,
      role: role.name,
      isActive: isActive,
    );
  }

  @override
  Future<Result<PenggunaListResult>> getPenggunaList({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final result = await _remote.getPenggunaList(
        page: page,
        limit: limit,
        search: search,
      );
      return Success(result);
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Pengguna>> getPenggunaDetail(String id) async {
    try {
      final model = await _remote.getPenggunaDetail(id);
      return Success(model.toEntity());
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Pengguna>> createPengguna({
    required String name,
    required String email,
    required UserRole role,
    required bool isActive,
  }) async {
    try {
      final model = await _remote.createPengguna(
        _toRequest(name: name, email: email, role: role, isActive: isActive),
      );
      return Success(model.toEntity());
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Pengguna>> updatePengguna({
    required String id,
    required String name,
    required String email,
    required UserRole role,
    required bool isActive,
  }) async {
    try {
      final model = await _remote.updatePengguna(
        id,
        _toRequest(name: name, email: email, role: role, isActive: isActive),
      );
      return Success(model.toEntity());
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> deletePengguna(String id) async {
    try {
      await _remote.deletePengguna(id);
      return const Success(null);
    } on AppException catch (e) {
      return ErrorResult(mapExceptionToFailure(e));
    } catch (e) {
      return ErrorResult(UnknownFailure(message: e.toString()));
    }
  }
}
