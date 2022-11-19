part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();

  @override
  List<Object> get props => [];
}

class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoading extends UpcomingMoviesState {}

class UpcomingMoviesLoaded extends UpcomingMoviesState {
  final List<Movie> upcomingMovies;

  const UpcomingMoviesLoaded(this.upcomingMovies);

  @override
  List<Object> get props => [upcomingMovies];
}

class UpcomingMoviesError extends UpcomingMoviesState {}
