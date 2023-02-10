import 'package:habit_master/core/db/local_db.dart';

class AuthorQueries {
  Future<bool> checkIfAuthorExist(String authorID) async {
    final database = await LocalDatabase.instance.database;
    final maps = await database
        .rawQuery("SELECT * FROM author WHERE id= '$authorID' LIMIT 1");
    return maps.isNotEmpty;
  }
}
