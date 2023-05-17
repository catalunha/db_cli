import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../models/address_model.dart';
import '../../../models/city_model.dart';
import '../../../models/phone_model.dart';
import '../../../models/student_model.dart';
import '../../../repositories/product_dio_repository.dart';
import '../../../repositories/student_dio_repository.dart';

class StudentsSaveSubcommand extends Command {
  final StudentDioRepository studentRepository;
  final productRepository = ProductDioRepository();
  StudentsSaveSubcommand({
    required this.studentRepository,
  }) {
    argParser.addOption('file', abbr: 'f', help: 'Path for the csv file');
    argParser.addOption('id',
        abbr: 'i', help: 'Id do Student para ser alterado');
  }

  @override
  String get name => 'save';
  @override
  String get description => 'Save data of student';
  @override
  Future<void> run() async {
    int? id;
    if (argResults?['id'] != null) {
      id = int.tryParse(argResults!['id']);
    }
    if (argResults?['file'] == null) {
      print('Informe o arquivo com os dados dos Students');
      return;
    }
    try {
      final filePath = argResults!['file'];
      final studentsLines = File(filePath).readAsLinesSync();
      for (var line in studentsLines) {
        print(line);
        final cols = line.split(';');
        final courses = cols[2].split(',').map((e) => e.trim()).toList();
        print(courses);
        final coursesModelFutures = courses.map((e) async {
          final course = await productRepository.getByName(e);
          final course2 = course.copyWith(isStudent: true);
          return course2;
        }).toList();
        print(coursesModelFutures);
        final coursesModel = await Future.wait(coursesModelFutures);
        print(coursesModel);
        final student = StudentModel(
            id: id,
            name: cols[0],
            age: int.tryParse(cols[1]),
            nameCourses: courses,
            courses: coursesModel,
            address: AddressModel(
              street: cols[3],
              number: int.tryParse(cols[4]) ?? 0,
              zipCode: cols[5],
              city: CityModel(id: 1, name: cols[6]),
              phone:
                  PhoneModel(ddd: int.tryParse(cols[7]) ?? 0, phone: cols[8]),
            ));

        await studentRepository.save(student);
        print('Aluno ${cols[0]} inserido com sucesso');
        if (id != null) {
          break;
        }
      }
    } catch (e) {
      print('Erro ao adicionar aluno');
    }
  }
}
