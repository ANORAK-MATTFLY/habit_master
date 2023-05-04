import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/auth/infrastructure/model/user_aggregate.dart';
import 'package:habit_master/features/user_feed/infrastrcture/model/post_model.dart';
import 'package:habit_master/features/user_feed/infrastrcture/repository/post_repository.dart';
import 'package:uuid/uuid.dart';

class PostLogic {
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

  Future<void> createPost(String content, postType) async {
    final userInfo = serviceLocator<IdentityApi>().getAuthenticatedUser();
    final UserAggregate? user =
        await serviceLocator<IdentityApi>().getUserById(userInfo!.uid);
    final Post post = generatePostInstance(user!, content, postType);
    await serviceLocator<PostRepository>().postMutations.createPost(post, user);
  }

  Post generatePostInstance(UserAggregate user, String content, postType) {
    const id = Uuid();
    final Post post = Post(
      comments: 0,
      createdAt: Timestamp.now(),
      id: id.v1(),
      likes: const [],
      ownerID: user.userID,
      ownerName: user.displayName,
      ownerProfilePicture: user.photoUrl,
      ownerTokenID: "",
      postParentID: "",
      textContent: content,
      type: postType,
    );
    return post;
  }
}
