import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:my_movie_list/widgets/widgets.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: ((context, state) {
        if (state is PopularMoviesLoading) {
          return const CircularProgressIndicator();
        } else if (state is PopularMoviesLoaded) {
          return CarouselSlider(
              options: CarouselOptions(
                  aspectRatio: 2.0,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              items: state.popularMovies
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
