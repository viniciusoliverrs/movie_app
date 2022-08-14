import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api.dart';
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/core/services/http/ihttp_client_service.dart';
import 'package:movie_app/features/home/data/datasource/imovie_datasource.dart';
import 'package:movie_app/features/home/data/repositories/movie_repository.dart';
import 'package:movie_app/features/home/external/datasource/movie_datasource.dart';
import 'package:movie_app/features/home/views/home_view.dart';
import 'package:provider/provider.dart';

import '../core/services/http/http_client_service.dart';
import 'home/domain/repositories/imovie_repository.dart';
import 'home/views/providers/home_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IHttpClientService>(
            create: (context) => HttpClientService(baseUrl: baseUrlApi)),
        Provider<IMovieDatasource>(
            create: (context) => MovieDatasource(http: context.read())),
        Provider<IMovieRepository>(
            create: (context) => MovieRepository(datasource: context.read())),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(repository: context.read()),
        ),
      ],
      child: MaterialApp(
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.home,
        routes: AppRoutes.routes,
      ),
    );
  }
}
