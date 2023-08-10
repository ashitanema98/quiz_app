// ignore_for_file: non_constant_identifier_names

class Questions {
  String question;
  String correct_answer;
  List<String>? incorrect_answers;

  Questions({
    required this.question,
    required this.correct_answer,
    required this.incorrect_answers,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'question': question});
    result.addAll({'correct_answer': correct_answer});
    result.addAll({'incorrect_answers': incorrect_answers});

    return result;
  }

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
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
