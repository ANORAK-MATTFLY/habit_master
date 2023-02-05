import '../../infrastructure/models/author_model.dart';

abstract class AuthorInterface {
  Stream<bool> createAuthor(List<Author> author);
  Future<bool> checkIfAuthorsExist();
}
