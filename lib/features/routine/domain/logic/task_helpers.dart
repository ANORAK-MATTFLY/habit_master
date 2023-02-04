import 'package:habit_master/features/routine/infrastructure/models/task_model.dart';

class TaskHelpers {
  static List<Task> getMorningTasks(List<Task> tasks) {
    final List<Task> morningTasks = [];
    for (var index = 0; index < tasks.length; index++) {
      final task = tasks[index];
      if (task.scheduledFor! == "morning") {
        morningTasks.add(task);
      }
    }
    return morningTasks;
  }

  static List<Task> getAfternoonTasks(List<Task> tasks) {
    final List<Task> afternoonTasks = [];
    for (var index = 0; index < tasks.length; index++) {
      final task = tasks[index];
      if (task.scheduledFor! == "afternoon") {
        afternoonTasks.add(task);
      }
    }

    return afternoonTasks;
  }

  static List<Task> getEveningTasks(List<Task> tasks) {
    final List<Task> eveningTasks = [];
    for (var index = 0; index < tasks.length; index++) {
      final task = tasks[index];
      if (task.scheduledFor! == "evening") {
        eveningTasks.add(task);
      }
    }
    return eveningTasks;
  }
}
