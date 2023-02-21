extension ListExtension on List<String> {
  String get merge => this.reduce((a, b) => a += ' $b');
}
