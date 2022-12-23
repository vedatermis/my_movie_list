import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movie_list/models/models.dart';
import 'package:my_movie_list/repositories/cast/castRepository.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final CastRepository _castRepository;
  CastBloc({required CastRepository castRepository})
      : _castRepository = castRepository,
        super(CastInitial()) {
    on<CastLoadEvent>(_onCastLoadEvent);
  }

  FutureOr<void> _onCastLoadEvent(
      CastLoadEvent event, Emitter<CastState> emit) async {
    emit(CastLoading());
    final cast = await _castRepository.getCast(event.movieId);

    emit(CastLoaded(cast));
  }
}
