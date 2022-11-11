import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movie_list/repositories/movie/movieRepository.dart';

import '../../models/models.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final MovieRepository _movieRepository;
  PopularMoviesBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(PopularMoviesInitial()) {
    on<PopularMoviesLoadEvent>(_onPopularMoviesLoadEvent);
  }

  FutureOr<void> _onPopularMoviesLoadEvent(
      PopularMoviesLoadEvent event, Emitter<PopularMoviesState> emit) async {
    emit(PopularMoviesLoading());

    final popularMovies =
        await _movieRepository.getPopulerMovies(event.language, event.page);

    emit(PopularMoviesLoaded(popularMovies));
  }
}
