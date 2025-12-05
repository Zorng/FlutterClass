import 'package:project2/w9/quiz_app/domain/submission.dart';

class Quiz {
  List<Submission> submissions;

  Quiz({required this.submissions});

  void addSubmission(Submission submission) {
    submissions.add(submission);
  }

}