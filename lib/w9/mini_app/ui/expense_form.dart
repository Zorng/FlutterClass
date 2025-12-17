import 'package:flutter/material.dart';
import 'package:project2/w9/mini_app/ui/date_picker.dart';
import 'package:project2/w9/mini_app/ui/type_selector.dart';
import '../model/expense.dart';

final List<ExpenseType> expenseTypes = ExpenseType.values;

class ExpenseForm extends StatefulWidget {
  final void Function(Expense) createExpense;
  const ExpenseForm({super.key, required this.createExpense});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  String title = '';
  String amount = '';
  ExpenseType? type;
  DateTime? date;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState() {
    _titleController.addListener(_updateTitle);
    _amountController.addListener(_updateAmount);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _updateTitle() {
    setState(() {
      title = _titleController.text;
    });
  }

  void _updateAmount() {
    setState(() {
      amount = _amountController.text;
    });
  }

  void getDate(DateTime d) {
    date = d;
  }

  void getType(ExpenseType t) {
    type = t;
  }

  bool validateInput(
    BuildContext context, {
    required String title,
    required String amount,
    required ExpenseType? type,
    required DateTime? date,
  }) {
    String errorMessage = '';
    if (title.isEmpty) {
      errorMessage = "Please enter title";
    } else if (date == null) {
      errorMessage = "Please provide date";
    } else if (type == null) {
      errorMessage = "Please select an expense type";
    } else {
      if (amount.isEmpty) {
        errorMessage = "Amount cannot be empty";
      } else {
        final double? parsedAmount = double.tryParse(amount);
        if (parsedAmount == null) {
          errorMessage = "Amount must be a valid number";
        } else if (parsedAmount < 0) {
          errorMessage = "Amount must be a positive number";
        }
      }
    }
    if (errorMessage.isEmpty) {
      return true;
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text("Cannot Save"),
          content: Text(errorMessage, style: TextStyle(color: Colors.red)),
          actions: [
            TextButton(
              onPressed: () => {Navigator.pop(context)},
              child: Text("Okay"),
            ),
          ],
        ),
      );
      return false;
    }
  }

  void _createNewExpense() {
    //print('$title, $amount, $date, $type');
    if(!validateInput(context, title: title, amount: amount, type: type, date: date)) return;

    widget.createExpense(
      Expense(amount: double.parse(amount), title: title, date: date!, expenseType: type!),
    );

    Navigator.pop<Expense>(context);
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild form");
    return Container(
      padding: EdgeInsets.only(top: 0, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add an Expense"),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 6),
              const Text("Title"),
              TextField(
                controller: _titleController,
                maxLength: 50,
                style: TextStyle(fontSize: 10),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: "Title",
                  hintStyle: TextStyle(fontSize: 10),
                ),
              ),
              const SizedBox(height: 4),
              const Text("Amount"),
              TextField(
                controller: _amountController,
                maxLength: 50,
                style: TextStyle(fontSize: 10),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: "Amount",
                  hintStyle: TextStyle(fontSize: 10),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TypeSelector(getType: getType),
                  DatePicker(getDate: getDate),
                ],
              ),

              Center(
                child: FilledButton(
                  onPressed: _createNewExpense,
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
