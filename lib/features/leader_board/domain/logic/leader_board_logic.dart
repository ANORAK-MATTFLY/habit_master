import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/features/leader_board/infrastructure/models/leader.dart';
import 'package:habit_master/features/leader_board/infrastructure/repository/leader_repository.dart';
import 'package:habit_master/features/leader_board/use_cases/leader_use_case.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../dep_injection.dart';
import '../../../auth/api/identity_api.dart';
import '../../infrastructure/data_sources/remote/mutations/leader_room_mutation.dart';
import '../../infrastructure/data_sources/remote/queries/leader_room_queries.dart';

class LeaderBoardLogic {
  final leaderRepository = serviceLocator<LeaderUseCase>();
  Future<bool> updateLeaderScore(String routineID, Leader leader) async {
    try {
      final int score = (leader.score! + 10);

      await serviceLocator<LeaderRepository>()
          .leaderMutations
          .updateLeaderScore(score);
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> subtractLeaderScore(String routineID) async {
    try {
      final internetChecker =
          await InternetConnectionChecker().connectionStatus;
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

      final leader =
          await serviceLocator<LeaderRepository>().getCurrentLeader();
      final int score = (leader.score! - 10);

      await serviceLocator<LeaderRepository>()
          .leaderMutations
          .updateLeaderScore(score);

      return true;
    } catch (error) {
      rethrow;
    }
  }
}
