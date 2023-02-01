import 'package:sqflite/sqlite_api.dart';

import '../../infrastructure/models/author_model.dart';

abstract class AuthorMutationInterface {
  Stream<bool> createAuthor(Database database, List<Author> author);
}
