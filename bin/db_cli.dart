import 'package:args/command_runner.dart';
import 'package:db_cli/src/comands/students/students_command.dart';

void main(List<String> arguments) {
  try {
    CommandRunner('DB cli', 'DB cli...')
      ..addCommand(StudentsCommand())
      ..run(arguments);
  } catch (e) {
    print('Comandos com erro. Veja -h');
  }
}
