import 'dart:convert';

import 'city_model.dart';
import 'phone_model.dart';

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

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(street: $street, number: $number, zipCode: $zipCode, city: $city, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressModel &&
        other.street == street &&
        other.number == number &&
        other.zipCode == zipCode &&
        other.city == city &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        number.hashCode ^
        zipCode.hashCode ^
        city.hashCode ^
        phone.hashCode;
  }
}
