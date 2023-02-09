import '../../infrastructure/models/author_model.dart';

abstract class AuthorInterface {
  Future<bool> createAuthor(List<Author> author);
  Future<bool> checkIfAuthorsExist();
}
