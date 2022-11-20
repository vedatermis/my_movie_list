import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:my_movie_list/models/movie_type.dart';

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
      body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (builder, state) {
        if (state is PopularMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PopularMoviesLoaded) {
          return Container(
            child: Text(state.popularMovies[0].title!),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
