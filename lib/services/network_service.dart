import 'package:http/http.dart' as http;

// NetworkService class for making HTTP requests

class NetworkService{
  Future<http.Response> get(
    String url,
  ) {
    final headers = {
      'Content-Type': 'application/json',
    };
    return http.get(Uri.parse(url), headers: headers);
  }

}