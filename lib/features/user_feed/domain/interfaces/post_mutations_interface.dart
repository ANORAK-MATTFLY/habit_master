import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/auth/infrastructure/model/user_aggregate.dart';
import 'package:habit_master/features/user_feed/infrastrcture/model/post_model.dart';

abstract class PostMutationsInterface {
  Future<Either<Failure, bool>> createPost(
      Post post, UserAggregate currentUser);
  Future<Either<Failure, bool>> deletePost(String postID);
  Future<Either<Failure, bool>> like(String postID, String userID);
  // ignore: unused_element
  Future<Either<Failure, bool>> _likePost(String userID, String postID);
  // ignore: unused_element
  Future<Either<Failure, bool>> _disLikePost(String userID, String postID);
  Future<Either<Failure, bool>> updateComment(
      String postID, String postOwnerID, String currentUserID);
}
