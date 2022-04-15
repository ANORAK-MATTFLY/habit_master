import 'package:bloc/bloc.dart';
import 'package:habit_master/data/models/task.model.dart';
import 'package:meta/meta.dart';

part 'task.state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState(task: TaskModel()));
  Future<void> onStartTask() async {}
  Future<void> onFinishTask() async {}
}
