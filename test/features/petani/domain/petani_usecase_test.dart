import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';
import 'package:siap/features/petani/domain/repositories/petani_repository.dart';
import 'package:siap/features/petani/domain/usecases/petani_usecases.dart';

class MockPetaniRepository extends Mock implements PetaniRepository {}

void main() {
  late MockPetaniRepository repository;
  late GetPetaniListUseCase useCase;

  setUp(() {
    repository = MockPetaniRepository();
    useCase = GetPetaniListUseCase(repository);
  });

  test('GetPetaniListUseCase returns list on success', () async {
    const result = PetaniListResult(
      items: [],
      page: 1,
      totalPages: 1,
      total: 0,
    );

    when(
      () => repository.getPetaniList(page: 1, limit: 10, search: null),
    ).thenAnswer((_) async => const Success(result));

    final response = await useCase(const GetPetaniListParams(page: 1));

    expect(response, isA<Success<PetaniListResult>>());
  });
}
