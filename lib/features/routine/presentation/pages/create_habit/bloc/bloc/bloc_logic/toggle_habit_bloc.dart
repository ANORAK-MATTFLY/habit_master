import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit.dart';

import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/toggle_task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_state/habit_state.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class TaskBlocLogic extends Bloc<TaskBlocInterface, HabitState?> {
  TaskBlocLogic() : super(null) {
    on<ToggleTaskAction>((event, emit) async {
      final task = event.task;
      await HabitMutations().toggleHabit(task, !task.isDone!);

      final resultingTask = HabitState(habitState: task);
      emit(resultingTask);
    });
  }
}
