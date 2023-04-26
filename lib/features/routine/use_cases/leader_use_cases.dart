import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/leader_board/domain/logic/leader_board_logic.dart';
import 'package:habit_master/features/leader_board/use_cases/leader_use_case.dart';

class LeaderBoardUseCases {
  executeAddScore(bool canExecute, String routineID) async {
    if (canExecute == true) {
      await serviceLocator<LeaderUseCase>().executeUpdateScore(routineID);
      return true;
    } else {
      await serviceLocator<LeaderBoardLogic>().subtractLeaderScore(routineID);
      return true;
    }
  }
}
