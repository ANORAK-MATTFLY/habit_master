import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/author_mutations.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/author_queries.dart';

class AuthorUseCases {
  AuthorUseCases({required this.authorMutations, required this.authorQueries});
  final AuthorMutations authorMutations;
  final AuthorQueries authorQueries;
  Future<Either<Failure, bool>> executeCheckIfAuthorExist(
      String authorID) async {
    final result = await authorQueries.checkIfAuthorExist(authorID);
    return Right(result);
  }

  executeRoutineSubscription(String routineID) async {
    await authorMutations.subscribeToRoutine(routineID);
  }
}
