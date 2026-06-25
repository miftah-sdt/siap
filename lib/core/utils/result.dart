import 'package:siap/core/errors/failure.dart';

sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

final class ErrorResult<T> extends Result<T> {
  const ErrorResult(this.failure);
  final Failure failure;
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isError => this is ErrorResult<T>;

  T? get dataOrNull => switch (this) {
    Success(:final data) => data,
    ErrorResult() => null,
  };

  Failure? get failureOrNull => switch (this) {
    Success() => null,
    ErrorResult(:final failure) => failure,
  };
}
