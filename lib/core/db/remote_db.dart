import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteDatabase {
  static CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  static CollectionReference postsCollection =
      FirebaseFirestore.instance.collection("posts");
  static CollectionReference leaderBoardCollection =
      FirebaseFirestore.instance.collection("leader_board");
}
