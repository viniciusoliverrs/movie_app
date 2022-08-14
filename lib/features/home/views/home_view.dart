import 'package:flutter/material.dart';
import 'package:movie_app/core/services/toast/toast.dart';
import 'package:movie_app/core/widgets/carousel.dart';
import 'package:movie_app/features/home/views/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (__, provider, _) {
      if (provider.errorMessage.isNotEmpty) {
        Toast(context).show(provider.errorMessage);
      }

      return RefreshIndicator(
        onRefresh: () async => provider.getMovies(),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Carousel(
                  pageController: provider.pageController,
                  images:
                      provider.movies.map((movie) => movie.imageUrl).toList(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
