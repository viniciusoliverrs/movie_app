import 'custom_response.dart';

abstract class IHttpClientService {
  abstract String baseUrl;
  Future<CustomResponse> get(
    String endpoint, [
    Map<String, dynamic>? headers,
  ]);
}
