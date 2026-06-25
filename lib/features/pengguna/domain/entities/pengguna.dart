import 'package:siap/features/auth/domain/entities/user.dart';

class Pengguna {
  const Pengguna({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.isActive,
  });

  final String id;
  final String name;
  final String email;
  final UserRole role;
  final bool isActive;
}

class PenggunaListResult {
  const PenggunaListResult({
    required this.items,
    required this.page,
    required this.totalPages,
    required this.total,
  });

  final List<Pengguna> items;
  final int page;
  final int totalPages;
  final int total;
}
