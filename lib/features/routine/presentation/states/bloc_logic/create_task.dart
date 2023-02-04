import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/habits/infrastructure/data_sources/local_data_source/author_db.dart';
import 'package:habit_master/features/routine/presentation/states/events/create_task.dart';

import 'package:habit_master/features/routine/presentation/states/interfaces/task.dart';
import 'package:habit_master/features/routine/presentation/states/states/task_state.dart';

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
