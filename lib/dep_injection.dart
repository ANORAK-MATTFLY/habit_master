import 'package:get_it/get_it.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/routine/domain/logic/weekly_progress.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_history_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/routine_repository.dart';

import 'features/auth/infrastructure/repository/user_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  serviceLocator.registerLazySingleton(
    () => AuthorRepository(),
  );
  serviceLocator.registerLazySingleton(
    () => RoutineRepository(),
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
}
