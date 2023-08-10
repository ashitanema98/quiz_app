import '../entity/question.dart';

abstract class QuestionRepository {
  Future<void> fetchingQuestions();
  List<Questions> getQuestions();
}
