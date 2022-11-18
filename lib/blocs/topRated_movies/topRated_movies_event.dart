part of 'topRated_movies_bloc.dart';

abstract class TopRatedMoviesEvent extends Equatable {
  const TopRatedMoviesEvent();

  @override
  List<Object> get props => [];
}

class TopRatedMovieInitialEvent extends TopRatedMoviesEvent {}

class TopRatedMovieLoadEvent extends TopRatedMoviesEvent {
  final String language;

  const TopRatedMovieLoadEvent(this.language);

  @override
  List<Object> get props => [language];
}
