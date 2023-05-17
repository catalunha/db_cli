import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/student_model.dart';

part 'student_retrofit_repository.g.dart';

@RestApi(baseUrl: 'http://localhost:8080/')
abstract class StudentRetrofitRepository {
  factory StudentRetrofitRepository(Dio dio, {String baseUrl}) =
      _StudentRetrofitRepository;

  @GET('/students')
  Future<List<StudentModel>> get();
  @GET('/students/{id}')
  Future<StudentModel> getId(@Path('id') String id);
  @POST('/students')
  Future<void> post(@Body() StudentModel model);
  @PUT("/students/{id}")
  Future<StudentModel> put(@Path() String id, @Body() StudentModel model);
  @DELETE("/students/{id}")
  Future<void> delete(@Path() String id);
}
