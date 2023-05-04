class Score {
  final String? userID;
  final String? scoredOn;
  final int? score;

  Score({this.userID, this.scoredOn, this.score});

  static Score fromJson(Map<String, Object?> json) => Score(
        userID: json['user_id'] as String?,
        scoredOn: json['scored_on'] as String?,
        score: json['score'] as int?,
      );
}
