import 'package:flutter/foundation.dart';
import 'package:habit_master/features/routine/infrastructure/models/task_model.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/interface/task.dart';

@immutable
class ToggleTaskAction implements TaskBlocInterface {
  final Task task;

  const ToggleTaskAction({required this.task}) : super();
}
