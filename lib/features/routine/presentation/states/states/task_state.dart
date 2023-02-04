import 'package:flutter/foundation.dart';
import 'package:habit_master/features/habits/infrastructure/models/task_model.dart';

@immutable
class TaskState {
  final Task taskState;

  const TaskState({required this.taskState});
}
