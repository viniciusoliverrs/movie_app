// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_app/features/home/domain/repositories/imovie_repository.dart';

class HomeProvider with ChangeNotifier {
  List<MovieEntity> movies = [];
  final pageController = PageController(initialPage: 1);
  final IMovieRepository repository;
  String errorMessage = "";
  bool isLoading = false;
  HomeProvider({required this.repository}) {
    getMovies();
  }

  getMovies() async {
    errorMessage = "";
    isLoading = true;
    final movies = await repository.getAll();
    movies.fold(
      (l) => errorMessage = l.message,
      (r) => this.movies = r,
    );
    isLoading = false;
    notifyListeners();
  }
}
