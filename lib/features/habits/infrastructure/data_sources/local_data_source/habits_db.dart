import 'package:habit_master/features/habits/infrastructure/data_sources/local_data_source/db_constants.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/author_model.dart';
import '../../models/habit_model.dart';
import 'author_db.dart';

class HabitsDatabaseProvider {
  static Future createDatabase(Database database, int version) async {
    const createHabitTable = LocalDatabaseConstantProvider.createHabitTable;
    await database.execute(createHabitTable);
  }

  Future createHabit() async {
    final database = await AuthorDatabase.instance.database;

    for (var index = 0; index < predefinedAuthors.length; index++) {
      Author author = predefinedAuthors[index];
      final Habit habit = Habit(
        authorID: author.id,
        authorName: author.authorName,
        authorProfilePicture: author.authorProfilePicture,
        description: habitsDescription[0],
        followers: 0,
        isPremium: 1,
        name: habitsNames[index],
      );
      await database
          .rawInsert(LocalDatabaseConstantProvider.createHabit(habit));
    }
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
