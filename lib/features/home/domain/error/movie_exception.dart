abstract class IMovieException {
  abstract String message;
}

class MovieException implements IMovieException {
  @override
  String message;
  MovieException(this.message);
}