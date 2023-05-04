import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/features/leader_board/infrastructure/models/leader.dart';

abstract class LeaderRepositoryRepositoryInterface {
  Future<Leader> getCurrentLeader();
  List<Leader> getLeaders(QuerySnapshot<Object?> rawLeadersData);
}
