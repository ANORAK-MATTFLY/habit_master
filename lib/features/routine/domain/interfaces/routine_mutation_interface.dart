import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

abstract class RoutinesMutationsInterface {
  Future<Either<ErrorInfo, bool>> createRoutine(Author author, int successRate);
}
