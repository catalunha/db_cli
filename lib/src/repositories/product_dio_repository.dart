import 'package:dio/dio.dart';

import '../models/course_model.dart';

class ProductDioRepository {
  Future<CourseModel> getByName(String name) async {
    try {
      final response = await Dio().get(
        'http://localhost:8080/products',
        queryParameters: {
          'name': name,
        },
      );
      if (response.statusCode != 200) {
        throw Exception();
      }
      //response.data já é um json
      if (response.data.isEmpty) {
        throw Exception('Produto não encontrado');
      }
      return CourseModel.fromMap(response.data.first);
    } on DioError {
      throw Exception();
    }
  }
}
