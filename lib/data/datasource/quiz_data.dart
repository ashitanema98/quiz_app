import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/data/repositories/question_model.dart';

class QuizData {
  static List<Questions> quizDataList = [];
  static Future<void> fetchingQuiz() async {
    final response =
        await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
    if (response.statusCode == 200) {
      Map<String, dynamic> quizData =
          Map<String, dynamic>.from(jsonDecode(response.body));
      List<dynamic> results = (quizData['results']);
      quizDataList = results.map((json) => Questions.fromJson(json)).toList();
    } else {
      throw ArgumentError.notNull();
    }
  }

  // static List<Questions> quizData = [
  //   Questions(
  //       question: 'What is the capital of France?',
  //       options: ['London', 'Berlin', 'Paris', 'Madrid'],
  //       correctOption: 2),
  //   Questions(
  //       question: 'Which planet is known as the Red Planet?',
  //       options: ['Mars', 'Venus', 'Jupiter', 'Mercury'],
  //       correctOption: 0),
  //   Questions(
  //       question: 'What is the capital of France?',
  //       options: ['A', 'Berlin', 'Paris', 'Madrid'],
  //       correctOption: 2),
  //   Questions(
  //       question: 'Which planet is known as the Red Planet?',
  //       options: ['B', 'Venus', 'Jupiter', 'Mercury'],
  //       correctOption: 0)
  // ];
}
