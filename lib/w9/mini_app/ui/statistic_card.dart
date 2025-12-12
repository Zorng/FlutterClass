import 'package:flutter/material.dart';
import 'package:project2/w9/mini_app/model/expense.dart';

class StatisticCard extends StatelessWidget {
  final List<Expense> data;
  const StatisticCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: const Color.fromARGB(0, 0, 0, 0),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      borderRadius: BorderRadius.all(Radius.circular(12)),
      
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 226, 219, 219),
          //borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ... ExpenseType.values.map((type) => Column(
              children: [
                Icon(type.icon,),
                Text(type.name, style: TextStyle(fontWeight: FontWeight.bold),),
                Text("\$${data.where((expense) => expense.expenseType == type).fold(0.0, (prev, element) => prev + element.amount)}")
              ],
            ))
          ], 
        ),
      ),
    );
  }
}