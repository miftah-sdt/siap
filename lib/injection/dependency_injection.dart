import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siap/core/config/app_config.dart';
import 'package:siap/core/database/local_cache_service.dart';
import 'package:siap/core/network/dio_client.dart';
import 'package:siap/core/network/file_remote_datasource.dart';
import 'package:siap/core/services/connectivity_service.dart';
import 'package:siap/core/services/download_service.dart';
import 'package:siap/core/services/registration_service.dart';
import 'package:siap/core/services/report_export_service.dart';
import 'package:siap/core/services/workflow_service.dart';
import 'package:siap/core/services/location_service.dart';
import 'package:siap/core/services/lookup_service.dart';
import 'package:siap/core/services/open_meteo_service.dart';
import 'package:siap/core/services/rfi_remote_service.dart';
import 'package:siap/core/services/media_picker_service.dart';
import 'package:siap/core/services/notification_service.dart';
import 'package:siap/core/storage/shared_pref_service.dart';
import 'package:siap/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:siap/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:siap/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:siap/features/auth/domain/repositories/auth_repository.dart';
import 'package:siap/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:siap/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:siap/features/auth/domain/usecases/login_usecase.dart';
import 'package:siap/features/auth/domain/usecases/logout_usecase.dart';
import 'package:siap/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:siap/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:siap/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:siap/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:siap/features/dashboard/domain/usecases/dashboard_usecases.dart';
import 'package:siap/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:siap/features/lahan/data/datasources/lahan_remote_datasource.dart';
import 'package:siap/features/lahan/data/repositories/lahan_repository_impl.dart';
import 'package:siap/features/lahan/domain/repositories/lahan_repository.dart';
import 'package:siap/features/lahan/domain/usecases/lahan_usecases.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_form_bloc.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_list_bloc.dart';
import 'package:siap/features/petani/data/datasources/petani_remote_datasource.dart';
import 'package:siap/features/petani/data/repositories/petani_repository_impl.dart';
import 'package:siap/features/petani/domain/repositories/petani_repository.dart';
import 'package:siap/features/petani/domain/usecases/petani_usecases.dart';
import 'package:siap/features/laporan/data/datasources/laporan_remote_datasource.dart';
import 'package:siap/features/laporan/data/repositories/laporan_repository_impl.dart';
import 'package:siap/features/laporan/domain/repositories/laporan_repository.dart';
import 'package:siap/features/laporan/domain/usecases/laporan_usecases.dart';
import 'package:siap/features/laporan/presentation/bloc/laporan_bloc.dart';
import 'package:siap/features/pengguna/data/datasources/pengguna_remote_datasource.dart';
import 'package:siap/features/pengguna/data/repositories/pengguna_repository_impl.dart';
import 'package:siap/features/pengguna/domain/repositories/pengguna_repository.dart';
import 'package:siap/features/pengguna/domain/usecases/pengguna_usecases.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_form_bloc.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_list_bloc.dart';
import 'package:siap/features/petani/presentation/bloc/petani_form_bloc.dart';
import 'package:siap/features/petani/presentation/bloc/petani_list_bloc.dart';
import 'package:siap/features/asuransi/data/datasources/asuransi_remote_datasource.dart';
import 'package:siap/features/asuransi/data/repositories/asuransi_repository_impl.dart';
import 'package:siap/features/asuransi/domain/repositories/asuransi_repository.dart';
import 'package:siap/features/asuransi/domain/usecases/asuransi_usecases.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_bloc.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_list_bloc.dart';
import 'package:siap/features/klaim/data/datasources/klaim_remote_datasource.dart';
import 'package:siap/features/klaim/data/repositories/klaim_repository_impl.dart';
import 'package:siap/features/klaim/domain/repositories/klaim_repository.dart';
import 'package:siap/features/klaim/domain/usecases/klaim_usecases.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_form_bloc.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_list_bloc.dart';
import 'package:siap/routes/auth_router_refresh.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  // Config
  sl.registerLazySingleton<AppConfig>(AppConfig.fromEnv);

  // Local database (Hive cache)
  final cacheService = LocalCacheService();
  await cacheService.init();
  sl.registerLazySingleton<LocalCacheService>(() => cacheService);

  // Platform services
  sl.registerLazySingleton(NotificationService.new);
  sl.registerLazySingleton(ConnectivityService.new);
  sl.registerLazySingleton(LocationService.new);

  // Storage
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
  sl.registerLazySingleton<SharedPrefService>(
    () => SharedPrefService(sl<SharedPreferences>()),
  );

  // Network
  sl.registerLazySingleton<DioClient>(
    () => DioClient(
      appConfig: sl<AppConfig>(),
      sharedPrefService: sl<SharedPrefService>(),
    ),
  );
  sl.registerLazySingleton<FileRemoteDataSource>(
    () => FileRemoteDataSource(sl<DioClient>()),
  );
  sl.registerLazySingleton<MediaPickerService>(
    () => MediaPickerService(sl<FileRemoteDataSource>()),
  );
  sl.registerLazySingleton<DownloadService>(
    () => DownloadService(sl<DioClient>()),
  );
  sl.registerLazySingleton<WorkflowService>(
    () => WorkflowService(sl<DioClient>()),
  );
  sl.registerLazySingleton<RegistrationService>(
    () => RegistrationService(sl<DioClient>()),
  );
  sl.registerLazySingleton<ReportExportService>(
    () => ReportExportService(sl<DioClient>()),
  );
  sl.registerLazySingleton<LookupService>(() => LookupService(sl<DioClient>()));
  sl.registerLazySingleton<OpenMeteoService>(OpenMeteoService.new);
  sl.registerLazySingleton<RfiRemoteService>(
    () => RfiRemoteService(sl<DioClient>()),
  );

  // Router auth refresh
  sl.registerLazySingleton(AuthRouterRefresh.new);

  // Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl<SharedPrefService>()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      localDataSource: sl<AuthLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl<AuthRepository>()));
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl<LoginUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
      forgotPasswordUseCase: sl<ForgotPasswordUseCase>(),
      getCurrentUserUseCase: sl<GetCurrentUserUseCase>(),
      authRouterRefresh: sl<AuthRouterRefresh>(),
    ),
  );

  // Dashboard
  sl.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(sl<DashboardRemoteDataSource>()),
  );
  sl.registerLazySingleton(
    () => GetDashboardSummaryUseCase(sl<DashboardRepository>()),
  );
  sl.registerLazySingleton(
    () => GetDashboardChartsUseCase(sl<DashboardRepository>()),
  );
  sl.registerFactory(
    () => DashboardBloc(
      getSummaryUseCase: sl<GetDashboardSummaryUseCase>(),
      getChartsUseCase: sl<GetDashboardChartsUseCase>(),
    ),
  );

  // Petani
  sl.registerLazySingleton<PetaniRemoteDataSource>(
    () => PetaniRemoteDataSourceImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<PetaniRepository>(
    () => PetaniRepositoryImpl(
      sl<PetaniRemoteDataSource>(),
      sl<LocalCacheService>(),
    ),
  );
  sl.registerLazySingleton(() => GetPetaniListUseCase(sl<PetaniRepository>()));
  sl.registerLazySingleton(
    () => GetPetaniDetailUseCase(sl<PetaniRepository>()),
  );
  sl.registerLazySingleton(() => CreatePetaniUseCase(sl<PetaniRepository>()));
  sl.registerLazySingleton(() => UpdatePetaniUseCase(sl<PetaniRepository>()));
  sl.registerLazySingleton(() => DeletePetaniUseCase(sl<PetaniRepository>()));
  sl.registerFactory(
    () => PetaniListBloc(
      getPetaniListUseCase: sl<GetPetaniListUseCase>(),
      deletePetaniUseCase: sl<DeletePetaniUseCase>(),
    ),
  );
  sl.registerFactory(
    () => PetaniFormBloc(
      createPetaniUseCase: sl<CreatePetaniUseCase>(),
      updatePetaniUseCase: sl<UpdatePetaniUseCase>(),
    ),
  );

  // Lahan
  sl.registerLazySingleton<LahanRemoteDataSource>(
    () => LahanRemoteDataSourceImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<LahanRepository>(
    () => LahanRepositoryImpl(sl<LahanRemoteDataSource>()),
  );
  sl.registerLazySingleton(() => GetLahanListUseCase(sl<LahanRepository>()));
  sl.registerLazySingleton(() => GetLahanDetailUseCase(sl<LahanRepository>()));
  sl.registerLazySingleton(() => CreateLahanUseCase(sl<LahanRepository>()));
  sl.registerLazySingleton(() => UpdateLahanUseCase(sl<LahanRepository>()));
  sl.registerLazySingleton(() => DeleteLahanUseCase(sl<LahanRepository>()));
  sl.registerFactory(
    () => LahanListBloc(
      getLahanListUseCase: sl<GetLahanListUseCase>(),
      deleteLahanUseCase: sl<DeleteLahanUseCase>(),
    ),
  );
  sl.registerFactory(
    () => LahanFormBloc(
      createLahanUseCase: sl<CreateLahanUseCase>(),
      updateLahanUseCase: sl<UpdateLahanUseCase>(),
    ),
  );

  // Asuransi
  sl.registerLazySingleton<AsuransiRemoteDataSource>(
    () => AsuransiRemoteDataSourceImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<AsuransiRepository>(
    () => AsuransiRepositoryImpl(sl<AsuransiRemoteDataSource>()),
  );
  sl.registerLazySingleton(
    () => GetAsuransiListUseCase(sl<AsuransiRepository>()),
  );
  sl.registerLazySingleton(
    () => GetAsuransiDetailUseCase(sl<AsuransiRepository>()),
  );
  sl.registerLazySingleton(
    () => CreateAsuransiUseCase(sl<AsuransiRepository>()),
  );
  sl.registerLazySingleton(
    () => UpdateAsuransiUseCase(sl<AsuransiRepository>()),
  );
  sl.registerLazySingleton(
    () => DeleteAsuransiUseCase(sl<AsuransiRepository>()),
  );
  sl.registerFactory(
    () => AsuransiListBloc(
      getAsuransiListUseCase: sl<GetAsuransiListUseCase>(),
      deleteAsuransiUseCase: sl<DeleteAsuransiUseCase>(),
    ),
  );
  sl.registerFactory(
    () => AsuransiFormBloc(
      createAsuransiUseCase: sl<CreateAsuransiUseCase>(),
      updateAsuransiUseCase: sl<UpdateAsuransiUseCase>(),
    ),
  );

  // Klaim
  sl.registerLazySingleton<KlaimRemoteDataSource>(
    () => KlaimRemoteDataSourceImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<KlaimRepository>(
    () => KlaimRepositoryImpl(sl<KlaimRemoteDataSource>()),
  );
  sl.registerLazySingleton(() => GetKlaimListUseCase(sl<KlaimRepository>()));
  sl.registerLazySingleton(() => GetKlaimDetailUseCase(sl<KlaimRepository>()));
  sl.registerLazySingleton(() => CreateKlaimUseCase(sl<KlaimRepository>()));
  sl.registerLazySingleton(() => UpdateKlaimUseCase(sl<KlaimRepository>()));
  sl.registerLazySingleton(() => DeleteKlaimUseCase(sl<KlaimRepository>()));
  sl.registerFactory(
    () => KlaimListBloc(
      getKlaimListUseCase: sl<GetKlaimListUseCase>(),
      deleteKlaimUseCase: sl<DeleteKlaimUseCase>(),
    ),
  );
  sl.registerFactory(
    () => KlaimFormBloc(
      createKlaimUseCase: sl<CreateKlaimUseCase>(),
      updateKlaimUseCase: sl<UpdateKlaimUseCase>(),
    ),
  );

  // Laporan
  sl.registerLazySingleton<LaporanRemoteDataSource>(
    () => LaporanRemoteDataSourceImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<LaporanRepository>(
    () => LaporanRepositoryImpl(sl<LaporanRemoteDataSource>()),
  );
  sl.registerLazySingleton(() => ExportLaporanUseCase(sl<LaporanRepository>()));
  sl.registerFactory(
    () => LaporanBloc(exportLaporanUseCase: sl<ExportLaporanUseCase>()),
  );

  // Pengguna
  sl.registerLazySingleton<PenggunaRemoteDataSource>(
    () => PenggunaRemoteDataSourceImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<PenggunaRepository>(
    () => PenggunaRepositoryImpl(sl<PenggunaRemoteDataSource>()),
  );
  sl.registerLazySingleton(
    () => GetPenggunaListUseCase(sl<PenggunaRepository>()),
  );
  sl.registerLazySingleton(
    () => GetPenggunaDetailUseCase(sl<PenggunaRepository>()),
  );
  sl.registerLazySingleton(
    () => CreatePenggunaUseCase(sl<PenggunaRepository>()),
  );
  sl.registerLazySingleton(
    () => UpdatePenggunaUseCase(sl<PenggunaRepository>()),
  );
  sl.registerLazySingleton(
    () => DeletePenggunaUseCase(sl<PenggunaRepository>()),
  );
  sl.registerFactory(
    () => PenggunaListBloc(
      getPenggunaListUseCase: sl<GetPenggunaListUseCase>(),
      deletePenggunaUseCase: sl<DeletePenggunaUseCase>(),
    ),
  );
  sl.registerFactory(
    () => PenggunaFormBloc(
      createPenggunaUseCase: sl<CreatePenggunaUseCase>(),
      updatePenggunaUseCase: sl<UpdatePenggunaUseCase>(),
    ),
  );
}
