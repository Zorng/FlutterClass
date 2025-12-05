import 'package:project2/w9/quiz_app/domain/answer.dart';
import 'package:project2/w9/quiz_app/domain/question.dart';
import 'package:project2/w9/quiz_app/domain/quiz.dart';
import 'package:project2/w9/quiz_app/domain/submission.dart';

List<Question> questions = [
  Question(
    title: "Who is Dracula?", 
    choices: {
      1:"A tycoon", 
      2:"A dragon",
      3:"A vampire",
      4:"A king"
    }, 
    correctChoice: 3
  ),
  Question(
    title: "Who is the best teacher of 2025?", 
    choices: {
      1:"Batman", 
      2:"Dr. Strange",
      3:"The Amazon Ronan",
      4:"Engima"
    }, 
    correctChoice: 3
  ),
   Question(
    title: "Who is the best teacher of 2024?", 
    choices: {
      1:"Faker", 
      2:"The Amazon Ronan",
      3:"Joan d'Arc",
      4:"Lucifero"
    }, 
    correctChoice: 2
  ),
];

List<Answer> answers = [...questions.map((question) => Answer(question: question))];

Submission submission = Submission(answers: answers);

Quiz quiz = Quiz(submissions: []);