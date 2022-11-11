part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> popularMovies;

  const PopularMoviesLoaded(this.popularMovies);

  @override
  List<Object> get props => [popularMovies];
}

class PopularMoviesError extends PopularMoviesState {}
