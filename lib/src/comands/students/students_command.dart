import 'package:args/command_runner.dart';

import '../../repositories/student_repository.dart';
import 'subcommands/students_get_subcommand.dart';

class StudentsCommand extends Command {
  @override
  String get name => 'students';
  @override
  String get description => 'Students Operations';

  StudentsCommand() {
    final StudentRepository studentRepository = StudentRepository();
    addSubcommand(StudentsGetSubcommand(
      studentRepository: studentRepository,
    ));
  }
}
