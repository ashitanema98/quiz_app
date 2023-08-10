import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quiz_app/features/login/presentation/widgets/custom_appbar.dart';
import 'package:quiz_app/features/quiz/presentation/bloc/score_bloc/score_bloc.dart';
import 'package:quiz_app/features/quiz/presentation/pages/questions_page.dart';

import '../../domain/repository/question_repository.dart';
import '../../domain/usecases/get_questions_usecase.dart';

class HomeScreen extends StatefulWidget {
  final QuestionRepository repository;
  const HomeScreen({
    Key? key,
    required this.repository,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int score = 0;
  // QuestionRepository repository = QuestionRepositoryImpl();

  @override
  void initState() {
    super.initState();
    _getScore();
    GetQuestionsUsecase questionsUsecase =
        GetQuestionsUsecase(widget.repository);

    questionsUsecase.fetchingQuestions();
  }

  Future<void> _getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final prefScore = prefs.getInt("score") ?? 0;
    setState(() {
      score = prefScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarTitle: 'Quiz App'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.indigo.shade400,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo.shade400)),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => ScoreBloc(),
                                child: QuestionsPage(
                                    repository: widget.repository),
                              ))),
                  child: const Text(
                    "Start Again",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
