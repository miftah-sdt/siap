class Lahan {
  const Lahan({
    required this.id,
    required this.kodeLahan,
    required this.namaLahan,
    required this.luas,
    required this.lokasi,
    this.koordinat,
  });

  final String id;
  final String kodeLahan;
  final String namaLahan;
  final double luas;
  final String lokasi;
  final String? koordinat;
}

class LahanListResult {
  const LahanListResult({
    required this.items,
    required this.page,
    required this.totalPages,
    required this.total,
  });

  final List<Lahan> items;
  final int page;
  final int totalPages;
  final int total;
}
