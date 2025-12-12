import 'package:flutter/material.dart';
import '../model/expense.dart';
import 'package:uuid/uuid.dart';
var uuid = Uuid();

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({
    super.key,
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.expenseType
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType expenseType;




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          
          title: Text(title),
          subtitle: Text("\$ $amount"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(expenseType.icon),
              Text('${date.day}/${date.month}/${date.year}',),
            ],
          ),
        ),
      ),
    );
  }
}