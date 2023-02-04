import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/habits/infrastructure/models/habit_model.dart';

class HabitCubit extends Cubit<Habit?> {
  HabitCubit() : super(null);

  void updateState(Habit habit) => emit(habit);
}
