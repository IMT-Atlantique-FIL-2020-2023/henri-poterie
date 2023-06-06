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
        body: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.2),
          children: const [
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
        ));
  }
}
