// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/bloc/score_bloc/score_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quiz_app/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:quiz_app/presentation/pages/home_screen.dart';
import 'package:quiz_app/presentation/pages/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    return runApp(MyApp(isLoggedIn: isLoggedIn));
  });
}

class MyApp extends StatelessWidget {
  bool isLoggedIn;
  MyApp({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: (isLoggedIn
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
