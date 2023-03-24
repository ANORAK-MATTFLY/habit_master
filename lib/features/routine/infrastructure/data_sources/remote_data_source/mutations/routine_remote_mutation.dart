import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/features/routine/domain/interfaces/routine_remote_mutations_interface.dart';

import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';
import 'package:uuid/uuid.dart';

class RoutineRemoteMutations implements RoutineRemoteMutationsInterface {
  final _communityRoutineCollection =
      RemoteDatabase.routinesFromCommunityCollection;
  final uuid = const Uuid();
  @override
  Future<bool> sharePersonalRoutine(Routine routine) async {
    await _communityRoutineCollection.doc(routine.authorID).set({
      "id": uuid.v1(),
      "author_id": routine.authorID,
      "author_name": routine.authorName,
      "author_profile_picture": routine.authorProfilePicture,
      "description": routine.description,
      "subscribers": routine.subscribers,
      "sub_title": routine.subTitle,
      "success_rate": routine.successRate,
      "progress": 0,
      "type": "remote",
    });
    return true;
  }
}
