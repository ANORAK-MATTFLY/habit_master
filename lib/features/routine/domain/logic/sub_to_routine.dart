import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';

Future<bool> subscribeToRoutine(
    String routineID, String currentUserID, String authorSubscribedTo) async {
  final routineMutation = serviceLocator<AuthorRepository>();
  if ((routineID != authorSubscribedTo) && (currentUserID != routineID)) {
    await routineMutation.subscribeToRoutine(routineID, currentUserID);
    return true;
  }
  return false;
}
