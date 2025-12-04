import 'package:flutter/material.dart';
import 'package:project2/w9/quiz_app/domain/submission.dart';
import 'package:project2/w9/quiz_app/ui/widget/naviagtion_button.dart';
import 'package:project2/w9/quiz_app/ui/widget/result_list.dart';

class ResultScreen extends StatelessWidget {
  final Submission submission;
  final void Function(int) switchScreen;
  const ResultScreen({
    super.key,
    required this.submission,
    required this.switchScreen,
  });

  void handleBackPress() {
    switchScreen(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 108, 134),
      appBar: AppBar(title: Text("Your Score ${submission.score} / ${submission.answers.length}", style: TextStyle(color: Colors.white),), backgroundColor: const Color.fromARGB(255, 76, 108, 134),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: submission.answers.length,
                  itemBuilder: (context, index) {
                    final answer = submission.answers[index];
                    return AnswerResult(answer: answer, index: index);
                  },
                ),
              ),
              const SizedBox(height: 20),
              NaviagtionButton(
                onPressed: handleBackPress,
                title: "back",
                primary: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

