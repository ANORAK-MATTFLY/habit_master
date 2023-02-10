import 'package:habit_master/features/routine/domain/interfaces/author_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/author_mutations.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/author_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

class AuthorRepository implements AuthorInterface {
  final AuthorMutations authorMutations = AuthorMutations();
  final AuthorQueries authorQueries = AuthorQueries();

  @override
  Future<bool> checkIfAuthorExist(String authorID) {
    return AuthorQueries().checkIfAuthorExist(authorID);
  }

  @override
  Future<bool> createAuthor(Author author) async {
    return AuthorMutations().createAuthor(author);
  }
}
