import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';

class RoutineUseCase {
  executeRoutineSubscription(String routineId) async {
    final result = await serviceLocator<AuthorRepository>()
        .authorMutations
        .subscribeToRoutine(routineId);
    return result;
  }
}
