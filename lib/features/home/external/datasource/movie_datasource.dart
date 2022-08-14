import 'package:movie_app/core/services/http/custom_response.dart';

import '../../../../core/services/http/ihttp_client_service.dart';
import '../../data/datasource/imovie_datasource.dart';

class MovieDatasource implements IMovieDatasource {
  IHttpClientService http;

  MovieDatasource({required this.http});

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    CustomResponse response = await http.get('/movie');
    return (response.data["data"] as List<dynamic>).cast<Map<String, dynamic>>();
  }

  @override
  Future<Map<String, dynamic>> getById(String id) async {
    final response = await http.get('/movie/$id');
    return response.data;
  }
}
