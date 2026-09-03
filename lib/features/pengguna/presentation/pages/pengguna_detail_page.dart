import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';
import 'package:siap/features/pengguna/domain/usecases/pengguna_usecases.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/permission_edit_action.dart';
import 'package:siap/shared/widgets/route_visibility_reloader.dart';

class PenggunaDetailPage extends StatefulWidget {
  const PenggunaDetailPage({super.key, required this.pengguna});

  final Pengguna pengguna;

  @override
  State<PenggunaDetailPage> createState() => _PenggunaDetailPageState();
}

class _PenggunaDetailPageState extends State<PenggunaDetailPage> {
  late Pengguna _pengguna;

  @override
  void initState() {
    super.initState();
    _pengguna = widget.pengguna;
  }

  Future<void> _reloadDetail() async {
    final result = await sl<GetPenggunaDetailUseCase>()(_pengguna.id);
    if (!mounted) return;
    final data = result.dataOrNull;
    if (data != null) setState(() => _pengguna = data);
  }

  @override
  Widget build(BuildContext context) {
    final pengguna = _pengguna;

    return RouteVisibilityReloader(
      location: RouteNames.penggunaDetail(pengguna.id),
      onBecameVisible: _reloadDetail,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Pengguna'),
          actions: [
            PermissionEditAction(
              module: AppModule.pengguna,
              onPressed: () async {
                await context.push(
                  RouteNames.penggunaEdit(pengguna.id),
                  extra: pengguna,
                );
                if (context.mounted) await _reloadDetail();
              },
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Nama'),
              subtitle: Text(pengguna.name),
            ),
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: const Text('Email'),
              subtitle: Text(pengguna.email),
            ),
            ListTile(
              leading: const Icon(Icons.admin_panel_settings_outlined),
              title: const Text('Role'),
              subtitle: Text(pengguna.role.label),
            ),
            ListTile(
              leading: Icon(
                pengguna.isActive
                    ? Icons.check_circle_outline
                    : Icons.cancel_outlined,
              ),
              title: const Text('Status'),
              subtitle: Text(pengguna.isActive ? 'Aktif' : 'Nonaktif'),
            ),
          ],
        ),
      ),
    );
  }
}
