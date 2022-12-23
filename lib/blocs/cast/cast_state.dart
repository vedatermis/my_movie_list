part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastLoaded extends CastState {
  final List<Cast> casts;

  const CastLoaded(this.casts);

  @override
  List<Object> get props => [casts];
}

class CastError extends CastState {}
