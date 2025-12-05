import 'package:flutter/material.dart';
import 'package:project2/w9/quiz_app/ui/quiz_app.dart';
import 'data/question_repo.dart';


var data = quiz;


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizApp(quiz: data)
  ));
}