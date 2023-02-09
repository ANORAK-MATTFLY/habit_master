import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_repository.dart';

import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/toggle_task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_state/habit_state.dart';

class TaskBlocLogic extends Bloc<TaskBlocInterface, HabitState?> {
  TaskBlocLogic() : super(null) {
    on<ToggleTaskAction>((event, emit) async {
      final habit = event.task;
      final habitMutation = serviceLocator<HabitRepository>();
      final isToggled = await habitMutation.toggleHabit(habit, !habit.isDone!);

      if (isToggled == true) {
        final resultingHabit = HabitState(habitState: habit);
        emit(resultingHabit);
      }
    });
  }
}
