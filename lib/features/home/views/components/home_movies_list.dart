// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';

import 'package:movie_app/features/home/views/providers/home_provider.dart';

class HomeMoviesList extends StatelessWidget {
  final List<MovieEntity> movies;
  const HomeMoviesList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  movies[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                child: Text(
                  movies[index].name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
