import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:sqflite/sqflite.dart';

class HabitMutations {
  Future<bool> createHabit(Habit task) async {
    try {
      final database = await LocalDatabase.instance.database;
      final createTaskQuery = LocalDatabaseConstantProvider.createTask(task);
      await database.rawInsert(createTaskQuery);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> toggleHabit(Habit habit, bool isDone) async {
    try {
      final database = await LocalDatabase.instance.database;
      final updateHabit =
          LocalDatabaseConstantProvider.updateHabitDoneAttribute(
              isDone, habit.id!);

      await database.rawQuery(updateHabit);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> updateHabitExpirationDate(
      String habitID, String expirationDate) async {
    try {
      final Database database = await LocalDatabase.instance.database;
      final String query = LocalDatabaseConstantProvider.updateExpirationDate(
          expirationDate, habitID);
      await database.rawQuery(query);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> createHabits(List<Habit> habits) async {
    try {
      final database = await LocalDatabase.instance.database;
      for (int index = 0; index < habits.length; index++) {
        final Habit task = habits[index];
        final insertAuthor = LocalDatabaseConstantProvider.createTask(task);
        await database.rawInsert(insertAuthor);
      }
      return true;
    } catch (error) {
      return false;
    }
  }
}
