enum LaporanType {
  petani,
  lahan,
  asuransi,
  klaim;

  String get label => switch (this) {
    LaporanType.petani => 'Petani',
    LaporanType.lahan => 'Lahan',
    LaporanType.asuransi => 'Asuransi',
    LaporanType.klaim => 'Klaim',
  };
}

enum ExportFormat { pdf, excel }

class LaporanFilter {
  const LaporanFilter({
    required this.type,
    this.startDate,
    this.endDate,
    this.status,
  });

  final LaporanType type;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? status;
}

class LaporanExportResult {
  const LaporanExportResult({
    required this.fileName,
    required this.downloadUrl,
  });

  final String fileName;
  final String downloadUrl;
}
