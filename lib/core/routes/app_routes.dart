import '../../features/home/views/home_view.dart';

class AppRoutes {
  static const String home = '/';

  static final routes = {
    home: (context) => const HomeView(),
  };
}
