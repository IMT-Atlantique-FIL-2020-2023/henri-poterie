import 'package:bloc/bloc.dart';
import 'package:henri_poterie/models/cart.dart';

import '../models/book.dart';

class CartCubit extends Cubit<Cart> {
  CartCubit() : super(Cart(books: []));

  void addBook(Book book) {
    final books = state.books;
    books.add(book);
    emit(Cart(books: books));
  }

  void removeBookAt(int index) {
    final books = state.books;
    books.removeAt(index);
    emit(Cart(books: books));
  }

  void resetCart() {
    emit(Cart(books: []));
  }
}