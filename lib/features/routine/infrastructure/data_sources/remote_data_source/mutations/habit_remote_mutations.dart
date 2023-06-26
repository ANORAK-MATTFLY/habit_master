import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

class HabitRemoteMutations {
  final _communityHabitsCollection =
      RemoteDatabase.habitsFromCommunityCollection;

  Future<bool> uploadPersonalHabit(Habit habit) async {
    try {
      await _communityHabitsCollection.doc(habit.id).set({
        "id": habit.id,
        "routine_id": habit.routineID,
        "habit_name": habit.habitName,
        "done_on": habit.doneOn,
        "duration": habit.duration,
        "expiration_date": habit.expirationDate,
        "type": habit.type,
        "is_done": habit.isDone,
        "habit_type": "remote",
        "scheduled_for": habit.scheduledFor,
      });
      return true;
    } catch (error) {
      rethrow;
    }
  }
}
