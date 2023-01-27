import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Author {
  final String? id;
  final String? authorName;
  final String? authorProfilePicture;
  final int? isPredefined;
  final int? isPremium;

  Author({
    this.id,
    this.authorName,
    this.authorProfilePicture,
    this.isPredefined,
    this.isPremium,
  });

  static Author fromJson(Map<String, Object?> json) => Author(
        id: json['id'] as String?,
        authorName: json['authorName'] as String?,
        authorProfilePicture: json['authorProfilePicture'] as String?,
        isPredefined: json['isPredefined'] as int?,
        isPremium: json['isPremium'] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "authorName": authorName,
        "authorProfilePicture": authorProfilePicture
      };
}

List<Author> predefinedAuthors = [
  Author(
      id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}",
      authorName: "Elon Musk",
      authorProfilePicture: "assets/images/elon-musk.png",
      isPredefined: 1,
      isPremium: 1),
  Author(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}",
    authorName: "Bill Gate",
    authorProfilePicture: "assets/images/bill-gate.png",
    isPredefined: 1,
    isPremium: 1,
  ),
  Author(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}",
    authorName: "Thomas Franks",
    authorProfilePicture: "assets/images/thomas_frank.png",
    isPredefined: 1,
    isPremium: 0,
  ),
  Author(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}",
    authorName: "Joey Schweitzer",
    authorProfilePicture: "assets/images/joey_schweitzer.png",
    isPredefined: 1,
    isPremium: 0,
  ),
  Author(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}",
    authorName: "Thomas Franks",
    authorProfilePicture: "assets/images/thomas_frank.png",
    isPredefined: 1,
    isPremium: 0,
  ),
  Author(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}",
    authorName: "Joey Schweitzer",
    authorProfilePicture: "assets/images/joey_schweitzer.png",
    isPredefined: 1,
    isPremium: 0,
  ),
];
