import 'city_model.dart';
import 'phone_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final String street;
  final int number;
  final String zipCode;
  final CityModel city;
  final PhoneModel phone;
  AddressModel({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.phone,
  });

  AddressModel copyWith({
    String? street,
    int? number,
    String? zipCode,
    CityModel? city,
    PhoneModel? phone,
  }) {
    return AddressModel(
      street: street ?? this.street,
      number: number ?? this.number,
      zipCode: zipCode ?? this.zipCode,
      city: city ?? this.city,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'street': street});
    result.addAll({'number': number});
    result.addAll({'zipCode': zipCode});
    result.addAll({'city': city.toMap()});
    result.addAll({'phone': phone.toMap()});

    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'] ?? '',
      number: map['number']?.toInt() ?? 0,
      zipCode: map['zipCode'] ?? '',
      city: CityModel.fromMap(map['city']),
      phone: PhoneModel.fromMap(map['phone']),
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
