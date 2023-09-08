import 'package:flutter/material.dart';
import 'package:provider/expenses_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/routers.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/expense_input.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: Routers.expense_list,
    routes: {
      Routers.expense_input: (context) => ExpenseInputScreen(),
      Routers.expense_list: (context) => ExpenseListScreen(),
    },
    );
  }
}
