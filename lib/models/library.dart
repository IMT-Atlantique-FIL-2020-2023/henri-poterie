import 'package:henri_poterie/data/remote/henri_potier_api.dart';

import 'book.dart';

class Library {
  final List<Book> books;

  /// Fetch books from the api and populate the library
  static Future<Library> fetchLibrary() async => Library(
      books: (await henriPotierRestClient.getBooks())
          .map((e) => Book(
              title: e.title,
              isbn: e.isbn,
              synopsis: e.synopsis.join("\n"),
              coverUrl: Uri.parse(e.cover),
              price: e.price))
          .toList());

  Library({required this.books});
}
