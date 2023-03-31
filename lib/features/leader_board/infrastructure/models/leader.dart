class Leader {
  final String? leaderRoomID;
  final String? id;
  final String? leaderName;
  final String? profilePicture;
  final int? score;
  Leader(
      {this.id,
      this.leaderName,
      this.leaderRoomID,
      this.profilePicture,
      this.score});
  factory Leader.fromDocument(dynamic doc) {
    return Leader(
      leaderRoomID: doc["room_id"],
      id: doc["id"],
      leaderName: doc["leader_name"],
      profilePicture: doc["profile_picture"],
      score: doc["score"],
    );
  }
}
