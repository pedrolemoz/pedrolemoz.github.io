extension ListExtension on List<String> {
  String get merge => reduce((a, b) => a += ' $b');
}
