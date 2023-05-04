import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/leader_board/domain/interfaces/leader_queries_interface.dart';
import 'package:habit_master/features/routine/domain/logic/get_days_of_the_week.dart';

class LeaderQueries implements LeaderQueriesInterface {
  final leadersCollection = RemoteDatabase.leaderBoardCollection;
  @override
  Future<DocumentSnapshot<Object?>> getCurrentLeader() async {
    final leaderID = serviceLocator<IdentityApi>().getAuthenticatedUser()!.uid;
    final leaderDocument = await leadersCollection.doc(leaderID).get();
    return leaderDocument;
  }

  @override
  Stream<QuerySnapshot<Object?>> getLeaders() async* {
    final leaderRoomID = DateTimeManipulation.getDaysOfTheWeek();
    final leaderDocument = await leadersCollection
        .where("room_id", isEqualTo: "$leaderRoomID")
        .orderBy("score", descending: true)
        .get();
    yield leaderDocument;
  }
}
