import 'package:flutter/material.dart';

import '../widgets/book_overview.dart';
import '../widgets/book_synopsis.dart';
import 'package:henri_poterie/models/book.dart' as model;

import 'basket_sheet.dart';

class BookDetailScreen extends StatelessWidget {
  static Route<void> route({required model.Book book}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BasketSheet(widget: BookDetailScreen(book: book)),
    );
  }

  final model.Book _book;

  const BookDetailScreen({super.key, required model.Book book}) : _book = book;

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
                    ? ([
                        Expanded(
                          flex: 1,
                          child: BookOverview(book: _book),
                        ),
                        Expanded(flex: 2, child: BookSynopsis(book: _book))
                      ])
                    : ([
                        SizedBox(
                            width: double.infinity,
                            child: BookOverview(book: _book)),
                        SizedBox(
                            width: double.infinity,
                            child: BookSynopsis(book: _book))
                      ]),
              )),
        ));
  }
}
