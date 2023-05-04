import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

class HabitListCubit extends Cubit<List<Habit>> {
  HabitListCubit() : super([]);

  void updateState(List<Habit> newState) => emit(newState);
}
