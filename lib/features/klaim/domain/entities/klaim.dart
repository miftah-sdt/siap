enum KlaimStatus {
  draft,
  submitted,
  survey,
  approved,
  rejected;

  String get label => switch (this) {
    KlaimStatus.draft => 'Draft',
    KlaimStatus.submitted => 'Diajukan',
    KlaimStatus.survey => 'Survey',
    KlaimStatus.approved => 'Disetujui',
    KlaimStatus.rejected => 'Ditolak',
  };

  static KlaimStatus fromString(String value) {
    return KlaimStatus.values.firstWhere(
      (s) => s.name == value.toLowerCase(),
      orElse: () => KlaimStatus.draft,
    );
  }
}

class Klaim {
  const Klaim({
    required this.id,
    required this.nomorKlaim,
    required this.polisId,
    required this.polisNomor,
    required this.deskripsi,
    required this.status,
    required this.buktiKerusakan,
    required this.createdAt,
  });

  final String id;
  final String nomorKlaim;
  final String polisId;
  final String polisNomor;
  final String deskripsi;
  final KlaimStatus status;
  final List<String> buktiKerusakan;
  final DateTime createdAt;
}

class KlaimListResult {
  const KlaimListResult({
    required this.items,
    required this.page,
    required this.totalPages,
    required this.total,
  });

  final List<Klaim> items;
  final int page;
  final int totalPages;
  final int total;
}
