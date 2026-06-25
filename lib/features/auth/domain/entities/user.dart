enum UserRole {
  admin,
  operator,
  verifikator,
  petani;

  String get label => switch (this) {
    UserRole.admin => 'Admin',
    UserRole.operator => 'Operator',
    UserRole.verifikator => 'Verifikator',
    UserRole.petani => 'Petani',
  };

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (role) => role.name == value.toLowerCase(),
      orElse: () => UserRole.petani,
    );
  }
}

class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.avatarUrl,
  });

  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String? avatarUrl;
}
