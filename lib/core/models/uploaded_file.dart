class UploadedFile {
  const UploadedFile({
    required this.fileName,
    required this.originalName,
    required this.url,
    this.size,
    this.mimeType,
  });

  final String fileName;
  final String originalName;
  final String url;
  final int? size;
  final String? mimeType;

  bool get isImage {
    final lower = originalName.toLowerCase();
    return lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.png') ||
        lower.endsWith('.gif') ||
        lower.endsWith('.webp');
  }
}
