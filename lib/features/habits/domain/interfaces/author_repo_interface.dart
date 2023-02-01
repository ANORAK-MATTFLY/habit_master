import 'package:habit_master/features/habits/infrastructure/models/author_model.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class AuthorRepositoryInterface {
  Stream<bool> createAuthor(Database database, List<Author> authors);
}
