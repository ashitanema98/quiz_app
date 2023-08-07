import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/bloc/score_bloc/score_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quiz_app/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:quiz_app/presentation/pages/home_screen.dart';
import 'package:quiz_app/presentation/pages/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(const MyApp());
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
