import 'package:flutter/foundation.dart';
import 'package:habit_master/features/habits/infrastructure/models/habit_model.dart';

@immutable
class HabitState {
  final Habit habit;

  const HabitState({required this.habit});
}
