import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list/blocs/popular_movies/popular_movies_bloc.dart';

import 'widgets.dart';

class PopularMovieGridView extends StatelessWidget {
  const PopularMovieGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (builder, state) {
      if (state is PopularMoviesLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is PopularMoviesLoaded) {
        return GridView.builder(
          itemCount: state.popularMovies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 20,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.6)),
          itemBuilder: (context, index) {
            return MovieGridCard(movie: state.popularMovies[index]);
          },
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
