import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/asuransi/domain/repositories/asuransi_repository.dart';

class GetAsuransiListParams {
  const GetAsuransiListParams({
    required this.page,
    this.limit = 10,
    this.search,
  });

  final int page;
  final int limit;
  final String? search;
}

class GetAsuransiListUseCase
    implements UseCase<Result<AsuransiListResult>, GetAsuransiListParams> {
  GetAsuransiListUseCase(this._repository);

  final AsuransiRepository _repository;

  @override
  Future<Result<AsuransiListResult>> call(GetAsuransiListParams params) {
    return _repository.getAsuransiList(
      page: params.page,
      limit: params.limit,
      search: params.search,
    );
  }
}

class GetAsuransiDetailUseCase implements UseCase<Result<Asuransi>, String> {
  GetAsuransiDetailUseCase(this._repository);

  final AsuransiRepository _repository;

  @override
  Future<Result<Asuransi>> call(String id) => _repository.getAsuransiDetail(id);
}

class CreateAsuransiParams {
  const CreateAsuransiParams({
    required this.nomorPolis,
    required this.petaniId,
    required this.petaniNama,
    required this.lahanId,
    required this.lahanNama,
    required this.documents,
  });

  final String nomorPolis;
  final String petaniId;
  final String petaniNama;
  final String lahanId;
  final String lahanNama;
  final List<String> documents;
}

class CreateAsuransiUseCase
    implements UseCase<Result<Asuransi>, CreateAsuransiParams> {
  CreateAsuransiUseCase(this._repository);

  final AsuransiRepository _repository;

  @override
  Future<Result<Asuransi>> call(CreateAsuransiParams params) {
    return _repository.createAsuransi(
      nomorPolis: params.nomorPolis,
      petaniId: params.petaniId,
      petaniNama: params.petaniNama,
      lahanId: params.lahanId,
      lahanNama: params.lahanNama,
      documents: params.documents,
    );
  }
}

class UpdateAsuransiParams {
  const UpdateAsuransiParams({
    required this.id,
    required this.nomorPolis,
    required this.petaniId,
    required this.petaniNama,
    required this.lahanId,
    required this.lahanNama,
    required this.documents,
  });

  final String id;
  final String nomorPolis;
  final String petaniId;
  final String petaniNama;
  final String lahanId;
  final String lahanNama;
  final List<String> documents;
}

class UpdateAsuransiUseCase
    implements UseCase<Result<Asuransi>, UpdateAsuransiParams> {
  UpdateAsuransiUseCase(this._repository);

  final AsuransiRepository _repository;

  @override
  Future<Result<Asuransi>> call(UpdateAsuransiParams params) {
    return _repository.updateAsuransi(
      id: params.id,
      nomorPolis: params.nomorPolis,
      petaniId: params.petaniId,
      petaniNama: params.petaniNama,
      lahanId: params.lahanId,
      lahanNama: params.lahanNama,
      documents: params.documents,
    );
  }
}

class DeleteAsuransiUseCase implements UseCase<Result<void>, String> {
  DeleteAsuransiUseCase(this._repository);

  final AsuransiRepository _repository;

  @override
  Future<Result<void>> call(String id) => _repository.deleteAsuransi(id);
}
