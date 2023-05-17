import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/course_model.dart';

class ProductRepository {
  Future<CourseModel> getByName(String name) async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/products?name=$name'));
    if (response.statusCode != 200) {
      throw Exception();
    }
    final responseBodyJson = jsonDecode(response.body);
    if (responseBodyJson.isEmpty) {
      throw Exception('Produto não encontrado');
    }
    return CourseModel.fromMap(responseBodyJson.first);
  }
}
