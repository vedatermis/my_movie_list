import 'package:flutter/material.dart';
import 'package:my_movie_list/models/movie_type.dart';
import 'package:my_movie_list/widgets/widgets.dart';

class SeeAll extends StatelessWidget {
  static const String routeName = '/seeAll';

  static Route route({required MovieType movieType}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => SeeAll(movieType: movieType));
  }

  final MovieType movieType;
  const SeeAll({required this.movieType, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MovieTypeNames().getMovieTypeName(movieType),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: getGridView(movieType),
      ),
    );
  }
}

Widget getGridView(MovieType movieType) {
  switch (movieType) {
    case MovieType.Popular:
      return const PopularMovieGridView();

    case MovieType.TopRated:
      return const TopRatedMovieGridView();

    case MovieType.Upcoming:
      return const UpcomingMovieGridView();
  }
}
