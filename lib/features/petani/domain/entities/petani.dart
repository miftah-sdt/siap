class Petani {
  const Petani({
    required this.id,
    required this.nik,
    required this.nama,
    required this.alamat,
    required this.noHp,
    required this.kelompokTani,
  });

  final String id;
  final String nik;
  final String nama;
  final String alamat;
  final String noHp;
  final String kelompokTani;
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
