import 'package:http/http.dart' as http;

import 'http_exception.dart';
import 'http_response.dart';
import 'i_http_client.dart';

final class HttpClient implements IHttpClient {
  final http.Client _httpClient;

  const HttpClient(this._httpClient);

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    try {
      final result = await _httpClient.get(Uri.parse(url));
      return HttpResponse(data: result.body, statusCode: result.statusCode);
    } catch (exception) {
      throw HttpClientException(exception);
    }
  }
}
