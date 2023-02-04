import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/author_db.dart';

import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/toggle_task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_state/task_state.dart';
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
