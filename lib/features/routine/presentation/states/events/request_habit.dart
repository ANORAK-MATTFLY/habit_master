import 'package:flutter/foundation.dart';
import 'package:habit_master/features/habits/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/presentation/states/interfaces/habit_bloc_interface.dart';

@immutable
class RequestHabit implements HabitBlocInterface {
  final Habit habit;

  const RequestHabit({required this.habit}) : super();
}
