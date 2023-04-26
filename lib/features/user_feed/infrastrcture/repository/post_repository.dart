import 'package:habit_master/features/user_feed/infrastrcture/data/remote_data_source/mutations/post_mutations.dart';
import 'package:habit_master/features/user_feed/infrastrcture/data/remote_data_source/queries/post_queries.dart';

class PostRepository {
  final PostMutations postMutations;
  final PostQueries postQueries;

  PostRepository({
    required this.postMutations,
    required this.postQueries,
  });
}
