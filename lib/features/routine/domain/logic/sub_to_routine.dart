import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';

Future<bool> subscribeToRoutine(String routineID) async {
  final authorRepo = serviceLocator<AuthorRepository>();
  final currentUserID =
      serviceLocator<IdentityApi>().getAuthenticatedUser().uid;

  final Author author = await authorRepo.getAuthorById(currentUserID);
  if (author is String) {
    return false;
  }
  final routineMutation = serviceLocator<AuthorRepository>();
  if ((routineID != author.subscribedTo) && (currentUserID != routineID)) {
    await routineMutation.subscribeToRoutine(routineID, currentUserID);
    return true;
  }
  return false;
}
