import 'package:json_annotation/json_annotation.dart';

part 'phone_model.g.dart';

@JsonSerializable()
class PhoneModel {
  final int ddd;
  final String phone;
  PhoneModel({
    required this.ddd,
    required this.phone,
  });

  PhoneModel copyWith({
    int? ddd,
    String? phone,
  }) {
    return PhoneModel(
      ddd: ddd ?? this.ddd,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'ddd': ddd});
    result.addAll({'phone': phone});

    return result;
  }

  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      ddd: map['ddd']?.toInt() ?? 0,
      phone: map['phone'] ?? '',
    );
  }

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneModelToJson(this);
}
