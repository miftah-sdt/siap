import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<Result<void>, NoParams> {
  LogoutUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<void>> call(NoParams params) => _repository.logout();
}
