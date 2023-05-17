import 'dart:convert';

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

  String toJson() => json.encode(toMap());

  factory PhoneModel.fromJson(String source) =>
      PhoneModel.fromMap(json.decode(source));

  @override
  String toString() => 'PhoneModel(ddd: $ddd, phone: $phone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhoneModel && other.ddd == ddd && other.phone == phone;
  }

  @override
  int get hashCode => ddd.hashCode ^ phone.hashCode;
}
