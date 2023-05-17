import 'dart:convert';

class CourseModel {
  final int id;
  final String name;
  final bool isStudent;
  CourseModel({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  CourseModel copyWith({
    int? id,
    String? name,
    bool? isStudent,
  }) {
    return CourseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isStudent: isStudent ?? this.isStudent,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'isStudent': isStudent});

    return result;
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      isStudent: map['isStudent'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CourseModel(id: $id, name: $name, isStudent: $isStudent)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseModel &&
        other.id == id &&
        other.name == name &&
        other.isStudent == isStudent;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ isStudent.hashCode;
}
