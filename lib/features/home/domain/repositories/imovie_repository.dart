import 'package:dartz/dartz.dart';
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_app/features/home/domain/error/movie_exception.dart';

abstract class IMovieRepository {
  Future<Either<MovieException, List<MovieEntity>>> getAll();
  Future<Either<MovieException, MovieEntity>> getById(String id);
}