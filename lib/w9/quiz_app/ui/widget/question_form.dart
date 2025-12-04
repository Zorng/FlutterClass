import 'package:flutter/material.dart';
import 'package:project2/w9/quiz_app/domain/question.dart';

class QuestionForm extends StatelessWidget {
  final Question question;
  final void Function(int key) submit;
  const QuestionForm({super.key, required this.question, required this.submit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question.title, style: TextStyle(color: Colors.white, fontSize: 16),),
        const SizedBox(height: 20),

           Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ...question.choices.entries.map(
                  (entry) => AnswerButton(
                    questionKey: entry.key,
                    title: entry.value,
                    getAnswer: submit,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String title;
  final int questionKey;
  final void Function(int) getAnswer;
  const AnswerButton({
    super.key,
    required this.questionKey,
    required this.title,
    required this.getAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => getAnswer(questionKey),
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
          ),
        ),
      ),
      child: Text(title),
    );
  }
}
