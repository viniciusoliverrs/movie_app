import 'dart:convert';

import 'package:http/http.dart' as http;

import '../services/http/custom_response.dart';
import '../services/http/http_client_exception.dart';
import '../services/http/ihttp_client_service.dart';

class HttpClient implements IHttpClientService {
  @override
  String baseUrl = "";

  HttpClient({required this.baseUrl});

  @override
  Future<CustomResponse> get(String endpoint,
      [Map<String, dynamic>? headers]) async {
    Uri uri = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
      });
      return CustomResponse(json.decode(response.body));
    } on Exception catch (e) {
      throw HttpClientException(e.toString());
    }
  }
}
