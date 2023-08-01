abstract class ScoreEvent {}

class ScoreUpdateEvent extends ScoreEvent {
  final int score;
  ScoreUpdateEvent(this.score);
}
