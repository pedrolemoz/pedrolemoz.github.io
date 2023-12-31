final class HttpResponse {
  final String data;
  final int statusCode;

  const HttpResponse({required this.data, required this.statusCode});

  bool get isSuccess => statusCode == 200 && data.isNotEmpty;
  bool get isError => !isSuccess;

  @override
  String toString() =>
      'Instance of HttpResponse\n\nStatus Code: $statusCode\nBody: $data';
}
