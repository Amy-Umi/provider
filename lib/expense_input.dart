import 'package:provider/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/default_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:provider/expense_change_notifier.dart";
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:provider/routers.dart';
import 'package:go_router/go_router.dart';

class ExpenseInputScreen extends ConsumerWidget {


  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expanse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: ()  {
                final description = _descriptionController.text;
                final amount = double.tryParse(_amountController.text) ?? 0.0;
                if (description.isNotEmpty && amount > 0) {
                  final expense = Expense(description, amount);
                ref.read(expansesChangeProvider.notifier).saveExpense(expense);
                  final expenses = ref.watch(expansesChangeProvider);
                   expenses.add(expense);
                  Navigator.of(context).pushNamed(Routers.expense_list);
                  // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ExpenseListScreen()));
                } else {
                  //
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}