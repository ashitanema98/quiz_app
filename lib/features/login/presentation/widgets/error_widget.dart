import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;

  const ErrorContainer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(children: [
          const Padding(
              padding: EdgeInsets.all(9.5),
              child: Icon(
                Icons.warning_amber_outlined,
                color: Colors.blueGrey,
              )),
          Text(
            data,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.3,
              color: Colors.blueGrey,
            ),
          )
        ]));
  }
}
