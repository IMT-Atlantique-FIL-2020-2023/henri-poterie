import 'package:flutter/cupertino.dart';
import 'package:henri_poterie/models/book.dart' as model;

class Book extends StatelessWidget {
  final model.Book _book;

  const Book({super.key, required model.Book book}) : _book = book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, '/book')},
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: SizedBox(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(image: NetworkImage(_book.coverUrl.toString())),
              Text(
                _book.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
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
