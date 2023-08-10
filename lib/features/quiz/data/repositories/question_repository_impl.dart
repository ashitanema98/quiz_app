import 'package:quiz_app/features/quiz/data/datasource/quiz_data.dart';
import 'package:quiz_app/features/quiz/domain/entity/question.dart';
import 'package:quiz_app/features/quiz/domain/repository/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuizDataSource quizDataSource;

  QuestionRepositoryImpl(this.quizDataSource);

  @override
  List<Questions> getQuestions() {
    List<Questions> quizDataList = quizDataSource.quizDataList;
    return quizDataList;
  }

  @override
  Future<void> fetchingQuestions() async {
    quizDataSource.fetchingQuiz();
  }
}
