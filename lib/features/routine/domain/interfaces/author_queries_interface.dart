import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

abstract class AuthorQueriesInterface {
  Future<bool> checkIfAuthorExist(String authorID);
  Future<List<Map<String, Object?>>> getAuthorById(String authorID);
  Future<List<Map<String, Object?>>> getCachedAuthor(String userID);
  Future<List<Author>> getCelebs();
}
