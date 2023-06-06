import 'package:flutter/material.dart';

import '../widgets/book_profil.dart';
import '../widgets/book_synopsis.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Henri Poterie"),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Flex(
                direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                children: isScreenWide
                    ? (const [
                        Expanded(
                          flex: 1,
                          child: BookProfil(),
                        ),
                        Expanded(flex: 2, child: BookSynopsis())
                      ])
                    : (const [
                        SizedBox(
                          width: double.infinity,
                          child: BookProfil(),
                        ),
                        SizedBox(width: double.infinity, child: BookSynopsis())
                      ]),
              )),
        ));
  }
}
