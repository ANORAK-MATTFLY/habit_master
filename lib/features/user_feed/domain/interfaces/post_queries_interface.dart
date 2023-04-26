import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PostQueriesInterface {
  Stream<QuerySnapshot<Object?>> getPosts();
  Stream<QuerySnapshot<Object?>> getComments(String postID);
}
