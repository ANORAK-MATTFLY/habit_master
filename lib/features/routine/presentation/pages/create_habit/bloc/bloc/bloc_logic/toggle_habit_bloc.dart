import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_repository.dart';

import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/toggle_habit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_state/habit_state.dart';

import '../../../../../../domain/logic/sub_to_routine.dart';
import '../../../../../../infrastructure/models/author_model.dart';

class HabitBlocLogic extends Bloc<TaskBlocInterface, HabitState?> {
  HabitBlocLogic() : super(null) {
    on<ToggleHabitAction>((event, emit) async {
      final habit = event.habit;
      final habitMutation = serviceLocator<HabitRepository>();
      final isToggled = await habitMutation.toggleHabit(habit, !habit.isDone!);

      if (isToggled == true) {
        final resultingHabit = HabitState(habitState: habit);
        await subOperation(habit.routineID!);
        emit(resultingHabit);
      }
    });
  }

  Future subOperation(String routineID) async {
    final authorRepo = serviceLocator<AuthorRepository>();
    final currentUserID =
        serviceLocator<IdentityApi>().getAuthenticatedUser().uid;

    final Author author = await authorRepo.getAuthorById(currentUserID);
    if (author is String) {
      return;
    }
    await subscribeToRoutine(routineID, currentUserID, author.subscribedTo!);
  }
}
