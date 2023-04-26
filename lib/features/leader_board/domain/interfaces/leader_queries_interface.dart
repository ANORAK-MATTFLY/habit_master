import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LeaderQueriesInterface {
  Stream<QuerySnapshot<Object?>> getLeaders();
  Future<DocumentSnapshot<Object?>> getCurrentLeader();
}
