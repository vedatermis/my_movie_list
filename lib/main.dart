import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list/blocs/cast/cast_bloc.dart';
import 'package:my_movie_list/blocs/topRated_movies/topRated_movies_bloc.dart';
import 'package:my_movie_list/blocs/movie/movie_bloc.dart';
import 'package:my_movie_list/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:my_movie_list/blocs/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:my_movie_list/config/app_router.dart';
import 'package:my_movie_list/config/theme.dart';
import 'package:my_movie_list/repositories/cast/castRepository.dart';
import 'package:my_movie_list/repositories/movie/movieRepository.dart';
import 'package:my_movie_list/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String defaultLocale = Platform.localeName;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (builder) => MovieBloc(movieRepository: MovieRepository())),
        BlocProvider(
            create: (builder) =>
                PopularMoviesBloc(movieRepository: MovieRepository())
                  ..add(PopularMoviesLoadEvent(defaultLocale, 1))),
        BlocProvider(
            create: (builder) =>
                TopRatedMoviesBloc(movieRepository: MovieRepository())
                  ..add(TopRatedMovieLoadEvent(defaultLocale, 1))),
        BlocProvider(
            create: (builder) =>
                UpcomingMoviesBloc(movieRepository: MovieRepository())
                  ..add(UpcomingMoviesLoadEvent(defaultLocale, 1))),
        BlocProvider(
            create: (builder) => CastBloc(castRepository: CastRepository()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Movie List',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: MainScreen.routeName,
      ),
    );
  }
}
