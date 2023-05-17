// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      street: json['street'] as String,
      number: json['number'] as int,
      zipCode: json['zipCode'] as String,
      city: CityModel.fromJson(json['city'] as Map<String, dynamic>),
      phone: PhoneModel.fromJson(json['phone'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'number': instance.number,
      'zipCode': instance.zipCode,
      'city': instance.city,
      'phone': instance.phone,
    };
