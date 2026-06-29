import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/storage/shared_pref_service.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:siap/features/auth/presentation/pages/login_page.dart';
import 'package:siap/features/auth/presentation/pages/register_petani_page.dart';
import 'package:siap/features/auth/presentation/pages/reset_password_page.dart';
import 'package:siap/features/auth/presentation/pages/change_password_page.dart';
import 'package:siap/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:siap/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:siap/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_bloc.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_list_bloc.dart';
import 'package:siap/features/asuransi/presentation/pages/asuransi_detail_page.dart';
import 'package:siap/features/asuransi/presentation/pages/asuransi_form_page.dart';
import 'package:siap/features/asuransi/presentation/pages/asuransi_list_page.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_form_bloc.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_list_bloc.dart';
import 'package:siap/features/klaim/presentation/pages/klaim_detail_page.dart';
import 'package:siap/features/klaim/presentation/pages/klaim_form_page.dart';
import 'package:siap/features/klaim/presentation/pages/klaim_list_page.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_form_bloc.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_list_bloc.dart';
import 'package:siap/features/lahan/presentation/pages/lahan_detail_page.dart';
import 'package:siap/features/lahan/presentation/pages/lahan_form_page.dart';
import 'package:siap/features/lahan/presentation/pages/lahan_list_page.dart';
import 'package:siap/features/laporan/presentation/bloc/laporan_bloc.dart';
import 'package:siap/features/laporan/presentation/pages/laporan_page.dart';
import 'package:siap/features/monitoring/presentation/pages/monitoring_page.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_form_bloc.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_list_bloc.dart';
import 'package:siap/features/pengguna/presentation/pages/pengguna_detail_page.dart';
import 'package:siap/features/pengguna/presentation/pages/pengguna_form_page.dart';
import 'package:siap/features/pengguna/presentation/pages/pengguna_list_page.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';
import 'package:siap/features/petani/presentation/bloc/petani_form_bloc.dart';
import 'package:siap/features/petani/presentation/bloc/petani_list_bloc.dart';
import 'package:siap/features/petani/presentation/pages/petani_detail_page.dart';
import 'package:siap/features/petani/presentation/pages/petani_form_page.dart';
import 'package:siap/features/petani/presentation/pages/petani_list_page.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/routes/auth_router_refresh.dart';
import 'package:siap/routes/role_guard.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/layout/app_main_shell.dart';
import 'package:siap/shared/pages/splash_page.dart';

