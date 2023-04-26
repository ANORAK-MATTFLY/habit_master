import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/features/routine/domain/logic/get_days_of_the_week.dart';

class LeaderRoomMutations {
  final leaderBoardCollection = RemoteDatabase.leaderRoomCollection;

  Future<bool> createLeaderRoom() async {
    try {
      final leaderRoomID = DateTimeManipulation.getDaysOfTheWeek();
      await leaderBoardCollection.doc("$leaderRoomID").set({
        "id": "$leaderRoomID",
      });
      return true;
    } catch (error) {
      rethrow;
    }
  }
}
