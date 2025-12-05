import 'package:flutter/material.dart';
import 'package:project2/w9/quiz_app/data/question_repo.dart';
//import 'package:project2/w9/quiz_app/domain/answer.dart';
import 'package:project2/w9/quiz_app/domain/quiz.dart';
import 'package:project2/w9/quiz_app/domain/submission.dart';
import 'package:project2/w9/quiz_app/ui/widget/question_form.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(int) switchScreen;
  final Quiz quiz;
  const QuestionScreen({
    super.key,
    required this.switchScreen,
    required this.quiz,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Submission submission = Submission(answers: answers);
  int questionIndex = 0;
  int? myKey;

  void handleStartPress() {
    widget.switchScreen(1);
  }

  void submit(int k) {
    submission.answers[questionIndex].answerKey = k;
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    }else {
      quiz.addSubmission(submission);
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
                  question: submission.answers[questionIndex].question,
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
