import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/features/user_feed/infrastrcture/model/post_model.dart';
import 'package:habit_master/features/auth/infrastructure/model/user_aggregate.dart';

class PostMutations {
  final postsReference = FirebaseFirestore.instance.collection("posts");
  Future<bool> createPost(Post post, UserAggregate currentUser) async {
    try {
      await postsReference.doc(post.id).set({
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
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> deletePost(String postID) async {
    try {
      await postsReference.doc(postID).delete();
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> like(Post post, String userID) async {
    bool isLiked = post.likes!.contains(userID);

    if (isLiked == false) {
      await _likePost(userID, post.id!);
      return true;
    }

    if (isLiked == true) {
      await _disLikePost(userID, post.id!);
      return true;
    }
    return false;
  }

  Future<bool> _likePost(String userID, String postID) async {
    try {
      await postsReference.doc(postID).update(
        {
          "likes": FieldValue.arrayUnion([userID]),
        },
      );
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> _disLikePost(String userID, String postID) async {
    try {
      await postsReference.doc(postID).update(
        {
          "likes": FieldValue.arrayRemove([userID]),
        },
      );
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> updateComment(
      String postID, String postOwnerID, String currentUserID) async {
    try {
      await postsReference.doc(postID).update(
        {
          "comments": FieldValue.increment(1),
        },
      );
      return true;
    } catch (error) {
      rethrow;
    }
  }

  List<Post> getSerializedPosts(
      List<QueryDocumentSnapshot<Object?>> rawPostData) {
    List<Post> posts = [];
    for (var post in rawPostData) {
      final serializedPost = Post.fromDocument(post);
      posts.add(serializedPost);
    }

    return posts;
  }

  List<Post> serializeComments(
      List<QueryDocumentSnapshot<Object?>> rawPostData) {
    List<Post> posts = [];
    for (var post in rawPostData) {
      final serializedPost = Post.fromDocument(post);
      posts.add(serializedPost);
    }

    return posts;
  }
}
