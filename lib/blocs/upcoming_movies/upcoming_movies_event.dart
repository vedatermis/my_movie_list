part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesEvent extends Equatable {
  const UpcomingMoviesEvent();

  @override
  List<Object> get props => [];
}

class UpcomingMoviesLoadEvent extends UpcomingMoviesEvent {
  final String language;
  final int page;

  const UpcomingMoviesLoadEvent(this.language, this.page);

  @override
  List<Object> get props => [language, page];
}
