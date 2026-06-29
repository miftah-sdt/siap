class DownloadResult {
  const DownloadResult({
    required this.fileName,
    required this.savedPath,
    required this.directoryLabel,
  });

  final String fileName;
  final String savedPath;
  final String directoryLabel;
}
