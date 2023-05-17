import 'dart:convert';

import 'package:collection/collection.dart';

import 'address_model.dart';
import 'course_model.dart';

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

  StudentModel copyWith({
    int? id,
    String? name,
    int? age,
    List<String>? nameCourses,
    List<CourseModel>? courses,
    AddressModel? address,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      nameCourses: nameCourses ?? this.nameCourses,
      courses: courses ?? this.courses,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'name': name});
    if (age != null) {
      result.addAll({'age': age});
    }
    result.addAll({'nameCourses': nameCourses});
    result.addAll({'courses': courses.map((x) => x.toMap()).toList()});
    result.addAll({'address': address.toMap()});

    return result;
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      age: map['age']?.toInt(),
      nameCourses: List<String>.from(map['nameCourses']),
      courses: List<CourseModel>.from(
          map['courses']?.map((x) => CourseModel.fromMap(x))),
      address: AddressModel.fromMap(map['address']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentModel(id: $id, name: $name, age: $age, nameCourses: $nameCourses, courses: $courses, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is StudentModel &&
        other.id == id &&
        other.name == name &&
        other.age == age &&
        listEquals(other.nameCourses, nameCourses) &&
        listEquals(other.courses, courses) &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        age.hashCode ^
        nameCourses.hashCode ^
        courses.hashCode ^
        address.hashCode;
  }
}
