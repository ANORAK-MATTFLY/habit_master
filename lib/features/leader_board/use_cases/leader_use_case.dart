import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/leader_board/domain/logic/leader_board_logic.dart';
import 'package:habit_master/features/leader_board/infrastructure/data_sources/remote/queries/leader_room_queries.dart';
import 'package:habit_master/features/leader_board/infrastructure/repository/leader_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../infrastructure/data_sources/remote/mutations/leader_room_mutation.dart';

class LeaderUseCase {
  final LeaderRepository leaderRepository = serviceLocator<LeaderRepository>();

  executeSubtractLeaderScore(String routineID) {
    LeaderBoardLogic().subtractLeaderScore(routineID);
  }

  executeUpdateScore(String routineID) async {
    final internetChecker = await InternetConnectionChecker().connectionStatus;

    if (internetChecker == InternetConnectionStatus.connected) {
      final leaderRoomExist =
          await LeaderRoomQueries().checkIfLeaderRoomExist();
      if (leaderRoomExist == false) {
        await LeaderRoomMutations().createLeaderRoom();
        final user = serviceLocator<IdentityApi>().getAuthenticatedUser()!;
        await RemoteDatabase.leaderBoardCollection.doc(user.uid).update({
          "score": 10,
        });
        return true;
      }
    }

    final leader = await serviceLocator<LeaderRepository>().getCurrentLeader();

    await LeaderBoardLogic().updateLeaderScore(routineID, leader);
  }
}
