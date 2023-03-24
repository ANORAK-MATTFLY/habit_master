import 'package:habit_master/features/routine/domain/entities/routine_entity.dart';

class Routine extends RoutineEntity {
  @override
  // ignore: overridden_fields
  final String? authorID;
  @override
  // ignore: overridden_fields
  final String? authorName;
  @override
  // ignore: overridden_fields
  final String? authorProfilePicture;
  @override
  // ignore: overridden_fields
  final String? description;
  @override
  // ignore: overridden_fields
  final String? subTitle;

  @override
  // ignore: overridden_fields
  final int? subscribers;
  @override
  // ignore: overridden_fields
  final int? successRate;

  @override
  // ignore: overridden_fields
  final String? type;

  @override
  // ignore: overridden_fields
  final int? progress;

  const Routine({
    this.authorID,
    this.authorName,
    this.authorProfilePicture,
    this.description,
    this.subscribers,
    this.subTitle,
    this.successRate,
    this.type,
    this.progress,
  });

  factory Routine.fromDocument(dynamic doc) {
    return Routine(
      authorID: doc["author_id"],
      authorName: doc["author_name"],
      authorProfilePicture: doc["author_profile_picture"],
      description: doc["description"],
      subscribers: doc["subscribers"],
      subTitle: doc["sub_title"],
      successRate: doc["success_rate"],
      progress: doc["progress"],
      type: doc["type"],
    );
  }

  static Routine fromJson(Map<String, Object?> json) => Routine(
        authorID: json['author_id'] as String?,
        authorName: json['author_name'] as String?,
        authorProfilePicture: json['author_profile_picture'] as String?,
        description: json['description'] as String?,
        subscribers: json['subscribers'] as int?,
        subTitle: json['sub_title'] as String?,
        successRate: json['success_rate'] as int?,
        progress: json['progress'] as int?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        "author_id": authorID,
        "author_name": authorName,
        "author_profile_picture": authorProfilePicture,
        "description": description,
      };
}

const habitsNames = [
  "Elon musk's daily routine",
  "Bill Gate's daily routine",
  "Thomas daily routine",
  "Thomas daily routine",
  "Joey's daily routine",
  "Joey's daily routine",
];

const habitsDescription = [
  "With success rate of 20% this routine will drastically increase your productivity, but remember consistency is the key, so good look!"
];
