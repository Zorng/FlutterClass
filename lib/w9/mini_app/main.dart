import 'package:flutter/material.dart';
import 'package:project2/w9/mini_app/data/expense.repo.dart';
import 'package:project2/w9/mini_app/ui/expenses_page.dart';

var data = expenses;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesPage(data: data),
    ),
  );
}
