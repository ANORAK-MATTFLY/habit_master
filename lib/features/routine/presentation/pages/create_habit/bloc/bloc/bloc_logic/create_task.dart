import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/author_db.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/create_task.dart';

import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_state/task_state.dart';

class CreateTaskBlocLogic extends Bloc<TaskBlocInterface, TaskState?> {
  CreateTaskBlocLogic() : super(null) {
    on<CreateTaskAction>((event, emit) async {
      final task = event.task;
      await AuthorDatabase.createTask(task);

      final resultingTask = TaskState(taskState: task);
      emit(resultingTask);
    });
  }
}
