import 'package:mocktail/mocktail.dart';
import 'package:siap/core/usecase/usecase.dart';
import 'package:siap/features/auth/domain/usecases/login_usecase.dart';
import 'package:siap/features/lahan/data/models/lahan_model.dart';
import 'package:siap/features/lahan/domain/usecases/lahan_usecases.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';
import 'package:siap/features/laporan/domain/usecases/laporan_usecases.dart';

void registerTestFallbacks() {
  registerFallbackValue(
    const LoginParams(email: 'a@b.com', password: 'password'),
  );
  registerFallbackValue(const NoParams());
  registerFallbackValue(const GetLahanListParams(page: 1));
  registerFallbackValue(const LaporanFilter(type: LaporanType.petani));
  registerFallbackValue(
    ExportLaporanParams(
      filter: const LaporanFilter(type: LaporanType.petani),
      format: ExportFormat.pdf,
    ),
  );
  registerFallbackValue(
    const LahanRequestModel(
      kodeLahan: 'LH-001',
      namaLahan: 'Lahan Test',
      luas: 1,
      lokasi: 'Lokasi',
    ),
  );
}
