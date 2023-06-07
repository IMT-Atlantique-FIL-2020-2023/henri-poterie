import 'package:flutter_test/flutter_test.dart';
import 'package:henri_poterie/models/cart.dart';
import 'package:henri_poterie/models/library.dart';

void main() {
  test('Fetch books', () async {
    final lib = await Library.fetchLibrary();
    expect(lib.books.length, 7);
  });

  test('Compute best offer with one book', () async {
    final lib = await Library.fetchLibrary();
    final cart = Cart();
    cart.add(lib.books[0]);
    expect(cart.books.length, 1);

    final offer = await cart.computeTotalWithOffer();
    expect(offer.$1, 33.25);
    expect(offer.$2, "Percentage");
  });

  test('Compute best offer with no books', () async {
    final cart = Cart();
    await cart.computeTotalWithOffer();
  });
}
