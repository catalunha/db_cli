import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  final int id;
  final String name;
  final bool isStudent;
  CourseModel(
    this.id,
    this.name,
    this.isStudent,
  );

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CourseModelToJson(this);

  CourseModel copyWith({
    int? id,
    String? name,
    bool? isStudent,
  }) {
    return CourseModel(
      id ?? this.id,
      name ?? this.name,
      isStudent ?? this.isStudent,
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
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['isStudent'] ?? false,
    );
  }
}
