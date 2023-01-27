class Habit {
  final String? authorID;
  final String? authorName;
  final String? authorProfilePicture;
  final String? name;
  final String? description;
  final int? followers;
  final int? isPremium;

  const Habit({
    this.authorID,
    this.authorName,
    this.authorProfilePicture,
    this.name,
    this.description,
    this.followers,
    this.isPremium,
  });

  static Habit fromJson(Map<String, Object?> json) => Habit(
        authorID: json['author_id'] as String?,
        authorName: json['authorName'] as String?,
        authorProfilePicture: json['authorProfilePicture'] as String?,
        description: json['description'] as String?,
        followers: json['followers'] as int?,
        name: json['name'] as String?,
        isPremium: json['isPremium'] as int?,
      );

  Map<String, dynamic> toJson() => {
        "author_id": authorID,
        "author_name": authorName,
        "author_profile_picture": authorProfilePicture,
        "name": name,
        "description": description,
        "isPremium": isPremium
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
