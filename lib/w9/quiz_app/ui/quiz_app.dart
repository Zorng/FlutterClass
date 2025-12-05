import 'package:flutter/material.dart';
import 'package:project2/w9/quiz_app/domain/quiz.dart';
import 'package:project2/w9/quiz_app/ui/screens/question_screen.dart';
import 'package:project2/w9/quiz_app/ui/screens/result_screen.dart';
import 'package:project2/w9/quiz_app/ui/screens/start_screen.dart';


class QuizApp extends StatefulWidget {
  final Quiz quiz;
  const QuizApp({super.key, required this.quiz});

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
        case 1: screen = QuestionScreen(switchScreen: switchScreen, quiz: widget.quiz);
        case 2: screen = ResultScreen(switchScreen: switchScreen ,submission: widget.quiz.submissions.last);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return screen;
  }
}
