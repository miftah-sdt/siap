import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
    ),
    const NavigationItem(
      label: 'Petani',
      icon: Icons.people_outline,
      route: RouteNames.petani,
      allowedRoles: [UserRole.admin, UserRole.operator, UserRole.verifikator],
    ),
    const NavigationItem(
      label: 'Lahan',
      icon: Icons.landscape_outlined,
      route: RouteNames.lahan,
      allowedRoles: [UserRole.admin, UserRole.operator, UserRole.verifikator],
    ),
    const NavigationItem(
      label: 'Asuransi',
      icon: Icons.description_outlined,
      route: RouteNames.asuransi,
      allowedRoles: [
        UserRole.admin,
        UserRole.operator,
        UserRole.verifikator,
        UserRole.petani,
      ],
    ),
    const NavigationItem(
      label: 'Klaim',
      icon: Icons.report_outlined,
      route: RouteNames.klaim,
      allowedRoles: [
        UserRole.admin,
        UserRole.operator,
        UserRole.verifikator,
        UserRole.petani,
      ],
    ),
    const NavigationItem(
      label: 'Laporan',
      icon: Icons.summarize_outlined,
      route: RouteNames.laporan,
      allowedRoles: [UserRole.admin, UserRole.operator, UserRole.verifikator],
    ),
    const NavigationItem(
      label: 'Pengguna',
      icon: Icons.manage_accounts_outlined,
      route: RouteNames.pengguna,
      allowedRoles: [UserRole.admin, UserRole.operator],
    ),
  ];

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    for (var i = 0; i < _items.length; i++) {
      if (location.startsWith(_items[i].route)) return i;
    }
    return 0;
  }

  List<NavigationItem> _visibleItems(UserRole role) {
    return _items.where((item) => item.isVisibleFor(role)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final user = authState is AuthAuthenticated ? authState.user : null;
        final role = user?.role ?? UserRole.petani;
        final visibleItems = _visibleItems(role);
        final isDesktop = Responsive.isDesktop(context);
        final isMobile = Responsive.isMobile(context);
        final selectedIndex = _selectedIndex(context);

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
                  context.go(RouteNames.login);
                },
              ),
            ],
          ),
          drawer: isDesktop
              ? null
              : Drawer(
                  child: _Sidebar(
                    items: visibleItems,
                    selectedIndex: selectedIndex,
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
                    selectedIndex: selectedIndex,
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
          bottomNavigationBar: isMobile
              ? NavigationBar(
                  selectedIndex: selectedIndex.clamp(
                    0,
                    visibleItems.length - 1,
                  ),
                  onDestinationSelected: (index) {
                    context.go(visibleItems[index].route);
                  },
                  destinations: [
                    for (final item in visibleItems)
                      NavigationDestination(
                        icon: Icon(item.icon),
                        label: item.label,
                      ),
                  ],
                )
              : null,
        );
      },
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<NavigationItem> items;
  final int selectedIndex;
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
                  selected: selectedIndex == index,
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
