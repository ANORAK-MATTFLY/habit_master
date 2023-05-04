import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:habit_master/features/leader_board/domain/interfaces/leader_repo_interface.dart';
import 'package:habit_master/features/leader_board/infrastructure/data_sources/remote/mutations/leader_mutations.dart';
import 'package:habit_master/features/leader_board/infrastructure/data_sources/remote/queries/leader_queries.dart';
import 'package:habit_master/features/leader_board/infrastructure/models/leader.dart';

class LeaderRepository implements LeaderRepositoryRepositoryInterface {
  final LeaderMutations leaderMutations;
  LeaderRepository({required this.leaderMutations});

  @override
  Future<Leader> getCurrentLeader() async {
    try {
      final rawLeaderData = await LeaderQueries().getCurrentLeader();
      final Leader leader = Leader.fromDocument(rawLeaderData);
      return leader;
    } catch (error) {
      rethrow;
    }
  }

  @override
  List<Leader> getLeaders(QuerySnapshot<Object?> rawLeadersData) {
    final List<Leader> leaders = [];
    for (var index = 0; index < rawLeadersData.docs.length; index++) {
      final rawLeaderData = rawLeadersData.docs[index];
      final Leader leader = Leader.fromDocument(rawLeaderData);
      leaders.add(leader);
    }
    return leaders;
  }
}
