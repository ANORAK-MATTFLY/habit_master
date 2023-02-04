import 'package:habit_master/features/habits/infrastructure/data_sources/local_data_source/db_constants.dart';
import 'package:habit_master/shared/static/tasks.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/author_model.dart';
import '../../models/habit_model.dart';
import 'author_db.dart';

class HabitsDatabaseProvider {
  static Future createDatabaseTable(Database database, int version) async {
    const createHabitTable = LocalDatabaseConstantProvider.createHabitTable;
    await database.execute(createHabitTable);
  }

  static Future createHabit(
    Author author,
    int successRate,
  ) async {
    final database = await AuthorDatabase.instance.database;

    final Habit habit = Habit(
      authorID: author.id!,
      authorName: author.authorName!,
      authorProfilePicture: author.authorProfilePicture!,
      description: "",
      subscribers: 0,
      isPremium: 1,
      subTitle: "",
      successRate: successRate,
    );
    final tasks = generateTasks(habit.authorID!);
    await AuthorDatabase.createTasks(tasks);
    final mutation = LocalDatabaseConstantProvider.createHabit(habit);
    await database.rawInsert(mutation);
  }

  static Future<List<Habit>> getHabits() async {
    final database = await AuthorDatabase.instance.database;
    final maps = await database.query("habit");
    final List<Habit> habits = [];
    if (maps.isNotEmpty) {
      List.generate(maps.length, (i) {
        final habit = maps[i];
        final Habit serializedHabit = Habit.fromJson(habit);
        habits.add(serializedHabit);
      });
    }
    return habits;
  }
}
