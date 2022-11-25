import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list/blocs/movie/movie_bloc.dart';
import 'package:my_movie_list/config/assets.dart';

class MovieDetail extends StatelessWidget {
  static String routeName = '/movieDetail';

  static Route route({required int movieId}) {
    return MaterialPageRoute(settings: RouteSettings(name: routeName), builder: (builder) => MovieDetail(movieId: movieId));
  }

  final int movieId;
  const MovieDetail({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    final String defaultLocale = Platform.localeName;
    context.read<MovieBloc>().add(LoadMovieEvent(movieId, defaultLocale));

    return Scaffold(
      appBar: AppBar(
        title: const Text("asdas"),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const CircularProgressIndicator();
          } else if (state is MovieLoaded) {
            return SingleChildScrollView(
              child: Column(children: [
                state.movie.backdropPath == null
                    ? Image.asset(
                        AppImages().noImage,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      )
                    : Image.network(
                        state.movie.movieSmallImageBasePath + state.movie.backdropPath!,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
              ]),
            );
          } else {
            return const SizedBox();
          }

          return const SizedBox();
        },
      ),
    );
  }
}
