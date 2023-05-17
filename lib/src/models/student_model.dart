import 'package:json_annotation/json_annotation.dart';

import 'address_model.dart';
import 'course_model.dart';

part 'student_model.g.dart';

@JsonSerializable()
class StudentModel {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<CourseModel> courses;
  final AddressModel address;
  StudentModel({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });
  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentModelToJson(this);

  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};

  //   if (id != null) {
  //     result.addAll({'id': id});
  //   }
  //   result.addAll({'name': name});
  //   if (age != null) {
  //     result.addAll({'age': age});
  //   }
  //   result.addAll({'nameCourses': nameCourses});
  //   result.addAll({'courses': courses.map((x) => x.toMap()).toList()});
  //   result.addAll({'address': address.toMap()});

  //   return result;
  // }

  // factory StudentModel.fromMap(Map<String, dynamic> map) {
  //   return StudentModel(
  //     id: map['id']?.toInt(),
  //     name: map['name'] ?? '',
  //     age: map['age']?.toInt(),
  //     nameCourses: List<String>.from(map['nameCourses']),
  //     courses: List<CourseModel>.from(
  //         map['courses']?.map((x) => CourseModel.fromMap(x))),
  //     address: AddressModel.fromMap(map['address']),
  //   );
  // }
}
