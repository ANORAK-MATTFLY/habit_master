import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/score_model.dart';
import 'package:habit_master/shared/models/permission_model.dart';

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
      type VARCHAR(25) NOT NULL,
      progress INT NOT NULL,
      PRIMARY KEY(author_id),
      FOREIGN KEY(author_id) REFERENCES author(id),
      FOREIGN KEY(author_profile_picture) REFERENCES author(author_profile_picture)
  )
    ''';

  static const createAuthorTable = '''CREATE TABLE author(
      id VARCHAR(255) NOT NULL PRIMARY KEY,
      author_name VARCHAR(20),
      author_profile_picture VARCHAR(255),
      type VARCHAR(15),
      subscribed_to VARCHAR(255)
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
      done_on VARCHAR(20),
      PRIMARY KEY(id),
      FOREIGN KEY(routine_id) REFERENCES habit(author_id)
    )''';

  static const createHabitHistoryTable = '''CREATE TABLE habit_history(
      id VARCHAR(255) NOT NULL,
      habit_id VARCHAR(255) NOT NULL,
      done_on VARCHAR(20),
      PRIMARY KEY(id),
      FOREIGN KEY(habit_id) REFERENCES habit(habit_id)
    )''';

  static const createPermissionTable = '''CREATE TABLE permission(
      id VARCHAR(255) NOT NULL,
      is_free_plan INT NOT NULL,
      expiration_date VARCHAR(20),
      PRIMARY KEY(id)
    )''';

  static const createScoreTable = '''CREATE TABLE score(
    user_id VARCHAR(255) NOT NULL,
    score INT NOT NULL,
    scored_on VARCHAR(15) NOT NULL
  )''';

  static getHabitHistory(String habitID) {
    return "SELECT * FROM habit_history WHERE habit_id = '$habitID'";
  }

  static getScore(String userID, String scoredOn) {
    return "SELECT * FROM score WHERE user_id = '$userID' AND scored_on = '$scoredOn'";
  }

  static String getCurrentUserFromCache(String userID) {
    return "SELECT * FROM author WHERE id = '$userID'";
  }

  static getTodaysHabitHistory(String habitID, String doneOn) {
    return "SELECT * FROM habit_history WHERE habit_id = '$habitID' AND done_on = '$doneOn'";
  }

  static getAuthorById(String authorID) {
    return "SELECT * FROM author WHERE author_id = '$authorID'";
  }

  static getHabitById(String habitID) {
    return "SELECT * FROM habit WHERE id = '$habitID' LIMIT 1";
  }

  static getHabits(String routineID) {
    return "SELECT * FROM habit WHERE routine_id = '$routineID'";
  }

  static deleteHabitHistory(String habitID) {
    final todayDate = Timestamp.now().toDate().toString().split(" ")[0];
    return "DELETE FROM habit_history WHERE done_on = '$todayDate' AND habit_id = '$habitID'";
  }

  static String createHabitHistory(HabitHistory habitHistory) {
    const attributes = 'INSERT INTO habit_history(id, habit_id, done_on)';
    final values =
        " VALUES('${habitHistory.id}', '${habitHistory.habitID}', '${habitHistory.doneOn}' )";
    return attributes + values;
  }

  static String createAuthor(Author author) {
    const attributes =
        'INSERT INTO author(id, author_name, author_profile_picture, type, subscribed_to)';
    final values =
        " VALUES('${author.id}', '${author.authorName}', '${author.authorProfilePicture}', '${author.type}', '${author.subscribedTo}' )";
    return attributes + values;
  }

  static String createScore(Score score) {
    const attributes = 'INSERT INTO score(user_id, score, scored_on)';
    final values =
        " VALUES('${score.userID}', ${score.score}, '${score.scoredOn}')";
    return attributes + values;
  }

  static String createHabit(Habit habit) {
    const attributes =
        'INSERT INTO habit(id, routine_id, habit_name, type, scheduled_for, duration, expiration_date, is_done, done_on)';
    final values =
        " VALUES('${habit.id}', '${habit.routineID}', '${habit.habitName}', '${habit.type}', '${habit.scheduledFor}', '${habit.duration}', '${habit.expirationDate}', ${habit.isDone}, '${habit.doneOn}')";
    return attributes + values;
  }

  static String createRoutine(Routine routine) {
    const attributes =
        'INSERT INTO routine(author_id, author_name, author_profile_picture, description, subscribers, sub_title, success_rate, progress, type)';
    final values =
        " VALUES('${routine.authorID!}', '${routine.authorName!}', '${routine.authorProfilePicture}', '${routine.description}', ${routine.subscribers}, '${routine.subTitle}', ${routine.successRate}, ${routine.progress}, '${routine.type}')";
    return attributes + values;
  }

  static String createPermission(Permission permission) {
    const attributes =
        "INSERT INTO permission(id, is_free_plan, expiration_date)";
    final values =
        "VALUES('${permission.id}', '${permission.isFreePlan}', '${permission.expirationDate}')";
    return attributes + values;
  }

  static updateHabitDoneAttribute(bool isDone, String habitID) {
    return "UPDATE habit SET is_done = $isDone WHERE id = '$habitID'";
  }

  static updateScore(String userID, int score, String scoreOn) {
    return "UPDATE score SET score = $score WHERE user_id = '$userID' AND scored_on = '$scoreOn'";
  }

  static updateExpirationDate(String expirationDate, String habitID) {
    return "UPDATE habit SET expiration_date = '$expirationDate' WHERE id = '$habitID'";
  }

  static updateHabitHistory(String habitID, String doneOn) {
    return "UPDATE habit_history SET done_on = '$doneOn' WHERE habit_id = '$habitID'";
  }
}
