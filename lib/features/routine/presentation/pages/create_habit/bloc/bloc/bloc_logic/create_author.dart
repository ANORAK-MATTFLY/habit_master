import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';
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
      final authorHasBeenCreated = await authorMutation.createAuthor(author);
      if (authorHasBeenCreated == true) {
        final routine = await createRoutine(author);
        final resultingData = AuthorState(authorState: routine);
        emit(resultingData);
      }
    });
  }
  Future<Routine> createRoutine(Author author) async {
    final routineMutations = serviceLocator<RoutineRepository>();

    final routine = await routineMutations.createRoutine(author, 0);
    return routine;
  }
}
