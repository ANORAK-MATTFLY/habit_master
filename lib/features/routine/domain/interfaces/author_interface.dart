import '../../infrastructure/models/author_model.dart';

abstract class AuthorInterface {
  Future<bool> createAuthor(Author author);
  Future<bool> checkIfAuthorExist(String authorID);
}
