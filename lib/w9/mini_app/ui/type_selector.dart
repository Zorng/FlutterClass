import 'package:flutter/material.dart';
import 'package:project2/w9/mini_app/model/expense.dart';

class TypeSelector extends StatelessWidget {
  final void Function(ExpenseType) getType;
  const TypeSelector({super.key, required this.getType });

  final List<ExpenseType> expenseTypes = ExpenseType.values;

 // ExpenseType ? _selectedType;
  void onSelect(ExpenseType value) {
    getType(value);
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild Category");
    return DropdownMenu<ExpenseType>(
      onSelected: (value) => onSelect(value!),
      textStyle: TextStyle(fontSize: 10),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(fontSize: 10),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      ),
      label: Text("type", style: TextStyle(fontSize: 10)),
      dropdownMenuEntries: expenseTypes
          .map(
            (type) => DropdownMenuEntry(
              value: type,
              label: type.name,
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size.fromHeight(25)),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 10)),
              ),
            ),
          )
          .toList(),
    );
  }
}
