import '../../models/author_model.dart';
import '../../models/habit_model.dart';

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
      FOREIGN KEY(author_id) REFERENCES author(id),
      FOREIGN KEY(author_profile_picture) REFERENCES author(author_profile_picture)
  )
    ''';

  static const createAuthorTable = '''CREATE TABLE author(
      id VARCHAR(255) NOT NULL PRIMARY KEY,
      author_name VARCHAR(20),
      author_profile_picture VARCHAR(255)
    )''';

  static String createAuthor(Author author) {
    const attributes =
        'INSERT INTO author(id, author_name, author_profile_picture)';
    final values =
        ' VALUES("${author.id}", "${author.authorName}", "${author.authorProfilePicture}")';
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
