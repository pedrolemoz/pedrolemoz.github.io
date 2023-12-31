import 'http_response.dart';

abstract interface class IHttpClient {
  Future<HttpResponse> get(
    String url, {
    Map<String, String>? headers,
  });
}
