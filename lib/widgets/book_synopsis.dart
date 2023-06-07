import 'package:flutter/cupertino.dart';
import 'package:henri_poterie/models/book.dart' as model;

class BookSynopsis extends StatelessWidget {
  final model.Book _book;

  const BookSynopsis({super.key, required model.Book book}) : _book = book;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 30),
          const Text('Synopsis',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 10),
          Text(_book.synopsis)
        ]));
  }
}
