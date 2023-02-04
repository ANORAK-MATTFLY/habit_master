import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/infrastructure/models/task_model.dart';

class TaskListCubit extends Cubit<List<Task>> {
  TaskListCubit() : super([]);

  void updateState(List<Task> newState) => emit(newState);
}
