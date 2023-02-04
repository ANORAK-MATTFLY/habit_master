import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/presentation/states/events/request_habit.dart';
import 'package:habit_master/features/routine/presentation/states/interfaces/habit_bloc_interface.dart';
import 'package:habit_master/features/routine/presentation/states/states/habit_state.dart';

class HabitBlocLogic extends Bloc<HabitBlocInterface, HabitState?> {
  HabitBlocLogic() : super(null) {
    on<RequestHabit>((event, emit) async {
      final habit = event.habit;

      final option = HabitState(habit: habit);
      emit(option);
    });
  }
}
