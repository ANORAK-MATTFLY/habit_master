class Task {
  final String? id;
  final String? habitID;
  final String? taskName;
  final String? type;
  final String? scheduledFor;
  final String? duration;
  final String? expirationDate;
  final bool? isDone;

  const Task({
    this.id,
    this.habitID,
    this.taskName,
    this.type,
    this.scheduledFor,
    this.duration,
    this.expirationDate,
    this.isDone,
  });

  static Task fromJson(Map<String, Object?> json) => Task(
        id: json['id'] as String?,
        habitID: json['habit_id'] as String?,
        taskName: json['task_name'] as String?,
        type: json['type'] as String?,
        scheduledFor: json['scheduled_for'] as String?,
        duration: json['duration'] as String?,
        expirationDate: json['expiration_date'] as String?,
        isDone: json['is_done'] == 1 ? true : false,
      );
}
