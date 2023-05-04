class HabitHistory {
  final String? id;
  final String? habitID;
  final String? doneOn;
  HabitHistory({this.id, this.habitID, this.doneOn});
  static HabitHistory fromJson(Map<String, Object?> json) => HabitHistory(
        id: json['id'] as String?,
        habitID: json['habit_id'] as String?,
        doneOn: json['done_on'] as String?,
      );
}
