import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list/blocs/cast/cast_bloc.dart';
import 'package:my_movie_list/blocs/movie/movie_bloc.dart';
import 'package:my_movie_list/widgets/cast.dart';

import '../../widgets/widgets.dart';

class MovieDetail extends StatelessWidget {
  static String routeName = '/movieDetail';

  static Route route({required int movieId}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (builder) => MovieDetail(movieId: movieId));
  }

  final int movieId;

  const MovieDetail({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    final String defaultLocale = Platform.localeName;
    context.read<MovieBloc>().add(LoadMovieEvent(movieId, defaultLocale));
    context.read<CastBloc>().add(CastLoadEvent(movieId));

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoaded) {
              return Text(
                state.movie.title!,
                style: Theme.of(context).textTheme.headline3,
              );
            } else {
              return const Text("Loading...");
            }
          },
        ),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: movieId,
                    child: MovieDetailTopImage(movie: state.movie),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.movie.title!,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(height: 5),
                        MovieDetailHeader(movie: state.movie),
                        const SizedBox(height: 10),
                        Text(
                          state.movie.overview!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 14),
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        BlocBuilder<CastBloc, CastState>(
                          builder: (context, state) {
                            if (state is CastLoading) {
                              return const CircularProgressIndicator();
                            } else if (state is CastLoaded) {
                              return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 75,
                                  child: Casting(casts: state.casts));
                            } else if (state is CastError) {
                              return const Text("Error");
                            }
                            return const Text("Error");
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
