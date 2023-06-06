import 'package:henri_poterie/data/dto/book_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../dto/commercial_offers.dart';

part 'henri_potier_api.g.dart';

final dio = Dio();
final henriPotierRestClient = HenriPotierRestClient(dio);

@RestApi(baseUrl: "https://henri-potier.techx.fr/")
abstract class HenriPotierRestClient {
  factory HenriPotierRestClient(Dio dio, {String baseUrl}) =
      _HenriPotierRestClient;

  @GET("books")
  Future<List<BookDTO>> getBooks();

  @GET("/books/{isbns}/commercialOffers")
  Future<CommercialOffersDTO> getCommercialOffers(
      @Path("isbns") ListStringToJoin isbns);
}

class ListStringToJoin {
  List<String> isbns;

  ListStringToJoin(this.isbns);

  @override
  String toString() => isbns.join(",");
}
