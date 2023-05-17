import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/student_retrofit_repository.dart';

class StudentsDeleteSubcommand extends Command {
  final StudentRetrofitRepository studentRepository;

  StudentsDeleteSubcommand({
    required this.studentRepository,
  }) {
    argParser.addOption('id', help: 'Informe o Id do Student');
  }

  @override
  String get name => 'delete';
  @override
  String get description => 'Delete Student by Id';

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
      print('Deletar o estudante: ${student.name}');
      print('Confirma ? (s ou n)');
      final showCourses =
          stdin.readLineSync()?.toLowerCase() == 's' ? true : false;
      if (showCourses) {
        await studentRepository.delete(id.toString());
      } else {
        print('Deleção cancelada');
      }
      //   print(student.toString());
    } catch (e) {
      print('Estudante com este Id nao encontrado');
    }
  }
}
