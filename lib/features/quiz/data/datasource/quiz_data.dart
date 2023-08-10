import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/features/quiz/data/models/question_model.dart';

class QuizDataSource {
  List<QuestionModel> quizDataList = [];
  Future<void> fetchingQuiz() async {
    final response =
        await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
    if (response.statusCode == 200) {
      Map<String, dynamic> quizData =
          Map<String, dynamic>.from(jsonDecode(response.body));
      List<dynamic> results = (quizData['results']);
      quizDataList =
          results.map((json) => QuestionModel.fromJson(json)).toList();
    } else {
      throw ArgumentError.notNull();
    }
  }
}
