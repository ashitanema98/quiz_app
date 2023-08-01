import 'package:equatable/equatable.dart';

class ScoreState extends Equatable {
  final int score;
  const ScoreState({
    this.score = 0,
  });

  ScoreState copyWith({
    int? score,
  }) {
    return ScoreState(
      score: score ?? this.score,
    );
  }

  @override
  List<Object?> get props => [score];
}
