import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';
import 'package:habit_master/shared/static/tasks.dart';

class RoutinesMutations {
  Future<bool> createRoutine(Author author, int successRate) async {
    try {
      final database = await LocalDatabase.instance.database;

      final Routine habit = Routine(
        authorID: author.id!,
        authorName: author.authorName!,
        authorProfilePicture: author.authorProfilePicture!,
        description: "",
        subscribers: 0,
        isPremium: 1,
        subTitle: "",
        successRate: successRate,
      );
      final habits = generateTasks(habit.authorID!);
      await HabitMutations().createHabits(habits);
      final mutation = LocalDatabaseConstantProvider.createRoutine(habit);
      await database.rawInsert(mutation);
      return true;
    } catch (error) {
      return false;
    }
  }
}
