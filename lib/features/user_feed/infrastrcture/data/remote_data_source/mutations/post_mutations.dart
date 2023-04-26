import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/user_feed/domain/interfaces/post_mutations_interface.dart';
import 'package:habit_master/features/user_feed/infrastrcture/model/post_model.dart';
import 'package:habit_master/features/auth/infrastructure/model/user_aggregate.dart';

class PostMutations implements PostMutationsInterface {
  final _postsReference = RemoteDatabase.postsCollection;
  @override
  Future<Either<Failure, bool>> createPost(
      Post post, UserAggregate currentUser) async {
    try {
      await _postsReference.doc(post.id).set({
        "id": post.id,
        "owner_id": currentUser.userID,
        "owner_token_id": currentUser.userDeviceToken,
        "post_parent_id": post.postParentID,
        "type": post.type,
        "owner_name": currentUser.displayName,
        "owner_profile_picture": currentUser.photoUrl,
        "likes": post.likes,
        "comments": post.comments,
        "created_at": Timestamp.now(),
        "text_content": post.textContent,
      });
      return const Right(true);
    } on FirebaseException catch (error) {
      return Left(Failure(
        errorMessage: error.message,
        errorSource: "createPost",
        errorType: "remote database error",
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> deletePost(String postID) async {
    try {
      await _postsReference.doc(postID).delete();
      return const Right(true);
    } on FirebaseException catch (error) {
      return Left(Failure(
        errorMessage: error.message,
        errorSource: "delete post",
        errorType: "remote database error",
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> like(String postID, String userID) async {
    try {
      final rawPost = await _postsReference.doc(postID).get();
      final Post post = Post.fromDocument(rawPost);
      bool isLiked = post.likes!.contains(userID);

      if (isLiked == false) {
        await _likePost(userID, post.id!);
        return const Right(true);
      }

      if (isLiked == true) {
        await _disLikePost(userID, post.id!);
        return const Right(false);
      }
      return const Right(false);
    } on FirebaseException catch (error) {
      return Left(Failure(
        errorMessage: error.message,
        errorSource: "like post",
        errorType: "remote database error",
      ));
    }
  }

  Future<Either<Failure, bool>> _likePost(String userID, String postID) async {
    try {
      await _postsReference.doc(postID).update(
        {
          "likes": FieldValue.arrayUnion([userID]),
        },
      );
      return const Right(true);
    } on FirebaseException catch (error) {
      return Left(Failure(
        errorMessage: error.message,
        errorSource: "_like post",
        errorType: "remote database error",
      ));
    }
  }

  Future<Either<Failure, bool>> _disLikePost(
      String userID, String postID) async {
    try {
      await _postsReference.doc(postID).update(
        {
          "likes": FieldValue.arrayRemove([userID]),
        },
      );
      return const Right(true);
    } on FirebaseException catch (error) {
      return Left(Failure(
        errorMessage: error.message,
        errorSource: "_dislike post",
        errorType: "remote database error",
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> updateComment(
      String postID, String postOwnerID, String currentUserID) async {
    try {
      await _postsReference.doc(postID).update(
        {
          "comments": FieldValue.increment(1),
        },
      );
      return const Right(true);
    } on FirebaseException catch (error) {
      return Left(Failure(
        errorMessage: error.message,
        errorSource: "update comment",
        errorType: "remote database error",
      ));
    }
  }
}
