// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/data/datasource/quiz_data.dart';
import 'package:quiz_app/data/repositories/question_model.dart';
import 'package:quiz_app/presentation/bloc/score_bloc/score_bloc.dart';
import 'package:quiz_app/presentation/bloc/score_bloc/score_event.dart';
import 'package:quiz_app/presentation/pages/home_screen.dart';
import 'package:quiz_app/presentation/widgets/custom_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  static navigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ScoreBloc(),
                  child: const QuestionsPage(),
                )));
  }

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int _currentQuestionIndex = 0;

  String _selectedOption = "";
  int score = 0;
  final List<Questions> _quizDataList = QuizData.quizDataList;

  void _checkAnswer(String selectedOption) {
    String correctOption = _quizDataList[_currentQuestionIndex].correct_answer;
    bool isCorrect = selectedOption == correctOption;
    isCorrect
        ? BlocProvider.of<ScoreBloc>(context).add(ScoreUpdateEvent(score += 10))
        : BlocProvider.of<ScoreBloc>(context).add(ScoreUpdateEvent(score));
  }

  Future<void> _nextQuestion() async {
    if (_currentQuestionIndex < _quizDataList.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOption = "";
      });
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('score', score);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_quizDataList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(234, 228, 224, 224),
      appBar: CustomAppbar(appbarTitle: '${_currentQuestionIndex + 1}/10'),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(32),
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white54,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                        7.0,
                        8.0,
                      )),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    _quizDataList[_currentQuestionIndex].question,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.indigo.shade400,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  ..._buildOptions(
                      _quizDataList[_currentQuestionIndex].incorrect_answers,
                      _quizDataList[_currentQuestionIndex].correct_answer),
                ],
              )),
          ElevatedButton(
            onPressed: _nextQuestion,
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                backgroundColor:
                    MaterialStateProperty.all(Colors.indigo.shade400)),
            child: Text(
              _currentQuestionIndex < _quizDataList.length - 1
                  ? 'Next Question'
                  : "Submit",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOptions(
      List<String>? incorrectAnswers, String correctAnswer) {
    List<String> options = (incorrectAnswers ?? [])..add(correctAnswer);
    options.shuffle();
    return options.map((option) {
      return RadioListTile(
        title: Text(option),
        value: option,
        groupValue: _selectedOption,
        onChanged: (value) {
          _selectedOption = value!;
          _checkAnswer(_selectedOption);
          _nextQuestion();
        },
      );
    }).toList();
  }
}
