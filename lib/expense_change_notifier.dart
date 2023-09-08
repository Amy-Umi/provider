import 'package:provider/default_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class ExpansesChangeNotifier extends StateNotifier<List<Expense>> {
  ExpansesChangeNotifier() : super([Expense("default example: buy milk",
      4.20)
  ]);


  final descriptionController = TextEditingController();
  final amountController = TextEditingController();

  void saveExpense(Expense expense) {
    final description = descriptionController.text;
    final amount = double.tryParse(amountController.text) ?? 0.0;
    if (description.isNotEmpty && amount > 0) {
      final expense = Expense(description, amount);
      state = [...state, expense];
    }
  }
}

final expansesChangeProvider = StateNotifierProvider<ExpansesChangeNotifier, List<Expense>>((ref) => ExpansesChangeNotifier());