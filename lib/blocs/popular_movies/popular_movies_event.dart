part of 'popular_movies_bloc.dart';

abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitalEvent extends PopularMoviesEvent {}

class PopularMoviesLoadEvent extends PopularMoviesEvent {
  final String language;
  final int page;

  const PopularMoviesLoadEvent(this.language, this.page);

  @override
  List<Object> get props => [language, page];
}
