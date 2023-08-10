import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:quiz_app/features/login/presentation/pages/login_screen.dart';
import 'package:quiz_app/features/quiz/data/datasource/quiz_data.dart';
import 'package:quiz_app/features/quiz/data/repositories/question_repository_impl.dart';
import 'package:quiz_app/features/quiz/domain/repository/question_repository.dart';
import 'package:quiz_app/features/quiz/presentation/bloc/score_bloc/score_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quiz_app/features/quiz/presentation/pages/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  return runApp(const MyApp());
}

void setupDependencies() {
  GetIt.instance.registerSingleton<QuizDataSource>(QuizDataSource());
  GetIt.instance.registerSingleton<QuestionRepository>(
      QuestionRepositoryImpl(GetIt.instance<QuizDataSource>()));
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _isLoggedIn();
  }

  Future<void> _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final val = prefs.getBool("isLoggedIn") ?? false;
    setState(() {
      isLoggedIn = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: (isLoggedIn == true
            ? BlocProvider(
                create: (context) => ScoreBloc(),
                child: const HomeScreen(),
              )
            : BlocProvider(
                create: (context) => LoginBloc(),
                child: const LoginScreen(),
              )));
  }
}
