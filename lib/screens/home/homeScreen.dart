import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:my_movie_list/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const HomeScreen());
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Center(child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (context, state) {
          if (state is PopularMoviesLoading) {
            return const CircularProgressIndicator();
          } else if (state is PopularMoviesLoaded) {
            return ListView.builder(
                itemCount: state.popularMovies.length,
                itemBuilder: (buildContext, index) {
                  return MovieCard(movie: state.popularMovies[index]);
                });
          } else {
            return Container();
          }
        },
      )),
    );
  }
}
