import 'package:habit_master/features/routine/infrastructure/data_sources/remote_data_source/queries/habit_remote_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

import '../data_sources/remote_data_source/mutations/habit_remote_mutations.dart';

class HabitRemoteRepository {
  HabitRemoteRepository(
      {required this.habitRemoteQueries, required this.habitRemoteMutations});
  HabitRemoteQueries habitRemoteQueries;
  HabitRemoteMutations habitRemoteMutations;

  Stream<List<Habit>> getRemoteHabits(String routineID) async* {
    final rawHabitsData = await habitRemoteQueries.getRemoteHabits(routineID);
    final List<Habit> habits = [];
    for (var index = 0; index < rawHabitsData.docs.length; index++) {
      final rawHabitData = rawHabitsData.docs[index];
      final Habit habit = Habit.fromDocument(rawHabitData);
      habits.add(habit);
    }
    yield habits;
  }
}
