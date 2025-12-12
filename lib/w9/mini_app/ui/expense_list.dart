import 'package:flutter/material.dart';
import 'package:project2/w9/mini_app/ui/expenses_item.dart';

import '../model/expense.dart';

class ExpenseList extends StatefulWidget {
  final List<Expense> data;
  const ExpenseList({super.key, required this.data});

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return widget.data.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                final expense = widget.data[index];
                return Dismissible(
                  key: Key(expense.id),
                  onDismissed: (direction) {
                    setState(() {
                      widget.data.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Succesfully Remove an item"),
                            TextButton(
                              onPressed: () => {
                                setState(() {
                                  widget.data.insert(index, expense);
                                }),
                              },
                              child: Text("UNDO"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  background: Container(
                    decoration: BoxDecoration(color: Colors.red.shade200),
                  ),
                  child: ExpenseTile(
                    id: expense.id,
                    title: expense.title,
                    amount: expense.amount,
                    date: expense.date,
                    expenseType: expense.expenseType,
                  ),
                );
              },
            ),
          )
        : Text("No expenses recorded");
  }
}
