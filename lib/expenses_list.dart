import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/expense_card.dart';
import "package:provider/expense_change_notifier.dart";
import 'package:provider/expense_input.dart';
import 'package:provider/routers.dart';

class ExpenseListScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends ConsumerState<ExpenseListScreen> {


  @override
  Widget build(BuildContext context) {

    final expenses = ref.watch(expansesChangeProvider);
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Expense List'),
        ),
        body: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) {
            var expense = expenses[index];
            return ExpenseCard(expense);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
    Navigator.pushNamed(context, Routers.expense_input);
    //Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseInputScreen()),

          },
      child: Icon(Icons.add),
    ) ,
  );
  }
}