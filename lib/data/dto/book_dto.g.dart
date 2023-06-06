// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDTO _$BookDTOFromJson(Map<String, dynamic> json) => BookDTO(
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      cover: json['cover'] as String,
      synopsis: json['synopsis'] as String,
    );

Map<String, dynamic> _$BookDTOToJson(BookDTO instance) => <String, dynamic>{
      'isbn': instance.isbn,
      'title': instance.title,
      'price': instance.price,
      'cover': instance.cover,
      'synopsis': instance.synopsis,
    };
