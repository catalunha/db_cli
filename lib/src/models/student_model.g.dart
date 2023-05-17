// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) => StudentModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      age: json['age'] as int?,
      nameCourses: (json['nameCourses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      courses: (json['courses'] as List<dynamic>)
          .map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'nameCourses': instance.nameCourses,
      'courses': instance.courses,
      'address': instance.address,
    };
