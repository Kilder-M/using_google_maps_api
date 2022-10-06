import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SucessAlert extends StatelessWidget {
  final String title;
  const SucessAlert({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Lottie.asset('assets/animations/sucess.json'),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
