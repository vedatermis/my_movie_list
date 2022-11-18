part of 'topRated_movies_bloc.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRatedMoviesInitial extends TopRatedMoviesState {}

class TopRatedMoviesLoading extends TopRatedMoviesState {}

class TopRatedMoviesLoaded extends TopRatedMoviesState {
  final List<Movie> topRatedMovies;

  const TopRatedMoviesLoaded(this.topRatedMovies);

  @override
  List<Object> get props => [topRatedMovies];
}

class TopRatedMoviesError extends TopRatedMoviesState {}
