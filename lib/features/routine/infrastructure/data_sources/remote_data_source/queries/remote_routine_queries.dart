import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/core/db/remote_db.dart';

class RemoteRoutineQueries {
  final _communityRoutinesCollection =
      RemoteDatabase.routinesFromCommunityCollection;

  Future<QuerySnapshot<Object?>> getRoutines() async {
    final rawRoutinesData = await _communityRoutinesCollection.get();
    return rawRoutinesData;
  }
}
