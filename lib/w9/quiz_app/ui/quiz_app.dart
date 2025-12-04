import 'package:flutter/material.dart';
import 'package:project2/w9/quiz_app/domain/submission.dart';
import 'package:project2/w9/quiz_app/ui/screens/question_screen.dart';
import 'package:project2/w9/quiz_app/ui/screens/result_screen.dart';
import 'package:project2/w9/quiz_app/ui/screens/start_screen.dart';


class QuizApp extends StatefulWidget {
  final Submission submission;
  const QuizApp({super.key, required this.submission});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int screenIndex = 0;
  late Widget screen;

  @override
  void initState() {
    screen = StartScreen(switchScreen: switchScreen);
    super.initState();
  }

  void switchScreen(int index) {
    setState(() {
      screenIndex = index;
      switch(screenIndex) {
        case 0: screen = StartScreen(switchScreen: switchScreen);
        case 1: screen = QuestionScreen(switchScreen: switchScreen, answers: widget.submission.answers);
        case 2: screen = ResultScreen(switchScreen: switchScreen ,submission: widget.submission);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return screen;
  }
}
