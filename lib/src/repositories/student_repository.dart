import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/student_model.dart';

class StudentRepository {
  Future<List<StudentModel>> get() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/students'));
    if (response.statusCode != 200) {
      throw Exception();
    }
    List<dynamic> responseBodyJson = jsonDecode(response.body);
    if (responseBodyJson.isEmpty) {
      throw Exception('Estudantes não encontrados');
    }
    return responseBodyJson
        .map<StudentModel>((e) => StudentModel.fromMap(e))
        .toList();
  }

  Future<StudentModel> getId(String id) async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/students/$id'));
    if (response.statusCode != 200) {
      throw Exception();
    }
    final responseBodyJson = jsonDecode(response.body);
    if (responseBodyJson.isEmpty) {
      throw Exception('Estudante não encontrado');
    }
    return StudentModel.fromMap(responseBodyJson);
  }

  Future<void> save(StudentModel model) async {
    if (model.id == null) {
      await _post(model);
    } else {
      await _put(model);
    }
  }

  Future<void> _post(StudentModel model) async {
    final response = await http.post(
        Uri.parse('http://localhost:8080/students'),
        body: model.toJson(),
        headers: {'content-type': 'application/json'});
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> _put(StudentModel model) async {
    final response = await http.put(
        Uri.parse('http://localhost:8080/students/${model.id}'),
        body: model.toJson(),
        headers: {'content-type': 'application/json'});
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> delete(String id) async {
    final response = await http.delete(
      Uri.parse('http://localhost:8080/students/$id'),
    );
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
