import 'package:project2/w9/quiz_app/domain/answer.dart';

class Submission {
  List<Answer> answers;
  DateTime ? dateTime;
  Submission({required this.answers, this.dateTime});

  int get score => answers.where((answer) => answer.isCorrect).length;

  // Submission copyWith(Submission submission) {
  //   return Submission(answers: submission.answers, dateTime: submission.dateTime);
  // }
}