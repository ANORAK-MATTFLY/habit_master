import 'package:habit_master/features/routine/domain/interfaces/author_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/author_mutations.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/author_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

class AuthorRepository implements AuthorInterface {
  AuthorRepository({
    required this.authorMutations,
    required this.authorQueries,
  });
  final AuthorMutations authorMutations;
  final AuthorQueries authorQueries;

  @override
  Future<bool> checkIfAuthorsExist() {
    return AuthorQueries().checkIfAuthorsExist();
  }

  @override
  Stream<bool> createAuthor(List<Author> authors) {
    return AuthorMutations().createAuthor(authors);
  }
}
