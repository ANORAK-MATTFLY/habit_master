import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

abstract class AuthorInterface {
  Future<bool> checkIfAuthorExist(String authorID);
  Future getAuthorById(String authorID);
  Future<Author?> getCachedAuthor(String userID);
}
