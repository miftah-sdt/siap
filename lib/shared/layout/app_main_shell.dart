import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/core/constants/app_constants.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/responsive.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:siap/features/auth/presentation/bloc/auth_event.dart';
import 'package:siap/features/auth/presentation/bloc/auth_state.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/layout/navigation_item.dart';
import 'package:siap/shared/widgets/offline_banner.dart';

class AppMainShell extends StatelessWidget {
  AppMainShell({super.key, required this.child});

  final Widget child;

  final List<NavigationItem> _items = [
    const NavigationItem(
      label: 'Dashboard',
      icon: Icons.dashboard_outlined,
      route: RouteNames.dashboard,
      module: AppModule.dashboard,
      includeInMobileBottomNav: true,
    ),
    const NavigationItem(
      label: 'Petani',
      icon: Icons.people_outline,
      route: RouteNames.petani,
      module: AppModule.petani,
    ),
    const NavigationItem(
      label: 'Lahan',
      icon: Icons.landscape_outlined,
      route: RouteNames.lahan,
      module: AppModule.lahan,
    ),
    const NavigationItem(
      label: 'Akseptasi',
      icon: Icons.description_outlined,
      route: RouteNames.asuransi,
      module: AppModule.asuransi,
      includeInMobileBottomNav: true,
    ),
    const NavigationItem(
      label: 'Klaim',
      icon: Icons.report_outlined,
      route: RouteNames.klaim,
      module: AppModule.klaim,
      includeInMobileBottomNav: true,
    ),
    const NavigationItem(
      label: 'Monitoring',
      icon: Icons.map_outlined,
      route: RouteNames.monitoring,
      module: AppModule.monitoring,
    ),
    const NavigationItem(
      label: 'Laporan',
      icon: Icons.summarize_outlined,
      route: RouteNames.laporan,
      module: AppModule.laporan,
    ),
    const NavigationItem(
      label: 'Pengguna',
      icon: Icons.manage_accounts_outlined,
      route: RouteNames.pengguna,
      module: AppModule.pengguna,
    ),
  ];

  List<NavigationItem> _visibleItems(UserRole role) {
    return _items.where((item) => item.isVisibleFor(role)).toList();
  }

  List<NavigationItem> _mobileBottomItems(UserRole role) {
    return _visibleItems(
      role,
    ).where((item) => item.includeInMobileBottomNav).toList();
  }

  bool _isRouteSelected(String route, BuildContext context) {
    return GoRouterState.of(context).uri.toString().startsWith(route);
  }

  int _mobileBottomSelectedIndex(
    List<NavigationItem> bottomItems,
    BuildContext context,
  ) {
    for (var i = 0; i < bottomItems.length; i++) {
      if (_isRouteSelected(bottomItems[i].route, context)) return i;
    }
    return bottomItems.length;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthUnauthenticated && previous is! AuthUnauthenticated,
      listener: (context, state) {
        context.go(RouteNames.login);
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          final user = authState is AuthAuthenticated ? authState.user : null;
          final role = user?.role ?? UserRole.petani;
          final visibleItems = _visibleItems(role);
          final bottomItems = _mobileBottomItems(role);
          final isDesktop = Responsive.isDesktop(context);
          final isMobile = Responsive.isMobile(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text(AppConstants.appName),
              actions: [
                if (user != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                    ),
                    child: Chip(
                      avatar: CircleAvatar(
                        child: Text(user.name.isNotEmpty ? user.name[0] : '?'),
                      ),
                      label: Text(user.role.label),
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  tooltip: 'Keluar',
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      const AuthEvent.logoutRequested(),
                    );
                  },
                ),
              ],
            ),
            drawer: isDesktop
                ? null
                : Drawer(
                    child: _Sidebar(
                      items: visibleItems,
                      isSelected: (route) => _isRouteSelected(route, context),
                      onSelected: (route) {
                        Navigator.pop(context);
                        context.go(route);
                      },
                    ),
                  ),
            body: Row(
              children: [
                if (isDesktop)
                  SizedBox(
                    width: 260,
                    child: _Sidebar(
                      items: visibleItems,
                      isSelected: (route) => _isRouteSelected(route, context),
                      onSelected: (route) => context.go(route),
                    ),
                  ),
                Expanded(
                  child: OfflineBanner(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: isMobile && bottomItems.isNotEmpty
                ? Builder(
                    builder: (scaffoldContext) => NavigationBar(
                      labelBehavior:
                          NavigationDestinationLabelBehavior.onlyShowSelected,
                      selectedIndex: _mobileBottomSelectedIndex(
                        bottomItems,
                        context,
                      ),
                      onDestinationSelected: (index) {
                        if (index >= bottomItems.length) {
                          Scaffold.of(scaffoldContext).openDrawer();
                          return;
                        }
                        context.go(bottomItems[index].route);
                      },
                      destinations: [
                        for (final item in bottomItems)
                          NavigationDestination(
                            icon: Icon(item.icon),
                            label: item.label,
                          ),
                        const NavigationDestination(
                          icon: Icon(Icons.menu_outlined),
                          label: 'Menu',
                        ),
                      ],
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({
    required this.items,
    required this.isSelected,
    required this.onSelected,
  });

  final List<NavigationItem> items;
  final bool Function(String route) isSelected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.agriculture, size: 40),
                SizedBox(height: AppSpacing.sm),
                Text(
                  AppConstants.appName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(AppConstants.appFullName),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.label),
                  selected: isSelected(item.route),
                  onTap: () => onSelected(item.route),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
