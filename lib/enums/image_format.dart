enum ImageFormat {
  png('png'),
  jpeg('jpeg'),
  svg('svg'),
  unknown('unknown');

  const ImageFormat(this.value);

  final String value;

  static ImageFormat fromString(String value) {
    return switch (value) {
      'png' => ImageFormat.png,
      'svg' => ImageFormat.svg,
      'jpeg' => ImageFormat.jpeg,
      'jpg' => ImageFormat.jpeg,
      String() => ImageFormat.unknown,
    };
  }
}
