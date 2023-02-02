class Task {
  final String? taskID;
  final String? id;
  final String? taskName;
  final String? type;
  final DateTime? scheduledFor;
  final String? duration;

  const Task({
    this.taskID,
    this.id,
    this.taskName,
    this.type,
    this.scheduledFor,
    this.duration,
  });

  static Task fromJson(Map<String, Object?> json) => Task(
        taskID: json['habit_id'] as String?,
        id: json['id'] as String?,
        taskName: json['task_name'] as String?,
        type: json['type'] as String?,
        scheduledFor: json['scheduledFor'] as DateTime?,
        duration: json['duration'] as String?,
      );
}
