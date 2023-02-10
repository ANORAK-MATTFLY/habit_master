import 'package:flutter/foundation.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/routine.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/shared/static/tasks.dart';

import '../../../../dep_injection.dart';
import '../../infrastructure/repository/author_repository.dart';

class PrebuiltData {
  final authorQueries = serviceLocator<AuthorRepository>();
  final authorMutations = serviceLocator<AuthorRepository>();
  Future createPrebuiltData() async {
    try {
      for (var index = 0; index < predefinedAuthors.length; index++) {
        final author = predefinedAuthors[index];

        final authorExist = await authorQueries.checkIfAuthorExist(author.id!);

        if (authorExist == false) {
          await authorMutations.createAuthor(author);
          await RoutinesMutations().createRoutine(author, 0);
          final habits = generateTasks(author.id!);
          await HabitMutations().createHabits(habits);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
