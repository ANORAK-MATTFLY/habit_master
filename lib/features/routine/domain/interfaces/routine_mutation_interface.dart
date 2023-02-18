import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

abstract class RoutinesMutationsInterface {
  Future<bool> createRoutine(Author author, int successRate);
}
