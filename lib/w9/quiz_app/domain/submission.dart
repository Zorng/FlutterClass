import 'package:project2/w9/quiz_app/domain/answer.dart';

class Submission {
  List<Answer> answers;
  Submission({required this.answers});

    int get score => answers.where((answer) => answer.isCorrect).length;

}