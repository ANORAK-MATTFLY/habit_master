import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/create_habit.dart';

import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_state/habit_state.dart';

class CreateHabitBlocLogic extends Bloc<TaskBlocInterface, HabitState?> {
  CreateHabitBlocLogic() : super(null) {
    on<CreateHabitAction>((event, emit) async {
      final task = event.task;
      await HabitMutations().createHabit(task);

      final resultingTask = HabitState(habitState: task);
      emit(resultingTask);
    });
  }
}
