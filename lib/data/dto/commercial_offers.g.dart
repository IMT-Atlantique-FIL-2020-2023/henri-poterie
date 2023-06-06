// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commercial_offers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommercialOffersDTO _$CommercialOffersDTOFromJson(Map<String, dynamic> json) =>
    CommercialOffersDTO(
      offers: (json['offers'] as List<dynamic>)
          .map((e) => OfferTypeDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommercialOffersDTOToJson(
        CommercialOffersDTO instance) =>
    <String, dynamic>{
      'offers': instance.offers,
    };

PercentageDTO _$PercentageDTOFromJson(Map<String, dynamic> json) =>
    PercentageDTO(
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$PercentageDTOToJson(PercentageDTO instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

MinusDTO _$MinusDTOFromJson(Map<String, dynamic> json) => MinusDTO(
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$MinusDTOToJson(MinusDTO instance) => <String, dynamic>{
      'value': instance.value,
    };

SliceDTO _$SliceDTOFromJson(Map<String, dynamic> json) => SliceDTO(
      value: (json['value'] as num).toDouble(),
      sliceValue: (json['sliceValue'] as num).toDouble(),
    );

Map<String, dynamic> _$SliceDTOToJson(SliceDTO instance) => <String, dynamic>{
      'value': instance.value,
      'sliceValue': instance.sliceValue,
    };
