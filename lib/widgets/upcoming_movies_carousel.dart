import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list/blocs/topRated_movies/topRated_movies_bloc.dart';
import 'package:my_movie_list/blocs/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:my_movie_list/widgets/widgets.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
      builder: ((context, state) {
        if (state is TopRatedMoviesLoading) {
          return const CircularProgressIndicator();
        } else if (state is UpcomingMoviesLoaded) {
          return CarouselSlider(
              options: CarouselOptions(
                  aspectRatio: 2.0,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              items: state.upcomingMovies
                  .map((movie) => MovieCard(movie: movie))
                  .take(10)
                  .toList());
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
