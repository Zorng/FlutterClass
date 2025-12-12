import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

enum ExpenseType {
  food(icon: Icons.bakery_dining),
  travel(icon: Icons.travel_explore),
  leisure(icon: Icons.coffee),
  work(icon: Icons.work);

  final IconData icon;

  const ExpenseType({required this.icon});
}

class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  ExpenseType expenseType;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.expenseType,
  }) : id = uuid.v4();
}
