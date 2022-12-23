part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();

  @override
  List<Object> get props => [];
}

class CastNInitialEvent extends CastEvent {}

class CastLoadEvent extends CastEvent {
  final int movieId;

  const CastLoadEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
