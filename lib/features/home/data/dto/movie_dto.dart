import 'package:movie_app/features/home/domain/entities/movie_entity.dart';

class MovieDto {
  static MovieEntity fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: map['id'] ?? "",
      name: map['nome'] ?? "",
      description: map['sinopse'] ?? "",
      imageUrl: map['foto'] ?? "",
    );
  }
}
