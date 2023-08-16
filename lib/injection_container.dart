import 'package:get_it/get_it.dart';
import 'package:quiz_app/features/quiz/domain/usecases/get_questions_usecase.dart';

import 'features/quiz/data/datasource/quiz_data.dart';
import 'features/quiz/data/repositories/question_repository_impl.dart';
import 'features/quiz/domain/repository/question_repository.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton<QuizDataSource>(QuizDataSource());
  sl.registerSingleton<QuestionRepository>(QuestionRepositoryImpl(sl()));
  sl.registerSingleton<GetQuestionsUsecase>(GetQuestionsUsecase(sl()));
}
