import 'package:project2/w9/quiz_app/domain/question.dart';

class Answer {
  int answerKey = -1;
  Question question;
  Answer({required this.question});

  bool get isCorrect =>  answerKey == question.correctChoice;
}