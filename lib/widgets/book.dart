import 'package:flutter/cupertino.dart';
import 'package:henri_poterie/models/book.dart' as model;
import 'package:henri_poterie/screens/book_detail_screen.dart';

class Book extends StatelessWidget {
  final model.Book _book;

  const Book({super.key, required model.Book book}) : _book = book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          BookDetailScreen.route(book: _book),
        )
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(
                image: NetworkImage(_book.coverUrl.toString()),
                width: 150,
                height: 266,
              ),
              Text(
                _book.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              Text(
                '\$${_book.price}',
              )
            ],
          ),
        ),
      ),
    );
  }
}
