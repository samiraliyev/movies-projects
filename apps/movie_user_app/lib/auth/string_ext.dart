extension StringExt on String {
  String cleanUrl() {
    return replaceAll(':8009/api/v1', '')
        .replaceAll(':8009/api', '')
        .toLowerCase();
  }
}
