import 'package:flutter/foundation.dart';
import 'package:habit_master/features/habits/infrastructure/models/task_model.dart';
import 'package:habit_master/features/routine/presentation/states/interfaces/task.dart';

@immutable
class CreateTaskAction implements TaskBlocInterface {
  final Task task;

  const CreateTaskAction({required this.task}) : super();
}
