import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  final int id;
  final String name;
  CityModel({
    required this.id,
    required this.name,
  });

  CityModel copyWith({
    int? id,
    String? name,
  }) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});

    return result;
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
