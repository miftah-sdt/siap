import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';
import 'package:siap/features/petani/domain/usecases/petani_usecases.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/permission_edit_action.dart';
import 'package:siap/shared/widgets/route_visibility_reloader.dart';

class PetaniDetailPage extends StatefulWidget {
  const PetaniDetailPage({super.key, required this.petani});

  final Petani petani;

  @override
  State<PetaniDetailPage> createState() => _PetaniDetailPageState();
}

class _PetaniDetailPageState extends State<PetaniDetailPage> {
  late Petani _petani;

  @override
  void initState() {
    super.initState();
    _petani = widget.petani;
  }

  Future<void> _reloadDetail() async {
    final result = await sl<GetPetaniDetailUseCase>()(_petani.id);
    if (!mounted) return;
    final data = result.dataOrNull;
    if (data != null) setState(() => _petani = data);
  }

  @override
  Widget build(BuildContext context) {
    final petani = _petani;

    return RouteVisibilityReloader(
      location: RouteNames.petaniDetail(petani.id),
      onBecameVisible: _reloadDetail,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Petani'),
          actions: [
            PermissionEditAction(
              module: AppModule.petani,
              onPressed: () async {
                await context.push(
                  RouteNames.petaniEdit(petani.id),
                  extra: petani,
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
              leading: const Icon(Icons.badge_outlined),
              title: const Text('NIK'),
              subtitle: Text(petani.nik),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Nama'),
              subtitle: Text(petani.nama),
            ),
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: const Text('Alamat'),
              subtitle: Text(petani.alamat),
            ),
            ListTile(
              leading: const Icon(Icons.phone_outlined),
              title: const Text('No HP'),
              subtitle: Text(Formatter.phone(petani.noHp)),
            ),
            ListTile(
              leading: const Icon(Icons.groups_outlined),
              title: const Text('Kelompok Tani'),
              subtitle: Text(petani.kelompokTani),
            ),
          ],
        ),
      ),
    );
  }
}
