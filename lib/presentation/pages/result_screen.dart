// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/pages/home_screen.dart';

class ScoreCard extends StatelessWidget {
  int score;

  ScoreCard({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Score is $score !!",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.indigo.shade400,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo.shade400)),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen())),
                  child: const Text(
                    "Back to Home!",
                    style: TextStyle(fontSize: 22),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
