import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

class HabitTimerCubit extends Cubit<Habit?> {
  HabitTimerCubit() : super(null);

  void updateState(Habit habit) => emit(habit);
}
