import 'package:flutter/material.dart';
import 'package:project2/w9/quiz_app/data/question_repo.dart';
import 'package:project2/w9/quiz_app/domain/answer.dart';
import 'package:project2/w9/quiz_app/ui/widget/question_form.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(int) switchScreen;
  final List<Answer> answers;
  const QuestionScreen({
    super.key,
    required this.switchScreen,
    required this.answers,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;
  int? myKey;

  void handleStartPress() {
    widget.switchScreen(1);
  }

  void submit(int k) {
    answers[questionIndex].answerKey = k;
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    }else {
      widget.switchScreen(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 108, 134),
      appBar: AppBar(title: Text("QUESTION ${questionIndex + 1} of ${answers.length}", style: TextStyle(color: Colors.white),), backgroundColor: const Color.fromARGB(255, 76, 108, 134),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
          child: Column(
            children: [
              Expanded(
                child: QuestionForm(
                  question: widget.answers[questionIndex].question,
                  submit: submit,
                ),
              ),
              //ElevatedButton(onPressed: handleStartPress, child: Text("Start")),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
