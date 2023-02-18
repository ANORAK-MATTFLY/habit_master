import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_repository.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/create_habit.dart';

import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_state/habit_state.dart';

class CreateHabitBlocLogic extends Bloc<HabitBlocInterface, HabitState?> {
  CreateHabitBlocLogic() : super(null) {
    on<CreateHabitAction>((event, emit) async {
      final habit = event.habit;
      final habitMutation = serviceLocator<HabitRepository>();
      final habitHasBeenCreated = await habitMutation.createHabit(habit);

      if (habitHasBeenCreated == true) {
        final resultingTask = HabitState(habitState: habit);
        emit(resultingTask);
      }
    });
  }
}
