import 'dart:io';
import 'package:args/args.dart';

ArgResults argResults;

void main(List<String> args) {
  final parser = ArgParser()..addFlag('recursive', negatable: false, abbr: 'r');

  argResults = parser.parse(args);

  if (argResults.rest.isEmpty) {
    cls(Directory.current, argResults['recursive']);
  } else {
    cls(Directory(argResults.rest[0].toString()), argResults['recursive']);
  }
}

void cls(Directory folder, bool recursive) {
  if (recursive) {
    folder
        .list(recursive: true, followLinks: false)
        .listen((FileSystemEntity entity) {
      print(entity.path);
    });
  } else {
    folder
        .list(recursive: false, followLinks: false)
        .listen((FileSystemEntity entity) {
      print(entity.path);
    });
  }
}
