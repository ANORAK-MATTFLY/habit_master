import 'package:flutter/foundation.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

@immutable
class HabitState {
  final Habit habitState;

  const HabitState({required this.habitState});
}
