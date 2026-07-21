import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siap/core/constants/app_constants.dart';
import 'package:siap/core/security/security_bootstrap.dart';
import 'package:siap/core/services/notification_service.dart';
import 'package:siap/core/storage/shared_pref_service.dart';
import 'package:siap/core/theme/dark_theme.dart';
import 'package:siap/core/theme/light_theme.dart';
import 'package:siap/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/routes/app_router.dart';
import 'package:siap/routes/auth_router_refresh.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const SiapApp());

  // Jangan block first frame — sealed APK / permission / MethodChannel bisa hang.
  unawaited(_bootstrapAfterFirstFrame());
}

Future<void> _bootstrapAfterFirstFrame() async {
  await Future<void>.delayed(Duration.zero);
  await sl<NotificationService>().init();
  await bootstrapThreatReportingIfEnabled();
}

class SiapApp extends StatelessWidget {
  const SiapApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedPrefService = sl<SharedPrefService>();
    final themeMode = sharedPrefService.getThemeMode();
    final router = AppRouter.createRouter(authRefresh: sl<AuthRouterRefresh>());

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: MaterialApp.router(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            theme: LightTheme.theme,
            darkTheme: DarkTheme.theme,
            themeMode: themeMode,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
