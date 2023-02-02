import 'package:habit_master/features/habits/infrastructure/models/task_model.dart';

import '../../models/author_model.dart';
import '../../models/habit_model.dart';

class LocalDatabaseConstantProvider {
  // static const getHabits = "SELECT * FROM habits";
  static const createHabitTable = '''
    CREATE TABLE habit(
      author_id INT,
      author_name VARCHAR(20),
      author_profile_picture VARCHAR(255),
      habit_name VARCHAR(80),
      description VARCHAR(255),
      PRIMARY KEY(author_id),
      FOREIGN KEY(author_id) REFERENCES author(id),
      FOREIGN KEY(author_profile_picture) REFERENCES author(author_profile_picture)
  )
    ''';

  static const createAuthorTable = '''CREATE TABLE author(
      id VARCHAR(255) NOT NULL PRIMARY KEY,
      author_name VARCHAR(20),
      author_profile_picture VARCHAR(255),
      type VARCHAR(15)
    )''';
  static const createTaskTable = '''CREATE TABLE task(
      habit_id VARCHAR(20),
      id VARCHAR(255) NOT NULL PRIMARY KEY,
      task_name VARCHAR(20) NOT NULL,
      type VARCHAR(255) NOT NULL,
      scheduled_for DATE NOT NULL,
      duration VARCHAR(20),
      FOREIGN KEY(habit_id) REFERENCES habit(author_id)
    )''';

  static String createAuthor(Author author) {
    const attributes =
        'INSERT INTO author(id, author_name, author_profile_picture, type)';
    final values =
        " VALUES('${author.id}', '${author.authorName}', '${author.authorProfilePicture}', '${author.type}')";
    return attributes + values;
  }

  static String createTask(Task task) {
    const attributes =
        'INSERT INTO task(habit_id, id, task_name, type, scheduled_for, duration)';
    final values =
        " VALUES('${task.taskID}', '${task.id}', '${task.taskName}', '${task.type}', ${task.scheduledFor}, '${task.duration}')";
    return attributes + values;
  }

  static String createHabit(Habit habit) {
    const attributes =
        'INSERT INTO habit(author_id, author_name, author_profile_picture, description, habit_name)';
    final values =
        " VALUES('${habit.authorID}'', '${habit.authorName}', '${habit.authorProfilePicture}', '${habit.description}', '${habit.isPremium}', '${habit.name}')";
    return attributes + values;
  }
}
