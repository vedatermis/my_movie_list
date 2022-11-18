import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movie_list/models/movie/movie.dart';
import 'package:my_movie_list/repositories/movie/movieRepository.dart';

part 'topRated_movies_event.dart';
part 'topRated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final MovieRepository _movieRepository;
  TopRatedMoviesBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(TopRatedMoviesInitial()) {
    on<TopRatedMovieLoadEvent>(_onLatestMovieLoadEvent);
  }

  FutureOr<void> _onLatestMovieLoadEvent(
      TopRatedMovieLoadEvent event, Emitter<TopRatedMoviesState> emit) async {
    emit(TopRatedMoviesLoading());

    final latestMovies =
        await _movieRepository.getTopRatedMovies(event.language);

    emit(TopRatedMoviesLoaded(latestMovies));
  }
}
