import '../../../models/author_model.dart';
import '../../../models/habit_model.dart';

class LocalDatabaseConstantProvider {
  static const getHabits = "SELECT * FROM habits";

  static const createHabitTable = '''
    CREATE TABLE habit(
      author_id INT,
      author_name VARCHAR(20),
      author_profile_picture VARCHAR(255),
      name VARCHAR(80),
      description VARCHAR(255),
      isPremium BOOLEAN,
      PRIMARY KEY(author_id),
      FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE
  )
    ''';

  static const createAuthorTable = '''CREATE TABLE author(
      id VARCHAR(255) NOT NULL PRIMARY KEY,
      authorName VARCHAR(20),
      authorProfilePicture VARCHAR(255),
      isPredefined BOOLEAN NOT NULL DEFAULT FALSE,
      isPremium BOOLEAN NOT NULL DEFAULT FALSE
    )''';

  static String createAuthor(Author author) {
    const attributes =
        'INSERT INTO author(id, authorName, authorProfilePicture, isPredefined, isPremium)';
    final values =
        ' VALUES("${author.id}", "${author.authorName}", "${author.authorProfilePicture}", ${author.isPredefined}, ${author.isPremium})';
    return attributes + values;
  }

  static String createHabit(Habit habit) {
    const attributes =
        'INSERT INTO habit(author_id, author_name, author_profile_picture, description, isPremium, name)';
    final values =
        ' VALUES("${habit.authorID}", "${habit.authorName}", "${habit.authorProfilePicture}", "${habit.description}", "${habit.isPremium}"," ${habit.name}")';
    return attributes + values;
  }
}
