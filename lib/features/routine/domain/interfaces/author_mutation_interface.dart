import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

abstract class AuthorMutationsInterface {
  Future<Either<Failure, bool>> createAuthor(Author author);
  Future<bool> subscribeToRoutine(String routineId);
}
