import 'package:henri_poterie/data/remote/henri_potier_api.dart';
import 'package:collection/collection.dart';
import '../data/dto/commercial_offers.dart';
import 'book.dart';
import 'offer.dart';

/// Cart model
class Cart {
  List<Book> books = [];

  Cart({required this.books});

  /// Total price of the cart
  double get total => books.fold(0, (a, b) => a + b.price);

  /// Compute the total price of the cart with the best offer
  Future<(double newPrice, String offerType)> computeTotalWithOffer() async {
    final commercialOffers = await henriPotierRestClient.getCommercialOffers(
        ListStringToJoin(books.map((b) => b.isbn).toList()));

    final availableOffers = commercialOffers.offers
        .map((offer) =>
    switch (offer) {
      PercentageDTO(value: var value) => Percentage(value: value),
      MinusDTO(value: var value) => Minus(value: value),
      SliceDTO(value: var value, sliceValue: var sliceValue) =>
          Slice(value: value, sliceValue: sliceValue)
    })
        .toList();

    /// To compute it only one time
    final totalTmp = total;

    final computedOffers = availableOffers
        .map((offer) => (offer.apply(totalTmp), offer.runtimeType.toString()));

    final min = minBy(computedOffers, (p0) => p0.$1);
    if (min == null) {
      return (totalTmp, "No offer");
    }
    return min;
  }
}
