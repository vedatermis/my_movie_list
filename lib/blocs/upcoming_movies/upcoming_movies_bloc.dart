import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movie_list/repositories/movie/movieRepository.dart';

import '../../models/models.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final MovieRepository _movieRepository;
  UpcomingMoviesBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(UpcomingMoviesInitial()) {
    on<UpcomingMoviesLoadEvent>(_onUpcomingMoviesLoadEvent);
  }

  FutureOr<void> _onUpcomingMoviesLoadEvent(
      UpcomingMoviesLoadEvent event, Emitter<UpcomingMoviesState> emit) async {
    emit(UpcomingMoviesLoading());
    final upcomingMovies =
        await _movieRepository.getUpcomingMovies(event.language, event.page);

    emit(UpcomingMoviesLoaded(upcomingMovies));
  }
}
