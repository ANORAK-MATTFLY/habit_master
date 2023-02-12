import '../../infrastructure/models/author_model.dart';

abstract class AuthorInterface {
  Future<bool> createAuthor(Author author);
  Future<bool> checkIfAuthorExist(String authorID);
  Future<bool> subscribeToRoutine(String routineID);
  Future getAuthorById(String authorID);
}
