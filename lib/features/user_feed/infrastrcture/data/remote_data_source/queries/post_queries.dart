import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/core/db/remote_db.dart';

class PostQueries {
  final postsCollections = RemoteDatabase.postsCollection;
  Stream<QuerySnapshot<Object?>> getPosts() async* {
    final posts = await postsCollections.get();
    yield posts;
  }

  getComments(String postID) {
    return postsCollections
        .where("post_parent_id", isEqualTo: postID)
        .snapshots();
  }
}
