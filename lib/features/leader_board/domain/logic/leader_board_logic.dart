import 'package:habit_master/features/leader_board/infrastructure/models/leader.dart';
import 'package:habit_master/features/leader_board/infrastructure/repository/leader_repository.dart';
import 'package:habit_master/features/leader_board/use_cases/leader_use_case.dart';
import '../../../../dep_injection.dart';

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
