import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/leader_board/domain/logic/leader_board_logic.dart';
import 'package:habit_master/features/leader_board/infrastructure/repository/leader_repository.dart';

class LeaderUseCase {
  final LeaderRepository leaderRepository = serviceLocator<LeaderRepository>();

  executeSubtractLeaderScore(String routineID) {
    LeaderBoardLogic().subtractLeaderScore(routineID);
  }

  executeUpdateScore(String routineID) async {
    final leader = await serviceLocator<LeaderRepository>().getCurrentLeader();

    await LeaderBoardLogic().updateLeaderScore(routineID, leader);
  }
}
