import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movie_list/models/movie/movie.dart';
import 'package:my_movie_list/repositories/movie/movieRepository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _movieRepository;
  MovieBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(MovieInitial()) {
    on<LoadMovieEvent>(_loadMovieEvent);
  }

  FutureOr<void> _loadMovieEvent(LoadMovieEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    final movie = await _movieRepository.getMovieById(event.id, event.language);
    emit(MovieLoaded(movie));
  }
}
