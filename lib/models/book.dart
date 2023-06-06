import 'dart:math';

/// Book model
class Book {
  final String title;
  final String isbn;
  final String synopsis;
  final double price;
  final Uri coverUrl;

  /// Random number to generate a unique id for the book
  final int _rand = Random().nextInt(1000000);

  Book(
      {required this.title,
      required this.isbn,
      required this.synopsis,
      required this.coverUrl,
      required this.price});

  /// Unique id for the book
  String get uuid => "$isbn-$_rand";
}
