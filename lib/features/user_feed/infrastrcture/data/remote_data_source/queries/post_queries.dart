import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/features/user_feed/domain/interfaces/post_queries_interface.dart';

class PostQueries implements PostQueriesInterface {
  final _postsCollections = RemoteDatabase.postsCollection;
  @override
  Stream<QuerySnapshot<Object?>> getPosts() async* {
    final posts = await _postsCollections.get();
    yield posts;
  }

  @override
  Stream<QuerySnapshot<Object?>> getComments(String postID) async* {
    final result = _postsCollections
        .where("post_parent_id", isEqualTo: postID)
        .snapshots();
    yield* result;
  }
}
