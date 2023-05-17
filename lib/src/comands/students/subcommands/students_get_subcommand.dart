import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class StudentsGetSubcommand extends Command {
  final StudentRepository studentRepository;
  StudentsGetSubcommand({
    required this.studentRepository,
  });

  @override
  String get name => 'get';
  @override
  String get description => 'Get all students';

  @override
  Future<void> run() async {
    print('Aguarde buscando alunos...');
    final students = await studentRepository.get();
    print('Apresentar também os cursos (s ou n)');
    final showCourses =
        stdin.readLineSync()?.toLowerCase() == 's' ? true : false;
    // print(students.toString());
    for (var student in students) {
      if (showCourses) {
        print(
            '${student.id} ${student.name} ${student.courses.where((e) => e.isStudent).map((e) => e.name).toList()}');
      } else {
        print('${student.id} ${student.name}');
      }
      // print(student.toString());
    }
    // print(showCourses);
  }
}
