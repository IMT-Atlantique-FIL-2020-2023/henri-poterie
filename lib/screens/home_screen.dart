import 'package:flutter/material.dart';
import 'package:henri_poterie/widgets/book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Henri Poterie"),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                alignment: Alignment.topCenter,
                child: const Wrap(
                  spacing: 20,
                  children: [
                    Book(),
                    Book(),
                    Book(),
                    Book(),
                    Book(),
                    Book(),
                    Book(),
                    Book(),
                    Book(),
                    Book(),
                    Book(),
                    Book(),
                  ],
                ))));
  }
}
