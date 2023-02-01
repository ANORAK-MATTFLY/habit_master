import 'dart:isolate';

import '../../infrastructure/data_sources/local_data_source/author_db.dart';
import '../../infrastructure/models/author_model.dart';

class AuthorLogic {
  createAuthorIsolate() async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_createAuthorMainIsolate, receivePort.sendPort);
    return receivePort.first;
  }

  void _createAuthorMainIsolate(SendPort sendPort) async {
    try {
      final authorsExist = await AuthorDatabase.instance.checkIfAuthorsExist();
      if (authorsExist == true) {
        await AuthorDatabase.createAuthor(predefinedAuthors);
        Isolate.exit(sendPort, "The initialization succeeded!");
      }
    } catch (e) {
      rethrow;
    }
  }
}
