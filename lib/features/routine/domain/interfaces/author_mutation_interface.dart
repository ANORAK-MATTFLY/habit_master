import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

abstract class AuthorMutationsInterface {
  Future<Either<ErrorInfo, bool>> createAuthor(Author author);
  Future<Either<ErrorInfo, bool>> subscribeToRoutine(
      String routineId, String currentUserID);
}
