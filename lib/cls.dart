import 'dart:io';

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
