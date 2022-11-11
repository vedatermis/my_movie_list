part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class InitialMovie extends MovieEvent {}

class LoadMovieEvent extends MovieEvent {
  final int id;

  const LoadMovieEvent(this.id);

  @override
  List<Object> get props => [id];
}
