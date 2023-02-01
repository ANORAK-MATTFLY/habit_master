import 'package:habit_master/features/habits/domain/interfaces/author_repo_interface.dart';
import 'package:habit_master/features/habits/infrastructure/data_sources/local_data_source/mutation/author_mutations.dart';
import 'package:habit_master/features/habits/infrastructure/models/author_model.dart';
import 'package:sqflite/sqflite.dart';

class AuthorRepository implements AuthorRepositoryInterface {
  @override
  Stream<bool> createAuthor(Database database, List<Author> authors) async* {
    AuthorMutations().createAuthor(database, authors);
  }
}
