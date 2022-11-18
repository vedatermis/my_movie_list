part of 'topRated_movies_bloc.dart';

abstract class TopRatedMoviesEvent extends Equatable {
  const TopRatedMoviesEvent();

  @override
  List<Object> get props => [];
}

class TopRatedMovieInitialEvent extends TopRatedMoviesEvent {}

class TopRatedMovieLoadEvent extends TopRatedMoviesEvent {
  final String language;
  final int page;

  const TopRatedMovieLoadEvent(this.language, this.page);

  @override
  List<Object> get props => [language, page];
}
