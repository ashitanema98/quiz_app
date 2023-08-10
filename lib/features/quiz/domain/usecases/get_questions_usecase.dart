import 'package:quiz_app/features/quiz/domain/entity/question.dart';

import '../repository/question_repository.dart';

class GetQuestionsUsecase {
  final QuestionRepository repository;

  GetQuestionsUsecase(
    this.repository,
  );

  List<Questions> getQuestions() {
    return repository.getQuestions();
  }

  Future<void> fetchingQuestions() async {
    repository.fetchingQuestions();
  }
}
