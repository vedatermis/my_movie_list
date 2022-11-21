import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list/blocs/topRated_movies/topRated_movies_bloc.dart';
import 'package:my_movie_list/widgets/widgets.dart';

class TopRatedMovieGridView extends StatelessWidget {
  const TopRatedMovieGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
        builder: (builder, state) {
      if (state is TopRatedMoviesLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is TopRatedMoviesLoaded) {
        return GridView.builder(
          itemCount: state.topRatedMovies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 20,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.6)),
          itemBuilder: (context, index) {
            return MovieGridCard(movie: state.topRatedMovies[index]);
          },
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
