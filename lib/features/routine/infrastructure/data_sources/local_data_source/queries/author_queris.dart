import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:sqflite/sqflite.dart';

class AuthorQueries {
  Future<Author> getAuthor(Database database, String authorID) async {
    final rawAuthorsData = await database
        .rawQuery("SELECT * FROM author WHERE author_id = '$authorID'");
    final List<Author> author = [];
    for (var i = 0; i < rawAuthorsData.length; i++) {
      final rawAuthorData = rawAuthorsData[i];
      final Author authorData = Author.fromJson(rawAuthorData);
      author.add(authorData);
    }
    return author.first;
  }
}
