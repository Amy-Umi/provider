import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:provider/default_list.dart";
import 'package:provider/routers.dart';

class ExpenseCard extends StatelessWidget{
  final Expense expense;

  const ExpenseCard(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurpleAccent,
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(expense.description, style: TextStyle(fontSize: 20)),
                SizedBox(width: 25,),
                Text('\$${expense.amount}', style: TextStyle(fontSize: 24)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
