/// Commercial offers dto
import 'package:json_annotation/json_annotation.dart';

part 'commercial_offers.g.dart';

@JsonSerializable()
class CommercialOffersDTO {
  final List<OfferTypeDTO> offers;

  CommercialOffersDTO({required this.offers});

  factory CommercialOffersDTO.fromJson(Map<String, dynamic> json) =>
      _$CommercialOffersDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CommercialOffersDTOToJson(this);
}

sealed class OfferTypeDTO {
  factory OfferTypeDTO.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'percentage':
        return PercentageDTO.fromJson(json);
      case 'minus':
        return MinusDTO.fromJson(json);
      case 'slice':
        return SliceDTO.fromJson(json);
      default:
        throw Exception('Unknown type: ${json['type']}');
    }
  }

  Map<String, dynamic> toJson() => throw Exception('Not implemented');
}

@JsonSerializable()
class PercentageDTO implements OfferTypeDTO {
  final double value;

  PercentageDTO({required this.value});

  factory PercentageDTO.fromJson(Map<String, dynamic> json) =>
      _$PercentageDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PercentageDTOToJson(this);
}

@JsonSerializable()
class MinusDTO implements OfferTypeDTO {
  final double value;

  MinusDTO({required this.value});

  factory MinusDTO.fromJson(Map<String, dynamic> json) =>
      _$MinusDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MinusDTOToJson(this);
}

@JsonSerializable()
class SliceDTO implements OfferTypeDTO {
  final double value;
  final double sliceValue;

  SliceDTO({required this.value, required this.sliceValue});

  factory SliceDTO.fromJson(Map<String, dynamic> json) =>
      _$SliceDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SliceDTOToJson(this);
}