class AppRouter {
  const AppRouter._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter createRouter({required AuthRouterRefresh authRefresh}) {
    final sharedPrefService = sl<SharedPrefService>();

    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: RouteNames.splash,
      refreshListenable: authRefresh,
      redirect: (context, state) {
        final isLoggedIn = sharedPrefService.isLoggedIn;
        final location = state.matchedLocation;
        final isAuthRoute =
            location == RouteNames.login ||
            location == RouteNames.forgotPassword ||
            location == RouteNames.registerPetani ||
            location.startsWith(RouteNames.resetPassword);
        final isSplash = location == RouteNames.splash;

        if (isSplash) return null;

        if (!isLoggedIn && !isAuthRoute) {
          return RouteNames.login;
        }

        if (isLoggedIn && isAuthRoute) {
          return RouteNames.dashboard;
        }

        final role = UserRole.fromString(
          sharedPrefService.getUserRole() ?? UserRole.petani.name,
        );
        final denied = RoleGuard.redirectIfDenied(
          userRole: role,
          location: location,
        );
        if (denied != null) return denied;

        return null;
      },
      routes: [
        GoRoute(
          path: RouteNames.splash,
          name: RouteNames.splash,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: RouteNames.login,
          name: RouteNames.login,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: RouteNames.forgotPassword,
          name: RouteNames.forgotPassword,
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(
          path: RouteNames.registerPetani,
          name: RouteNames.registerPetani,
          builder: (context, state) => const RegisterPetaniPage(),
        ),
        GoRoute(
          path: RouteNames.resetPassword,
          name: RouteNames.resetPassword,
          builder: (context, state) {
            final token = state.uri.queryParameters['token'] ?? '';
            return ResetPasswordPage(token: token);
          },
        ),
        GoRoute(
          path: RouteNames.changePassword,
          name: RouteNames.changePassword,
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state) => const ChangePasswordPage(),
        ),
        ShellRoute(
          builder: (context, state, child) => AppMainShell(child: child),
          routes: [
            GoRoute(
              path: RouteNames.dashboard,
              name: RouteNames.dashboard,
              builder: (context, state) => BlocProvider(
                create: (_) =>
                    sl<DashboardBloc>()..add(const DashboardEvent.started()),
                child: const DashboardPage(),
              ),
            ),
            GoRoute(
              path: RouteNames.petani,
              name: RouteNames.petani,
              builder: (context, state) => BlocProvider(
                create: (_) => sl<PetaniListBloc>(),
                child: const PetaniListPage(),
              ),
              routes: [
                GoRoute(
                  path: 'create',
                  name: RouteNames.petaniCreate,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => BlocProvider(
                    create: (_) => sl<PetaniFormBloc>(),
                    child: const PetaniFormPage(),
                  ),
                ),
                GoRoute(
                  path: ':id',
                  name: 'petaniDetail',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) {
                    final petani = state.extra as Petani?;
                    if (petani != null) {
                      return PetaniDetailPage(petani: petani);
                    }
                    return const Scaffold(
                      body: Center(child: Text('Data petani tidak ditemukan')),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'edit',
                      name: 'petaniEdit',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) {
                        final petani = state.extra as Petani?;
                        return BlocProvider(
                          create: (_) => sl<PetaniFormBloc>(),
                          child: PetaniFormPage(petani: petani),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: RouteNames.lahan,
              name: RouteNames.lahan,
              builder: (context, state) => BlocProvider(
                create: (_) => sl<LahanListBloc>(),
                child: const LahanListPage(),
              ),
              routes: [
                GoRoute(
                  path: 'create',
                  name: RouteNames.lahanCreate,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => BlocProvider(
                    create: (_) => sl<LahanFormBloc>(),
                    child: const LahanFormPage(),
                  ),
                ),
                GoRoute(
                  path: ':id',
                  name: 'lahanDetail',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) {
                    final lahan = state.extra as Lahan?;
                    if (lahan != null) {
                      return LahanDetailPage(lahan: lahan);
                    }
                    return const Scaffold(
                      body: Center(child: Text('Data lahan tidak ditemukan')),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'edit',
                      name: 'lahanEdit',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) {
                        final lahan = state.extra as Lahan?;
                        return BlocProvider(
                          create: (_) => sl<LahanFormBloc>(),
                          child: LahanFormPage(lahan: lahan),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: RouteNames.asuransi,
              name: RouteNames.asuransi,
              builder: (context, state) => BlocProvider(
                create: (_) => sl<AsuransiListBloc>(),
                child: const AsuransiListPage(),
              ),
              routes: [
                GoRoute(
                  path: 'create',
                  name: RouteNames.asuransiCreate,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => BlocProvider(
                    create: (_) => sl<AsuransiFormBloc>(),
                    child: const AsuransiFormPage(),
                  ),
                ),
                GoRoute(
                  path: ':id',
                  name: 'asuransiDetail',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) {
                    final asuransi = state.extra as Asuransi?;
                    if (asuransi != null) {
                      return AsuransiDetailPage(asuransi: asuransi);
                    }
                    return const Scaffold(
                      body: Center(
                        child: Text('Data asuransi tidak ditemukan'),
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'edit',
                      name: 'asuransiEdit',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) {
                        final asuransi = state.extra as Asuransi?;
                        return BlocProvider(
                          create: (_) => sl<AsuransiFormBloc>(),
                          child: AsuransiFormPage(asuransi: asuransi),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: RouteNames.klaim,
              name: RouteNames.klaim,
              builder: (context, state) => BlocProvider(
                create: (_) => sl<KlaimListBloc>(),
                child: const KlaimListPage(),
              ),
              routes: [
                GoRoute(
                  path: 'create',
                  name: RouteNames.klaimCreate,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => BlocProvider(
                    create: (_) => sl<KlaimFormBloc>(),
                    child: const KlaimFormPage(),
                  ),
                ),
                GoRoute(
                  path: ':id',
                  name: 'klaimDetail',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) {
                    final klaim = state.extra as Klaim?;
                    if (klaim != null) {
                      return KlaimDetailPage(klaim: klaim);
                    }
                    return const Scaffold(
                      body: Center(child: Text('Data klaim tidak ditemukan')),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'edit',
                      name: 'klaimEdit',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) {
                        final klaim = state.extra as Klaim?;
                        return BlocProvider(
                          create: (_) => sl<KlaimFormBloc>(),
                          child: KlaimFormPage(klaim: klaim),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: RouteNames.monitoring,
              name: RouteNames.monitoring,
              builder: (context, state) => const MonitoringPage(),
            ),
            GoRoute(
              path: RouteNames.laporan,
              name: RouteNames.laporan,
              builder: (context, state) => BlocProvider(
                create: (_) => sl<LaporanBloc>(),
                child: const LaporanPage(),
              ),
            ),
            GoRoute(
              path: RouteNames.pengguna,
              name: RouteNames.pengguna,
              builder: (context, state) => BlocProvider(
                create: (_) => sl<PenggunaListBloc>(),
                child: const PenggunaListPage(),
              ),
              routes: [
                GoRoute(
                  path: 'create',
                  name: RouteNames.penggunaCreate,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => BlocProvider(
                    create: (_) => sl<PenggunaFormBloc>(),
                    child: const PenggunaFormPage(),
                  ),
                ),
                GoRoute(
                  path: ':id',
                  name: 'penggunaDetail',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) {
                    final pengguna = state.extra as Pengguna?;
                    if (pengguna != null) {
                      return PenggunaDetailPage(pengguna: pengguna);
                    }
                    return const Scaffold(
                      body: Center(
                        child: Text('Data pengguna tidak ditemukan'),
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'edit',
                      name: 'penggunaEdit',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) {
                        final pengguna = state.extra as Pengguna?;
                        return BlocProvider(
                          create: (_) => sl<PenggunaFormBloc>(),
                          child: PenggunaFormPage(pengguna: pengguna),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
