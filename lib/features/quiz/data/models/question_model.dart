// ignore_for_file: non_constant_identifier_names

import 'package:quiz_app/features/quiz/domain/entity/question.dart';

class QuestionModel extends Questions {
  QuestionModel(
      {required super.question,
      required super.correct_answer,
      required super.incorrect_answers});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'question': question});
    result.addAll({'correct_answer': correct_answer});
    result.addAll({'incorrect_answers': incorrect_answers});

    return result;
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        question: json['question'],
        correct_answer: json['correct_answer'] ?? "",
        incorrect_answers: json['incorrect_answers'] != null
            ? List<String>.from(json['incorrect_answers'])
            : [],
      );
  Map<String, dynamic> toJson() => {
        "question": question,
        "correct_answer": correct_answer,
        "incorrect_answers": incorrect_answers,
      };
}
