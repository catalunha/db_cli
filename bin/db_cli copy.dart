// import 'package:args/command_runner.dart';

// void main(List<String> arguments) {
//   // print(arguments);
//   // final argParser = ArgParser();
//   // argParser.addFlag('data', abbr: 'd');
//   // argParser.addOption('name', abbr: 'n');
//   // argParser.addOption('type', abbr: 't');
//   // final argResult = argParser.parse(arguments);
//   // print(argResult['data']);
//   // print(argResult['name']);
//   // print(argResult['type']);
//   CommandRunner('DB cli', 'DB cli...')
//     ..addCommand(ExemploCommand())
//     ..run(arguments);
// }

// class ExemploCommand extends Command {
//   @override
//   String get name => 'exemplo';
//   @override
//   String get description => 'Exemplo de comando';

//   ExemploCommand() {
//     argParser.addOption('type', abbr: 't', help: 'Envie o tipo de programa');
//   }
//   @override
//   void run() {
//     print(argResults?['type']);
//     print('exe...');
//   }
// }
