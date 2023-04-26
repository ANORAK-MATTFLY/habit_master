import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/features/routine/domain/logic/get_days_of_the_week.dart';

class LeaderRoomQueries {
  final leaderRoomCollection = RemoteDatabase.leaderRoomCollection;
  Future<bool> checkIfLeaderRoomExist() async {
    final leaderRoomID = DateTimeManipulation.getDaysOfTheWeek();

    final leaderRoom = await leaderRoomCollection.doc("$leaderRoomID").get();
    return leaderRoom.exists;
  }
}
