import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

class RoutinesMutations {
  Future<Routine> createRoutine(Author author, int successRate) async {
    try {
      final database = await LocalDatabase.instance.database;

      final Routine routine = Routine(
        authorID: author.id!,
        authorName: author.authorName!,
        authorProfilePicture: author.authorProfilePicture!,
        description: "",
        subscribers: 0,
        isPremium: 1,
        subTitle: "",
        successRate: successRate,
      );

      final command = LocalDatabaseConstantProvider.createRoutine(routine);
      await database.rawInsert(command);
      return routine;
    } catch (error) {
      rethrow;
    }
  }
}
