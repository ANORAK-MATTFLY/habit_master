import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

import '../../features/routine/infrastructure/models/author_model.dart';
import '../../features/routine/infrastructure/models/routine_model.dart';

class LocalDatabaseConstantProvider {
  static const createRoutineTable = '''
    CREATE TABLE routine(
      author_id INT NOT NULL,
      author_name VARCHAR(20),
      author_profile_picture VARCHAR(255) NOT NULL,
      description VARCHAR(255) NOT NULL,
      subscribers INT NOT NULL,
      sub_title VARCHAR(255) NOT NULL,
      success_rate INT NOT NULL,
      is_premium INT NOT NULL, 
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
  static const createHabitTable = '''CREATE TABLE habit(
      id VARCHAR(255) NOT NULL,
      routine_id VARCHAR(255) NOT NULL,
      habit_name VARCHAR(20) NOT NULL,
      type VARCHAR(255) NOT NULL,
      scheduled_for VARCHAR(20) NOT NULL,
      duration VARCHAR(20),
      is_done BOOLEAN NOT NULL,
      expiration_date VARCHAR(50),
      PRIMARY KEY(id),
      FOREIGN KEY(routine_id) REFERENCES habit(author_id)
    )''';

  static getAuthorById(String authorID) {
    return "SELECT * FROM author WHERE author_id = '$authorID'";
  }

  static getHabits(String routineID) {
    return "SELECT * FROM habit WHERE routine_id = '$routineID'";
  }

  static String createAuthor(Author author) {
    const attributes =
        'INSERT INTO author(id, author_name, author_profile_picture, type)';
    final values =
        " VALUES('${author.id}', '${author.authorName}', '${author.authorProfilePicture}', '${author.type}')";
    return attributes + values;
  }

  static String createTask(Habit habit) {
    const attributes =
        'INSERT INTO habit(id, routine_id, habit_name, type, scheduled_for, duration, expiration_date, is_done)';
    final values =
        " VALUES('${habit.id}', '${habit.routineID}', '${habit.habitName}', '${habit.type}', '${habit.scheduledFor}', '${habit.duration}', '${habit.expirationDate}', ${habit.isDone})";
    return attributes + values;
  }

  static String createRoutine(Routine routine) {
    const attributes =
        'INSERT INTO routine(author_id, author_name, author_profile_picture, description, is_premium, subscribers, sub_title, success_rate)';
    final values =
        " VALUES('${routine.authorID!}', '${routine.authorName!}', '${routine.authorProfilePicture}', '${routine.description}', ${routine.isPremium}, ${routine.subscribers}, '${routine.subTitle}', ${routine.successRate})";
    return attributes + values;
  }

  static updateHabitDoneAttribute(bool isDone, String habitID) {
    return "UPDATE habit SET is_done = $isDone WHERE id = '$habitID'";
  }

  static updateExpirationDate(String expirationDate, String habitID) {
    return "UPDATE habit SET expiration_date = '$expirationDate' WHERE id = '$habitID'";
  }
}
