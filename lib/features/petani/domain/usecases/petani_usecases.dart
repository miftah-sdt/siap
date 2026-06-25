import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';
import 'package:siap/features/petani/domain/repositories/petani_repository.dart';

class GetPetaniListParams {
  const GetPetaniListParams({required this.page, this.limit = 10, this.search});

  final int page;
  final int limit;
  final String? search;
}

class GetPetaniListUseCase
    implements UseCase<Result<PetaniListResult>, GetPetaniListParams> {
  GetPetaniListUseCase(this._repository);

  final PetaniRepository _repository;

  @override
  Future<Result<PetaniListResult>> call(GetPetaniListParams params) {
    return _repository.getPetaniList(
      page: params.page,
      limit: params.limit,
      search: params.search,
    );
  }
}

class GetPetaniDetailUseCase implements UseCase<Result<Petani>, String> {
  GetPetaniDetailUseCase(this._repository);

  final PetaniRepository _repository;

  @override
  Future<Result<Petani>> call(String id) => _repository.getPetaniDetail(id);
}

class CreatePetaniParams {
  const CreatePetaniParams({
    required this.nik,
    required this.nama,
    required this.alamat,
    required this.noHp,
    required this.kelompokTani,
  });

  final String nik;
  final String nama;
  final String alamat;
  final String noHp;
  final String kelompokTani;
}

class CreatePetaniUseCase
    implements UseCase<Result<Petani>, CreatePetaniParams> {
  CreatePetaniUseCase(this._repository);

  final PetaniRepository _repository;

  @override
  Future<Result<Petani>> call(CreatePetaniParams params) {
    return _repository.createPetani(
      nik: params.nik,
      nama: params.nama,
      alamat: params.alamat,
      noHp: params.noHp,
      kelompokTani: params.kelompokTani,
    );
  }
}

class UpdatePetaniParams {
  const UpdatePetaniParams({
    required this.id,
    required this.nik,
    required this.nama,
    required this.alamat,
    required this.noHp,
    required this.kelompokTani,
  });

  final String id;
  final String nik;
  final String nama;
  final String alamat;
  final String noHp;
  final String kelompokTani;
}

class UpdatePetaniUseCase
    implements UseCase<Result<Petani>, UpdatePetaniParams> {
  UpdatePetaniUseCase(this._repository);

  final PetaniRepository _repository;

  @override
  Future<Result<Petani>> call(UpdatePetaniParams params) {
    return _repository.updatePetani(
      id: params.id,
      nik: params.nik,
      nama: params.nama,
      alamat: params.alamat,
      noHp: params.noHp,
      kelompokTani: params.kelompokTani,
    );
  }
}

class DeletePetaniUseCase implements UseCase<Result<void>, String> {
  DeletePetaniUseCase(this._repository);

  final PetaniRepository _repository;

  @override
  Future<Result<void>> call(String id) => _repository.deletePetani(id);
}
