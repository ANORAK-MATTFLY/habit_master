import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_repository.dart';

import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/toggle_habit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/habit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_state/habit_state.dart';

class HabitBlocLogic extends Bloc<HabitBlocInterface, HabitState?> {
  HabitBlocLogic() : super(null) {
    on<ToggleHabitAction>((event, emit) async {
      final habit = event.habit;
      final habitMutation = serviceLocator<HabitRepository>();
      final bool isDone = !habit.isDone!;
      final isToggled = await habitMutation.toggleHabit(habit, isDone);

      await habitMutation.updateHabitDoneDate(habit, isDone);

      if (isToggled.isRight()) {
        final resultingHabit = HabitState(habitState: habit);

        await serviceLocator<AuthorRepository>()
            .authorMutations
            .subscribeToRoutine(habit.routineID!);
        emit(resultingHabit);
      }
    });
  }
}
