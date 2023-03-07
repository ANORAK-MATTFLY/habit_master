import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/leader_board/infrastructure/models/leader.dart';

abstract class LeaderMutationsInterface {
  Future<Either<Failure, bool>> createLeaderDocument(Leader leader);
  Future<Either<Failure, bool>> updateLeaderScore(int score);
}
