import 'package:habit_master/features/routine/domain/interfaces/author_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/author_mutations.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/author_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

class AuthorRepository implements AuthorInterface {
  AuthorRepository({required this.authorMutations});
  final AuthorMutations authorMutations;
  final AuthorQueries authorQueries = AuthorQueries();

  @override
  Future<bool> checkIfAuthorExist(String authorID) {
    return AuthorQueries().checkIfAuthorExist(authorID);
  }

  @override
  Future<Author> getAuthorById(String authorID) async {
    final rawAuthorData = await AuthorQueries().getAuthorById(authorID);
    final Author author = Author.fromJson(rawAuthorData[0]);
    return author;
  }

  @override
  Future<Author?> getCachedAuthor(String userID) async {
    final rawAuthorData = await AuthorQueries().getCachedAuthor(userID);
    if (rawAuthorData.isEmpty) {
      return null;
    }
    final author = Author.fromJson(rawAuthorData[0]);
    return author;
  }
}
