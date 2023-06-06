import 'package:flutter/material.dart';
import 'package:henri_poterie/screens/basket_sheet.dart';
import 'package:henri_poterie/screens/book_detail_screen.dart';
import 'package:henri_poterie/screens/home_screen.dart';

void main() {
  runApp(const HenriPoterie());
}

class HenriPoterie extends StatelessWidget {
  const HenriPoterie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BasketSheet(widget: HomeScreen()),
        '/book': (context) => const BasketSheet(widget: BookDetailScreen()),
      }
    );
  }
}
