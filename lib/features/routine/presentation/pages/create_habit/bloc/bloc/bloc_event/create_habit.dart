import 'package:flutter/foundation.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/task.dart';

@immutable
class CreateHabitAction implements HabitBlocInterface {
  final Habit habit;

  const CreateHabitAction({required this.habit}) : super();
}
