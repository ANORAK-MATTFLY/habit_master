import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

abstract class RoutineRemoteMutationsInterface {
  Future<bool> sharePersonalRoutine(Routine routine);
  
}
