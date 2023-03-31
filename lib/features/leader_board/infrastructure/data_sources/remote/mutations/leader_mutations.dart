import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/leader_board/domain/interfaces/leader_mutations_interface.dart';
import 'package:habit_master/features/leader_board/infrastructure/models/leader.dart';

class LeaderMutations implements LeaderMutationsInterface {
  final leaderBoardCollection = RemoteDatabase.leaderBoardCollection;
  @override
  Future<Either<Failure, bool>> createLeaderDocument(Leader leader) async {
    try {
      await leaderBoardCollection.doc(leader.id!).set(
        {
          "room_id": leader.leaderRoomID,
          "id": leader.id,
          "leader_name": leader.leaderName,
          "profile_picture": leader.profilePicture,
          "score": leader.score,
        },
      );
      return const Right(true);
    } on FirebaseException catch (error) {
      return Left(Failure(
        errorMessage: error.message,
        errorSource: "createLeaderDocument",
        errorType: "remote database error",
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> updateLeaderScore(int score) async {
    try {
      final leaderID =
          serviceLocator<IdentityApi>().getAuthenticatedUser()!.uid;
      await leaderBoardCollection.doc(leaderID).update({
        "score": score,
      });
      return const Right(true);
    } on FirebaseException catch (error) {
      return Left(Failure(
        errorMessage: error.message,
        errorSource: "updateLeaderScore",
        errorType: "Remote database error",
      ));
    }
  }
}
