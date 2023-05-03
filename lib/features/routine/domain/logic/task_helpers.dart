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

  List<List<int>> getRatio(List<Habit> habits) {
    final List<Habit> morningHabits = [];
    final List<Habit> afternoonHabits = [];
    final List<Habit> eveningHabits = [];
    for (var index = 0; index < getMorningTasks(habits).length; index++) {
      final habit = getMorningTasks(habits)[index];
      if (habit.isDone == true) {
        morningHabits.add(habit);
      }
    }
    for (var index = 0; index < getAfternoonTasks(habits).length; index++) {
      final habit = getAfternoonTasks(habits)[index];
      if (habit.isDone == true) {
        afternoonHabits.add(habit);
      }
    }
    for (var index = 0; index < getEveningTasks(habits).length; index++) {
      final habit = getEveningTasks(habits)[index];
      if (habit.isDone == true) {
        eveningHabits.add(habit);
      }
    }
    return [
      [morningHabits.length, getMorningTasks(habits).length],
      [afternoonHabits.length, getAfternoonTasks(habits).length],
      [eveningHabits.length, getEveningTasks(habits).length],
    ];
  }
}
