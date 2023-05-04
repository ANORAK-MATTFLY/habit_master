import 'package:get_it/get_it.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/leader_board/domain/logic/leader_board_logic.dart';
import 'package:habit_master/features/leader_board/infrastructure/data_sources/remote/mutations/leader_mutations.dart';
import 'package:habit_master/features/leader_board/infrastructure/data_sources/remote/queries/leader_queries.dart';
import 'package:habit_master/features/leader_board/infrastructure/repository/leader_repository.dart';
import 'package:habit_master/features/leader_board/use_cases/leader_use_case.dart';
import 'package:habit_master/features/routine/application/routine_facade.dart';
import 'package:habit_master/features/routine/domain/logic/weekly_progress.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/author_queries.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/routine_queries.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/score_queries.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/remote_data_source/mutations/habit_remote_mutations.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/remote_data_source/mutations/routine_remote_mutation.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/remote_data_source/queries/habit_remote_queries.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/remote_data_source/queries/remote_routine_queries.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_history_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_remote_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/routine_remote_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/routine_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/score_repository.dart';
import 'package:habit_master/features/routine/use_cases/author_use_cases.dart';
import 'package:habit_master/features/routine/use_cases/habit_history_use_cases.dart';
import 'package:habit_master/features/routine/use_cases/leader_use_cases.dart';
import 'package:habit_master/features/routine/use_cases/routine_use_cases.dart';
import 'package:habit_master/features/user_feed/domain/logic/post_logic.dart';
import 'package:habit_master/features/user_feed/infrastrcture/data/remote_data_source/mutations/post_mutations.dart';
import 'package:habit_master/features/user_feed/infrastrcture/data/remote_data_source/queries/post_queries.dart';
import 'package:habit_master/features/user_feed/infrastrcture/repository/post_repository.dart';

import 'features/auth/infrastructure/repository/user_repository.dart';
import 'features/routine/infrastructure/data_sources/local_data_source/mutation/author_mutations.dart';
import 'features/routine/infrastructure/data_sources/local_data_source/mutation/score_mutations.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  serviceLocator.registerLazySingleton(
    () => RoutineFacadeService(
      authorRepository: AuthorRepository(
        authorMutations: AuthorMutations(),
      ),
      habitRepository: HabitRepository(),
      routineRepository: RoutineRepository(routineQueries: RoutineQueries()),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => ScoreRepository(
        scoreMutations: ScoreMutations(), scoreQueries: ScoreQueries()),
  );
  serviceLocator.registerLazySingleton(
    () => AuthorRepository(authorMutations: AuthorMutations()),
  );
  serviceLocator.registerLazySingleton(
    () => RoutineRepository(routineQueries: RoutineQueries()),
  );
  serviceLocator.registerLazySingleton(
    () => HabitRepository(),
  );
  serviceLocator.registerLazySingleton(
    () => UserRepository(),
  );
  serviceLocator.registerLazySingleton(
    () => IdentityApi(),
  );

  serviceLocator.registerLazySingleton(
    () => StatsLogic(),
  );
  serviceLocator.registerLazySingleton(
    () => HabitHistoryRepository(),
  );
  serviceLocator.registerLazySingleton(
    () => PostMutations(),
  );
  serviceLocator.registerLazySingleton(
    () => LeaderRepository(leaderMutations: LeaderMutations()),
  );
  serviceLocator.registerLazySingleton(
    () => LeaderBoardLogic(),
  );
  serviceLocator.registerLazySingleton(
    () => LeaderQueries(),
  );
  serviceLocator.registerLazySingleton(
    () => AuthorUseCases(
      authorMutations: AuthorMutations(),
      authorQueries: AuthorQueries(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => PostRepository(
      postMutations: PostMutations(),
      postQueries: PostQueries(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => HabitHistoryUseCase(),
  );
  serviceLocator.registerLazySingleton(
    () => LeaderBoardUseCases(),
  );
  serviceLocator.registerLazySingleton(
    () => PostLogic(),
  );
  serviceLocator.registerLazySingleton(
    () => RoutineUseCase(),
  );
  serviceLocator.registerLazySingleton(
    () => LeaderUseCase(),
  );
  serviceLocator.registerLazySingleton(
    () => RoutineRemoteRepository(
      routineRemoteMutations: RoutineRemoteMutations(),
      remoteRoutineQueries: RemoteRoutineQueries(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => HabitRemoteRepository(
      habitRemoteQueries: HabitRemoteQueries(),
      habitRemoteMutations: HabitRemoteMutations(),
    ),
  );
}
