import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list/blocs/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:my_movie_list/widgets/widgets.dart';

class UpcomingMovieGridView extends StatelessWidget {
  const UpcomingMovieGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
        builder: (builder, state) {
      if (state is UpcomingMoviesLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UpcomingMoviesLoaded) {
        return GridView.builder(
          itemCount: state.upcomingMovies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 20,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.6)),
          itemBuilder: (context, index) {
            return MovieGridCard(movie: state.upcomingMovies[index]);
          },
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
