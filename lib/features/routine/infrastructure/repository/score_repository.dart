import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/score_mutations.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/score_queries.dart';

class ScoreRepository {
  ScoreRepository({required this.scoreMutations, required this.scoreQueries});
  final ScoreMutations scoreMutations;
  final ScoreQueries scoreQueries;
}
