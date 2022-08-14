abstract class IMovieDatasource {
  Future<List<Map<String, dynamic>>> getAll();
  Future<Map<String, dynamic>> getById(String id);
}
