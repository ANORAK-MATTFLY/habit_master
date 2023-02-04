import 'package:habit_master/features/habits/infrastructure/models/task_model.dart';
import 'package:habit_master/shared/static/dates.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
List<String> taskName = [
  "Drink a glace of water",
  "Meditate for 30 min",
  "Go out for run",
  "Start working",
  "Meeting customers",
  "Read a book",
  "Meeting with the staff",
  "Take a 45 min break",
  "Journal",
  "Read a book",
  "Workout",
  "plane the next day",
];
List<Task> generateTasks(String habitID) {
  List<Task> tasks = [];

  for (var i = 0; i < taskName.length; i++) {
    final task = Task(
      id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-$i",
      duration: "30min",
      scheduledFor: i < 4
          ? "morning"
          : (i >= 4) && (i < 8)
              ? "afternoon"
              : "evening",
      habitID: habitID,
      taskName: taskName[i],
      type: "check",
      isDone: false,
      expirationDate: expirationDate,
    );
    tasks.add(task);
  }
  return tasks;
}
