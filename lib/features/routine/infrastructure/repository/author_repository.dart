import 'package:fpdart/fpdart.dart';
import 'package:habit_master/features/routine/domain/interfaces/author_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/author_mutations.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/author_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

import '../../../../core/errors/interface/error_model.dart';

class AuthorRepository implements AuthorInterface {
  final AuthorMutations authorMutations = AuthorMutations();
  final AuthorQueries authorQueries = AuthorQueries();

  @override
  Future<bool> checkIfAuthorExist(String authorID) {
    return AuthorQueries().checkIfAuthorExist(authorID);
  }

  @override
  Future<Either<ErrorInfo, bool>> createAuthor(Author author) async {
    return AuthorMutations().createAuthor(author);
  }

  @override
  Future<Either<ErrorInfo, bool>> subscribeToRoutine(
      String routineID, String currentUserID) {
    return AuthorMutations().subscribeToRoutine(routineID, currentUserID);
  }

  @override
  Future<Author> getAuthorById(String authorID) async {
    final rawAuthorData = await AuthorQueries().getAuthorById(authorID);
    final Author author = Author.fromJson(rawAuthorData[0]);
    return author;
  }
}
