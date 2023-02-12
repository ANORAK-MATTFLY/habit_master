import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';

Future<bool> subscribeToRoutine(
    String routineID, String authorSubscribedTo) async {
  final routineMutation = serviceLocator<AuthorRepository>();
  if (routineID != authorSubscribedTo) {
    await routineMutation.subscribeToRoutine(routineID);
    return true;
  }
  return false;
}
