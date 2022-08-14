import 'dart:convert';

import 'package:http/http.dart' as http;

import 'custom_response.dart';
import 'http_client_exception.dart';
import 'ihttp_client_service.dart';

class HttpClientService implements IHttpClientService {
  @override
  String baseUrl = "";

  HttpClientService({required this.baseUrl});

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
