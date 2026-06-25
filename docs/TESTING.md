# Panduan Testing

## Struktur Test

```
test/
├── core/
│   └── utils/          # Unit test utilities (validators, mapper)
├── features/
│   ├── auth/
│   │   ├── domain/     # Use case tests
│   │   ├── data/       # Repository tests
│   │   └── presentation/ # Bloc tests
│   ├── lahan/
│   ├── laporan/
│   └── petani/
├── routes/             # Role guard tests
├── helpers/            # Mocktail fallback values
└── widget_test.dart    # Widget smoke tests
```

## Menjalankan Test

```bash
# Semua test
flutter test

# Satu file
flutter test test/core/utils/validators_test.dart

# Satu folder
flutter test test/features/auth/

# Dengan coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html  # optional, butuh lcov
```

## Jenis Test

### Unit Test — Use Case

Mock repository, test logic use case:

```dart
when(() => repository.login(...)).thenAnswer((_) async => Success(user));
final result = await useCase(LoginParams(...));
expect(result, isA<Success<User>>());
```

### Repository Test

Mock datasource, verify mapping exception → failure:

```dart
when(() => remote.getList(...)).thenThrow(ServerException(...));
final result = await repository.getList(...);
expect(result, isA<ErrorResult>());
```

### Bloc Test

Gunakan `bloc_test` package:

```dart
blocTest<MyBloc, MyState>(
  'emits success when data loads',
  build: () => MyBloc(useCase: mockUseCase),
  act: (bloc) => bloc.add(const MyEvent.started()),
  expect: () => [MyState.loading(), isA<MySuccess>()],
);
```

### Widget Test

Smoke test untuk komponen UI tanpa full app bootstrap:

```dart
await tester.pumpWidget(MaterialApp(home: MyWidget()));
expect(find.text('Expected'), findsOneWidget);
```

## Mocking

Package: **mocktail**

Register fallback values untuk generic matchers:

```dart
setUpAll(() {
  registerFallbackValue(const LoginParams(email: 'a@b.com', password: 'pass'));
});
```

Helper terpusat: `test/helpers/fallback_values.dart`

## Coverage Target (Rekomendasi)

| Layer | Target |
|-------|--------|
| Domain (use cases) | ≥ 80% |
| Data (repositories) | ≥ 70% |
| Presentation (blocs) | ≥ 60% |
| Widgets | Smoke tests |

## Menambah Test Baru

1. Buat file mirror struktur `lib/` di `test/`
2. Mock dependency dengan `mocktail`
3. Test happy path + error path
4. Jalankan `flutter test` sebelum commit

## CI Integration

Test dijalankan otomatis di GitHub Actions setiap push/PR ke `main` atau `develop`. Lihat [CI_CD.md](CI_CD.md).
