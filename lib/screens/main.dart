import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vending_machine/controllers/snack_provider.dart';
import 'package:vending_machine/controllers/transaction_provider.dart';
import 'menu.dart'; // Adjust this import as per your file structure

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // initialized providers.
        ChangeNotifierProvider(create: (_) => SnackProvider()),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MenuPage(),
      ),
    );
  }
}
