import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/features/klaim/domain/repositories/klaim_repository.dart';

class GetKlaimListParams {
  const GetKlaimListParams({required this.page, this.limit = 10, this.search});

  final int page;
  final int limit;
  final String? search;
}

class GetKlaimListUseCase
    implements UseCase<Result<KlaimListResult>, GetKlaimListParams> {
  GetKlaimListUseCase(this._repository);

  final KlaimRepository _repository;

  @override
  Future<Result<KlaimListResult>> call(GetKlaimListParams params) {
    return _repository.getKlaimList(
      page: params.page,
      limit: params.limit,
      search: params.search,
    );
  }
}

class GetKlaimDetailUseCase implements UseCase<Result<Klaim>, String> {
  GetKlaimDetailUseCase(this._repository);

  final KlaimRepository _repository;

  @override
  Future<Result<Klaim>> call(String id) => _repository.getKlaimDetail(id);
}

class CreateKlaimParams {
  const CreateKlaimParams({
    required this.nomorKlaim,
    required this.polisId,
    required this.polisNomor,
    required this.deskripsi,
    required this.buktiKerusakan,
  });

  final String nomorKlaim;
  final String polisId;
  final String polisNomor;
  final String deskripsi;
  final List<String> buktiKerusakan;
}

class CreateKlaimUseCase implements UseCase<Result<Klaim>, CreateKlaimParams> {
  CreateKlaimUseCase(this._repository);

  final KlaimRepository _repository;

  @override
  Future<Result<Klaim>> call(CreateKlaimParams params) {
    return _repository.createKlaim(
      nomorKlaim: params.nomorKlaim,
      polisId: params.polisId,
      polisNomor: params.polisNomor,
      deskripsi: params.deskripsi,
      buktiKerusakan: params.buktiKerusakan,
    );
  }
}

class UpdateKlaimParams {
  const UpdateKlaimParams({
    required this.id,
    required this.nomorKlaim,
    required this.polisId,
    required this.polisNomor,
    required this.deskripsi,
    required this.buktiKerusakan,
  });

  final String id;
  final String nomorKlaim;
  final String polisId;
  final String polisNomor;
  final String deskripsi;
  final List<String> buktiKerusakan;
}

class UpdateKlaimUseCase implements UseCase<Result<Klaim>, UpdateKlaimParams> {
  UpdateKlaimUseCase(this._repository);

  final KlaimRepository _repository;

  @override
  Future<Result<Klaim>> call(UpdateKlaimParams params) {
    return _repository.updateKlaim(
      id: params.id,
      nomorKlaim: params.nomorKlaim,
      polisId: params.polisId,
      polisNomor: params.polisNomor,
      deskripsi: params.deskripsi,
      buktiKerusakan: params.buktiKerusakan,
    );
  }
}

class DeleteKlaimUseCase implements UseCase<Result<void>, String> {
  DeleteKlaimUseCase(this._repository);

  final KlaimRepository _repository;

  @override
  Future<Result<void>> call(String id) => _repository.deleteKlaim(id);
}
