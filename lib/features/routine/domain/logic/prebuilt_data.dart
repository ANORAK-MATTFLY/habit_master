import 'package:habit_master/features/routine/domain/logic/remote_routines_sync.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/routine.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

import '../../../../dep_injection.dart';
import '../../infrastructure/repository/author_repository.dart';

class PrebuiltData {
  final authorQueries = serviceLocator<AuthorRepository>();
  final authorMutations = serviceLocator<AuthorRepository>();
  Future<bool> createPrebuiltData() async {
    try {
      for (var index = 0; index < predefinedAuthors.length; index++) {
        final author = predefinedAuthors[index];

        final authorExist = await authorQueries.checkIfAuthorExist(author.id!);

        if (authorExist == false) {
          await authorMutations.authorMutations.createAuthor(author);
          await RoutinesMutations().createRoutine(author, 0, "local");

          await HabitMutations().createHabits(billGate);

          await HabitMutations().createHabits(jamesClear);
          await HabitMutations().createHabits(cuban);
          await HabitMutations().createHabits(jack);
          await HabitMutations().createHabits(lewis);
          await HabitMutations().createHabits(oprah);
          await HabitMutations().createHabits(timCook);
          await HabitMutations().createHabits(satya);
          await HabitMutations().createHabits(elon);
        }
      }

      RemoteRoutinesSynchronization().syncRemoteRoutines();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
