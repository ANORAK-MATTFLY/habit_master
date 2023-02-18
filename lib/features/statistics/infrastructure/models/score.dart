class Score {
  final String? routineID;
  final String? habitID;
  final int? scoreValue;
  final String? scoredOn;
  Score({this.routineID, this.habitID, this.scoreValue, this.scoredOn});
  static Score fromJson(Map<String, Object?> json) => Score(
        routineID: json['routine_id'] as String?,
        habitID: json['habit_id'] as String?,
        scoreValue: json['score_value'] as int?,
        scoredOn: json['scored_on'] as String,
      );
}
