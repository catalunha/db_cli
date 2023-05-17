import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/student_retrofit_repository.dart';

class StudentsGetIdSubcommand extends Command {
  final StudentRetrofitRepository studentRepository;
  StudentsGetIdSubcommand({
    required this.studentRepository,
  }) {
    argParser.addOption('id', help: 'Informe o Id do Student');
  }

  @override
  String get name => 'getid';
  @override
  String get description => 'Get Student by Id';

  @override
  Future<void> run() async {
    print('Aguarde buscando aluno...');

    if (argResults?['id'] == null) {
      print('Informe o Id do Student');
      return;
    }
    final id = int.tryParse(argResults?['id']);
    if (id == null) {
      print('Id não é número');
      return;
    }
    try {
      final student = await studentRepository.getId(id.toString());
      print('Apresentar também os cursos (s ou n)');
      final showCourses =
          stdin.readLineSync()?.toLowerCase() == 's' ? true : false;
      if (showCourses) {
        print(
            '${student.id} ${student.name} ${student.courses.where((e) => e.isStudent).map((e) => e.name).toList()}');
      } else {
        print('${student.id} ${student.name}');
      }
      //   print(student.toString());
    } catch (e) {
      print('Estudante com este Id nao encontrado');
    }
  }
}
