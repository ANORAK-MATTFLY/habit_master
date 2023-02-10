import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/application/routine_facade.dart';

class RoutineEntryPoint {
  final RoutineFacadeService routineFacadeService =
      serviceLocator<RoutineFacadeService>();
}
