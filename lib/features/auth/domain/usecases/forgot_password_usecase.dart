import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordParams {
  const ForgotPasswordParams({required this.email});
  final String email;
}

class ForgotPasswordUseCase
    implements UseCase<Result<void>, ForgotPasswordParams> {
  ForgotPasswordUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<void>> call(ForgotPasswordParams params) {
    return _repository.forgotPassword(email: params.email);
  }
}
