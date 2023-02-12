import 'package:flutter/foundation.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/task.dart';

@immutable
class ToggleHabitAction implements TaskBlocInterface {
  final Habit habit;

  const ToggleHabitAction({required this.habit}) : super();
}
