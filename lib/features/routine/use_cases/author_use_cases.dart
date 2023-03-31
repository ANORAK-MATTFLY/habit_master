import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/author_mutations.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/routine.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/author_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/shared/static/habits.dart';

class AuthorUseCases {
  AuthorUseCases({required this.authorMutations, required this.authorQueries});
  final AuthorMutations authorMutations;
  final AuthorQueries authorQueries;
  Future<Either<Failure, bool>> executeCheckIfAuthorExist(
      String authorID) async {
    final result = await authorQueries.checkIfAuthorExist(authorID);
    return Right(result);
  }

  Future<Either<Option<Failure>, Option<bool>>> executeCreateAuthor(
      Author author) async {
    final caseOne = await executeCheckIfAuthorExist(author.id!);
    if (caseOne.isLeft()) {
      return Left(caseOne.getLeft());
    }
    final canExecute =
        caseOne.getRight().map((result) => result).getOrElse(() => false);

    if (canExecute == false) {
      return Right(Option.of(false));
    }
    final result = await authorMutations.createAuthor(author);
    if (result.isLeft()) {
      return Left(result.getLeft());
    }
    await RoutinesMutations().createRoutine(author, 0, "remote");
    final habits = generateTasks(author.id!);
    await HabitMutations().createHabits(habits);
    return Right(result.getRight());
  }

  executeRoutineSubscription(String routineID) async {
    await authorMutations.subscribeToRoutine(routineID);
  }
}
