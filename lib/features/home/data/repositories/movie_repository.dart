// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movie_app/features/home/data/datasource/imovie_datasource.dart';
import 'package:movie_app/features/home/data/dto/movie_dto.dart';
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_app/features/home/domain/error/movie_exception.dart';
import 'package:movie_app/features/home/domain/repositories/imovie_repository.dart';

class MovieRepository implements IMovieRepository {
  final IMovieDatasource datasource;

  MovieRepository({required this.datasource});

  @override
  Future<Either<MovieException, List<MovieEntity>>> getAll() async {
    try {
      final response = await datasource.getAll();
      return Right(response.map((item) => MovieDto.fromMap(item)).toList());
    } on Exception catch (e) {
      return Left(MovieException(e.toString()));
    }
  }

  @override
  Future<Either<MovieException, MovieEntity>> getById(String id) async{
    try {
      final response = await datasource.getById(id);
      return Right(MovieDto.fromMap(response));
    } on Exception catch (e) {
      return Left(MovieException(e.toString()));
    }
  }
}
