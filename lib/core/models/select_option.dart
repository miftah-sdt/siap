class SelectOption {
  const SelectOption({
    required this.id,
    required this.label,
    this.subtitle,
    this.extra,
  });

  final String id;
  final String label;
  final String? subtitle;
  final Map<String, String>? extra;
}
