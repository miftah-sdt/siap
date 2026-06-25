class Validators {
  const Validators._();

  static String? required(String? value, {String field = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$field wajib diisi';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email wajib diisi';
    }
    final regex = RegExp(r'^[\w.\-]+@([\w\-]+\.)+[\w\-]{2,63}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Format email tidak valid';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }
    return null;
  }

  static String? nik(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'NIK wajib diisi';
    }
    if (value.trim().length != 16) {
      return 'NIK harus 16 digit';
    }
    if (!RegExp(r'^\d{16}$').hasMatch(value.trim())) {
      return 'NIK hanya boleh angka';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'No HP wajib diisi';
    }
    if (!RegExp(r'^(\+62|62|0)\d{8,13}$').hasMatch(value.trim())) {
      return 'Format No HP tidak valid';
    }
    return null;
  }

  static String? luas(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Luas wajib diisi';
    }
    final normalized = value.trim().replaceAll(',', '.');
    final parsed = double.tryParse(normalized);
    if (parsed == null || parsed <= 0) {
      return 'Luas harus angka positif';
    }
    return null;
  }
}
