/// Book DTO
import 'package:json_annotation/json_annotation.dart';

part 'book_dto.g.dart';

@JsonSerializable()
class BookDTO {
  final String isbn;
  final String title;
  final double price;
  final String cover;
  final List<String> synopsis;

  BookDTO(
      {required this.isbn,
      required this.title,
      required this.price,
      required this.cover,
      required this.synopsis});

  factory BookDTO.fromJson(Map<String, dynamic> json) =>
      _$BookDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BookDTOToJson(this);
}
