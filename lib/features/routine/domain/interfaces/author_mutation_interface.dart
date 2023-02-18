import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';

abstract class AuthorMutationsInterface {
  Future<bool> createAuthor(Author author);
  Future<bool> subscribeToRoutine(String routineId, String currentUserID);
}
