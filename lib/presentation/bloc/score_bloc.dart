import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/bloc/score_event.dart';
import 'package:quiz_app/presentation/bloc/score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(const ScoreState()) {
    on<ScoreUpdateEvent>((event, emit) {
      emit(state.copyWith(score: event.score));
    });
  }
}
