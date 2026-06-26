import 'package:siap/core/models/rfi_models.dart';

enum AsuransiStatus {
  draft,
  submitted,
  verified,
  approved,
  rejected;

  String get label => switch (this) {
    AsuransiStatus.draft => 'Draft',
    AsuransiStatus.submitted => 'Diajukan',
    AsuransiStatus.verified => 'Terverifikasi',
    AsuransiStatus.approved => 'Disetujui',
    AsuransiStatus.rejected => 'Ditolak',
  };

  static AsuransiStatus fromString(String value) {
    return AsuransiStatus.values.firstWhere(
      (s) => s.name == value.toLowerCase(),
      orElse: () => AsuransiStatus.draft,
    );
  }
}

class Asuransi {
  const Asuransi({
    required this.id,
    required this.nomorPolis,
    required this.petaniId,
    required this.petaniNama,
    required this.lahanId,
    required this.lahanNama,
    required this.status,
    required this.documents,
    required this.createdAt,
    this.riskScore,
    this.riskLevel,
    this.scoreFactors = const [],
    this.scoredAt,
    this.askrindoRef,
    this.askrindoStatus,
  });

  final String id;
  final String nomorPolis;
  final String petaniId;
  final String petaniNama;
  final String lahanId;
  final String lahanNama;
  final AsuransiStatus status;
  final List<String> documents;
  final DateTime createdAt;
  final int? riskScore;
  final String? riskLevel;
  final List<ScoreFactor> scoreFactors;
  final String? scoredAt;
  final String? askrindoRef;
  final String? askrindoStatus;
}

class AsuransiListResult {
  const AsuransiListResult({
    required this.items,
    required this.page,
    required this.totalPages,
    required this.total,
  });

  final List<Asuransi> items;
  final int page;
  final int totalPages;
  final int total;
}
