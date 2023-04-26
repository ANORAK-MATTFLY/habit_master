import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/core/db/remote_db.dart';

class HabitRemoteQueries {
  final _habitsFromCommunityCollection =
      RemoteDatabase.habitsFromCommunityCollection;
  Future checkIfHabitExist(String habitID) async {
    final rawHabitData =
        await _habitsFromCommunityCollection.doc(habitID).get();
    return rawHabitData.exists;
  }

  Future<QuerySnapshot<Object?>> getRemoteHabits(String routineID) async {
    return await _habitsFromCommunityCollection
        .where("routine_id", isEqualTo: routineID)
        .get();
  }
}
