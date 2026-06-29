enum PetaniRegistrationStatus {
  pending,
  approved,
  rejected;

  String get label => switch (this) {
    PetaniRegistrationStatus.pending => 'Menunggu',
    PetaniRegistrationStatus.approved => 'Disetujui',
    PetaniRegistrationStatus.rejected => 'Ditolak',
  };

  static PetaniRegistrationStatus fromString(String? value) {
    return PetaniRegistrationStatus.values.firstWhere(
      (status) => status.name == value?.toLowerCase(),
      orElse: () => PetaniRegistrationStatus.approved,
    );
  }
}

class Petani {
  const Petani({
    required this.id,
    required this.nik,
    required this.nama,
    required this.alamat,
    required this.noHp,
    required this.kelompokTani,
    this.registrationStatus = PetaniRegistrationStatus.approved,
    this.userId,
  });

  final String id;
  final String nik;
  final String nama;
  final String alamat;
  final String noHp;
  final String kelompokTani;
  final PetaniRegistrationStatus registrationStatus;
  final String? userId;
}

class PetaniListResult {
  const PetaniListResult({
    required this.items,
    required this.page,
    required this.totalPages,
    required this.total,
  });

  final List<Petani> items;
  final int page;
  final int totalPages;
  final int total;
}
