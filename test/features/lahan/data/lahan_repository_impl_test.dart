import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:siap/core/errors/exception.dart';
import 'package:siap/core/errors/failure.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/lahan/data/datasources/lahan_remote_datasource.dart';
import 'package:siap/features/lahan/data/models/lahan_model.dart';
import 'package:siap/features/lahan/data/repositories/lahan_repository_impl.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';
import '../../../helpers/fallback_values.dart';

class MockLahanRemoteDataSource extends Mock implements LahanRemoteDataSource {}

void main() {
  late MockLahanRemoteDataSource remote;
  late LahanRepositoryImpl repository;

  const lahanModel = LahanModel(
    id: '1',
    petaniId: 'p1',
    petaniNama: 'Budi Santoso',
    kodeLahan: 'LH-001',
    namaLahan: 'Sawah A',
    luas: 2.5,
    lokasi: 'Subang',
    koordinat: '-6.123,107.456',
  );

  setUpAll(registerTestFallbacks);

  setUp(() {
    remote = MockLahanRemoteDataSource();
    repository = LahanRepositoryImpl(remote);
  });

  group('LahanRepositoryImpl.getLahanList', () {
    test('returns list on success', () async {
      const listResult = LahanListResult(
        items: [],
        page: 1,
        totalPages: 1,
        total: 0,
      );

      when(
        () => remote.getLahanList(
          page: 1,
          limit: 10,
          search: null,
          petaniId: null,
        ),
      ).thenAnswer((_) async => listResult);

      final result = await repository.getLahanList(page: 1, limit: 10);

      expect(result, isA<Success<LahanListResult>>());
    });

    test('returns ServerFailure on AppException', () async {
      when(
        () => remote.getLahanList(
          page: any(named: 'page'),
          limit: any(named: 'limit'),
          search: any(named: 'search'),
          petaniId: any(named: 'petaniId'),
        ),
      ).thenThrow(
        const ServerException(message: 'Server error', statusCode: 500),
      );

      final result = await repository.getLahanList(page: 1, limit: 10);

      expect(result, isA<ErrorResult>());
      expect((result as ErrorResult).failure, isA<ServerFailure>());
    });
  });

  group('LahanRepositoryImpl.createLahan', () {
    test('returns created lahan entity', () async {
      when(() => remote.createLahan(any())).thenAnswer((_) async => lahanModel);

      final result = await repository.createLahan(
        petaniId: 'p1',
        petaniNama: 'Budi Santoso',
        kodeLahan: 'LH-001',
        namaLahan: 'Sawah A',
        luas: 2.5,
        lokasi: 'Subang',
      );

      expect(result, isA<Success<Lahan>>());
      expect((result as Success<Lahan>).data.namaLahan, 'Sawah A');
    });
  });
}
