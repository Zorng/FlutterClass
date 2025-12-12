import 'package:flutter/material.dart';
import 'package:project2/w9/mini_app/model/expense.dart';
import 'package:project2/w9/mini_app/ui/expense_form.dart';
import 'package:project2/w9/mini_app/ui/expense_list.dart';
import 'package:project2/w9/mini_app/ui/statistic_card.dart';

class ExpensesPage extends StatefulWidget {
  final List<Expense> data;
  const ExpensesPage({super.key, required this.data});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ExpenseForm(createExpense: createExpense);
      },
    );
  }

  void createExpense(Expense expense) {
    setState(() {
      widget.data.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 202, 249),
        title: const Text('Expenses', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsetsGeometry.all(8),
            child: IconButton(
              onPressed: () => _showBottomSheet(context),
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StatisticCard(data: widget.data),
            ),
            ExpenseList(data: widget.data),
          ],
        ),
      ),
    );
  }
}
