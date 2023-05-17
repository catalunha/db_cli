import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final bool? isStudent;
  ProductModel({
    required this.id,
    required this.name,
    this.isStudent,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    bool? isStudent,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isStudent: isStudent ?? this.isStudent,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    if (isStudent != null) {
      result.addAll({'isStudent': isStudent});
    }

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      isStudent: map['isStudent'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductModel(id: $id, name: $name, isStudent: $isStudent)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.isStudent == isStudent;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ isStudent.hashCode;
}
