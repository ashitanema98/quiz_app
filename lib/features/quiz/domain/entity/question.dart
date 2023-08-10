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
}
