import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/routine_repository.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_state/author_state.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/author_interface.dart';

import '../bloc_event/create_author.dart';

class CreateAuthorBlocLogic extends Bloc<AuthorBlocInterface, AuthorState?> {
  CreateAuthorBlocLogic() : super(null) {
    on<CreateAuthorAction>((event, emit) async {
      final author = event.author;
      final authorMutation = serviceLocator<AuthorRepository>();
      final authorHasBeenCreated =
          await authorMutation.authorMutations.createAuthor(author);
      if (authorHasBeenCreated.isRight()) {
        final routineMutations = serviceLocator<RoutineRepository>();

        final routine =
            await routineMutations.routineQueries.getRoutineByID(author.id!);
        if (!routine.isEmpty) {
          final database = await LocalDatabase.instance.database;
          await database.rawUpdate(
              "UPDATE routine SET type = 'local' WHERE author_id = '${author.id!}'");
        } else {
          await routineMutations.createRoutine(author, 0, "local");
        }

        final resultingData =
            AuthorState(authorState: authorHasBeenCreated.isRight());

        emit(resultingData);
      }
    });
  }
}
