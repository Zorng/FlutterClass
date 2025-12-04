import 'package:flutter/material.dart';
import 'package:project2/w9/quiz_app/domain/answer.dart';

class AnswerResult extends StatelessWidget {
  final Answer answer;
  final int index;
  const AnswerResult({super.key, required this.answer, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: answer.isCorrect
            ? const Color.fromARGB(253, 161, 240, 202)
            : const Color.fromARGB(255, 250, 147, 147),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${index + 1}. ${answer.question.title}"),
          Divider(color: Colors.grey.shade800,),
          const SizedBox(height: 12),
          answer.isCorrect
              ? Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...answer.question.choices.entries.map(
                      (entry) => entry.key == answer.answerKey
                          ? Row(
                              children: [
                                Text(
                                  entry.value,
                                  style: TextStyle(color: const Color.fromARGB(255, 20, 155, 24)),
                                ),
                                const SizedBox(width: 5),
                                Icon(Icons.check),
                              ],
                            )
                          : Text(entry.value),
                    ),
                  ],
                )
              : Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...answer.question.choices.entries.map((entry) {
                      if (entry.key == answer.question.correctChoice) {
                        return Row(
                          children: [
                            Text(entry.value),
                            const SizedBox(width: 5),
                            Icon(Icons.check),
                          ],
                        );
                      } else if (entry.key == answer.answerKey) {
                        return Text(
                          entry.value,
                          style: TextStyle(color: const Color.fromARGB(255, 212, 41, 29)),
                        );
                      } else {
                        return Text(entry.value);
                      }
                    }),
                  ],
                ),
        ],
      ),
    );
  }
}
