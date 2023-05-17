import 'package:args/command_runner.dart';

import '../../repositories/student_dio_repository.dart';
import 'subcommands/students_delete_subcommand.dart';
import 'subcommands/students_get_id_subcommand.dart';
import 'subcommands/students_get_subcommand.dart';
import 'subcommands/students_save_subcommand.dart';

class StudentsCommand extends Command {
  @override
  String get name => 'students';
  @override
  String get description => 'Students Operations';

  StudentsCommand() {
    try {
      final StudentDioRepository studentRepository = StudentDioRepository();
      addSubcommand(StudentsGetSubcommand(
        studentRepository: studentRepository,
      ));
      addSubcommand(StudentsGetIdSubcommand(
        studentRepository: studentRepository,
      ));
      addSubcommand(StudentsSaveSubcommand(
        studentRepository: studentRepository,
      ));
      addSubcommand(StudentsDeleteSubcommand(
        studentRepository: studentRepository,
      ));
    } catch (e) {
      print('SubComandos com erro. Veja -h');
    }
  }
}
