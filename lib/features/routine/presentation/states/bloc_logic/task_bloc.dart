import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/habits/infrastructure/data_sources/local_data_source/author_db.dart';

import 'package:habit_master/features/routine/presentation/states/events/toggle_task.dart';
import 'package:habit_master/features/routine/presentation/states/interfaces/task.dart';
import 'package:habit_master/features/routine/presentation/states/states/task_state.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class TaskBlocLogic extends Bloc<TaskBlocInterface, TaskState?> {
  TaskBlocLogic() : super(null) {
    on<ToggleTaskAction>((event, emit) async {
      final task = event.task;
      await AuthorDatabase.toggleTask(task, !task.isDone!);

      final resultingTask = TaskState(taskState: task);
      emit(resultingTask);
    });
  }
}
