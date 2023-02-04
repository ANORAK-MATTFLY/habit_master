import 'package:habit_master/features/habits/infrastructure/models/task_model.dart';

import '../../models/author_model.dart';
import '../../models/habit_model.dart';

class LocalDatabaseConstantProvider {
  // static const getHabits = "SELECT * FROM habits";
  static const createHabitTable = '''
    CREATE TABLE habit(
      author_id INT NOT NULL,
      author_name VARCHAR(20),
      author_profile_picture VARCHAR(255) NOT NULL,
      description VARCHAR(255) NOT NULL,
      subscribers INT NOT NULL,
      sub_title VARCHAR(255) NOT NULL,
      success_rate INT NOT NULL,
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
      id VARCHAR(255) NOT NULL,
      habit_id VARCHAR(255) NOT NULL,
      task_name VARCHAR(20) NOT NULL,
      type VARCHAR(255) NOT NULL,
      scheduled_for VARCHAR(20) NOT NULL,
      duration VARCHAR(20),
      is_done BOOLEAN NOT NULL,
      expiration_date VARCHAR(50),
      PRIMARY KEY(id),
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
        'INSERT INTO task(id, habit_id, task_name, type, scheduled_for, duration, expiration_date, is_done)';
    final values =
        " VALUES('${task.id}', '${task.habitID}', '${task.taskName}', '${task.type}', '${task.scheduledFor}', '${task.duration}', '${task.expirationDate}', ${task.isDone})";
    return attributes + values;
  }

  static String createHabit(Habit habit) {
    const attributes =
        'INSERT INTO habit(author_id, author_name, author_profile_picture, description, subscribers, sub_title, success_rate)';
    final values =
        " VALUES('${habit.authorID!}', '${habit.authorName!}', '${habit.authorProfilePicture}', '${habit.description}', ${habit.subscribers}, '${habit.subTitle}', ${habit.successRate})";
    return attributes + values;
  }
}
