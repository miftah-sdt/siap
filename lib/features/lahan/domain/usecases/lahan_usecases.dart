import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';
import 'package:siap/features/lahan/domain/repositories/lahan_repository.dart';

class GetLahanListParams {
  const GetLahanListParams({
    required this.page,
    this.limit = 10,
    this.search,
    this.petaniId,
  });

  final int page;
  final int limit;
  final String? search;
  final String? petaniId;
}

class GetLahanListUseCase
    implements UseCase<Result<LahanListResult>, GetLahanListParams> {
  GetLahanListUseCase(this._repository);

  final LahanRepository _repository;

  @override
  Future<Result<LahanListResult>> call(GetLahanListParams params) {
    return _repository.getLahanList(
      page: params.page,
      limit: params.limit,
      search: params.search,
      petaniId: params.petaniId,
    );
  }
}

class GetLahanDetailUseCase implements UseCase<Result<Lahan>, String> {
  GetLahanDetailUseCase(this._repository);

  final LahanRepository _repository;

  @override
  Future<Result<Lahan>> call(String id) => _repository.getLahanDetail(id);
}

class CreateLahanParams {
  const CreateLahanParams({
    required this.petaniId,
    required this.petaniNama,
    required this.kodeLahan,
    required this.namaLahan,
    required this.luas,
    required this.lokasi,
    this.koordinat,
  });

  final String petaniId;
  final String petaniNama;
  final String kodeLahan;
  final String namaLahan;
  final double luas;
  final String lokasi;
  final String? koordinat;
}

class CreateLahanUseCase implements UseCase<Result<Lahan>, CreateLahanParams> {
  CreateLahanUseCase(this._repository);

  final LahanRepository _repository;

  @override
  Future<Result<Lahan>> call(CreateLahanParams params) {
    return _repository.createLahan(
      petaniId: params.petaniId,
      petaniNama: params.petaniNama,
      kodeLahan: params.kodeLahan,
      namaLahan: params.namaLahan,
      luas: params.luas,
      lokasi: params.lokasi,
      koordinat: params.koordinat,
    );
  }
}

class UpdateLahanParams {
  const UpdateLahanParams({
    required this.id,
    required this.petaniId,
    required this.petaniNama,
    required this.kodeLahan,
    required this.namaLahan,
    required this.luas,
    required this.lokasi,
    this.koordinat,
  });

  final String id;
  final String petaniId;
  final String petaniNama;
  final String kodeLahan;
  final String namaLahan;
  final double luas;
  final String lokasi;
  final String? koordinat;
}

class UpdateLahanUseCase implements UseCase<Result<Lahan>, UpdateLahanParams> {
  UpdateLahanUseCase(this._repository);

  final LahanRepository _repository;

  @override
  Future<Result<Lahan>> call(UpdateLahanParams params) {
    return _repository.updateLahan(
      id: params.id,
      petaniId: params.petaniId,
      petaniNama: params.petaniNama,
      kodeLahan: params.kodeLahan,
      namaLahan: params.namaLahan,
      luas: params.luas,
      lokasi: params.lokasi,
      koordinat: params.koordinat,
    );
  }
}

class DeleteLahanUseCase implements UseCase<Result<void>, String> {
  DeleteLahanUseCase(this._repository);

  final LahanRepository _repository;

  @override
  Future<Result<void>> call(String id) => _repository.deleteLahan(id);
}
