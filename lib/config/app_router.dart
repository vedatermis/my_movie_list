import 'package:flutter/material.dart';
import 'package:my_movie_list/models/movie_type.dart';
import 'package:my_movie_list/screens/screens.dart';
import 'package:my_movie_list/screens/seeAll/see_all_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MainScreen.route();

      case '/seeAll':
        return SeeAll.route(movieType: settings.arguments as MovieType);

      case '/movieDetail':
        return MovieDetail.route(movieId: settings.arguments as int);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
