import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';
import 'package:siap/features/pengguna/domain/repositories/pengguna_repository.dart';

class GetPenggunaListParams {
  const GetPenggunaListParams({
    required this.page,
    this.limit = 10,
    this.search,
  });

  final int page;
  final int limit;
  final String? search;
}

class GetPenggunaListUseCase
    implements UseCase<Result<PenggunaListResult>, GetPenggunaListParams> {
  GetPenggunaListUseCase(this._repository);

  final PenggunaRepository _repository;

  @override
  Future<Result<PenggunaListResult>> call(GetPenggunaListParams params) {
    return _repository.getPenggunaList(
      page: params.page,
      limit: params.limit,
      search: params.search,
    );
  }
}

class GetPenggunaDetailUseCase implements UseCase<Result<Pengguna>, String> {
  GetPenggunaDetailUseCase(this._repository);

  final PenggunaRepository _repository;

  @override
  Future<Result<Pengguna>> call(String id) => _repository.getPenggunaDetail(id);
}

class CreatePenggunaParams {
  const CreatePenggunaParams({
    required this.name,
    required this.email,
    required this.role,
    required this.isActive,
  });

  final String name;
  final String email;
  final UserRole role;
  final bool isActive;
}

class CreatePenggunaUseCase
    implements UseCase<Result<Pengguna>, CreatePenggunaParams> {
  CreatePenggunaUseCase(this._repository);

  final PenggunaRepository _repository;

  @override
  Future<Result<Pengguna>> call(CreatePenggunaParams params) {
    return _repository.createPengguna(
      name: params.name,
      email: params.email,
      role: params.role,
      isActive: params.isActive,
    );
  }
}

class UpdatePenggunaParams {
  const UpdatePenggunaParams({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.isActive,
  });

  final String id;
  final String name;
  final String email;
  final UserRole role;
  final bool isActive;
}

class UpdatePenggunaUseCase
    implements UseCase<Result<Pengguna>, UpdatePenggunaParams> {
  UpdatePenggunaUseCase(this._repository);

  final PenggunaRepository _repository;

  @override
  Future<Result<Pengguna>> call(UpdatePenggunaParams params) {
    return _repository.updatePengguna(
      id: params.id,
      name: params.name,
      email: params.email,
      role: params.role,
      isActive: params.isActive,
    );
  }
}

class DeletePenggunaUseCase implements UseCase<Result<void>, String> {
  DeletePenggunaUseCase(this._repository);

  final PenggunaRepository _repository;

  @override
  Future<Result<void>> call(String id) => _repository.deletePengguna(id);
}
