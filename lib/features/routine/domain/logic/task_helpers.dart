import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';

class TaskHelpers {
  static List<Habit> getMorningTasks(List<Habit> tasks) {
    final List<Habit> morningTasks = [];
    for (var index = 0; index < tasks.length; index++) {
      final task = tasks[index];
      if (task.scheduledFor! == "morning") {
        morningTasks.add(task);
      }
    }
    return morningTasks;
  }

  static List<Habit> getAfternoonTasks(List<Habit> tasks) {
    final List<Habit> afternoonTasks = [];
    for (var index = 0; index < tasks.length; index++) {
      final task = tasks[index];
      if (task.scheduledFor! == "afternoon") {
        afternoonTasks.add(task);
      }
    }

    return afternoonTasks;
  }

  static List<Habit> getEveningTasks(List<Habit> tasks) {
    final List<Habit> eveningTasks = [];
    for (var index = 0; index < tasks.length; index++) {
      final task = tasks[index];
      if (task.scheduledFor! == "evening") {
        eveningTasks.add(task);
      }
    }
    return eveningTasks;
  }
}
