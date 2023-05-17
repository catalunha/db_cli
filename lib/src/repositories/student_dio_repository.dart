import 'package:dio/dio.dart';
import '../models/student_model.dart';

class StudentDioRepository {
  Future<List<StudentModel>> get() async {
    try {
      final response = await Dio().get('http://localhost:8080/students');

      if (response.data.isEmpty) {
        throw Exception('Estudantes não encontrados');
      }
      return response.data
          .map<StudentModel>((e) => StudentModel.fromMap(e))
          .toList();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<StudentModel> getId(String id) async {
    try {
      final response = await Dio().get('http://localhost:8080/students/$id');

      if (response.data.isEmpty) {
        throw Exception('Estudantes não encontrados');
      }

      return StudentModel.fromMap(response.data);
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> save(StudentModel model) async {
    if (model.id == null) {
      await _post(model);
    } else {
      await _put(model);
    }
  }

  Future<void> _post(StudentModel model) async {
    try {
      Dio().post('http://localhost:8080/students', data: model.toMap());
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> _put(StudentModel model) async {
    try {
      Dio().put('http://localhost:8080/students/${model.id}',
          data: model.toMap());
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> delete(String id) async {
    try {
      Dio().delete('http://localhost:8080/students/$id');
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}
