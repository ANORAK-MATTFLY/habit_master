import 'package:habit_master/features/routine/domain/entities/author.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Author extends AuthorEntity {
  @override
  // ignore: overridden_fields
  final String? id;
  @override
  // ignore: overridden_fields
  final String? authorName;
  @override
  // ignore: overridden_fields
  final String? authorProfilePicture;
  @override
  // ignore: overridden_fields
  final String? type;

  const Author({this.id, this.authorName, this.authorProfilePicture, this.type})
      : super(
          id: id,
          authorName: authorName,
          authorProfilePicture: authorProfilePicture,
          type: type,
        );

  static Author fromJson(Map<String, Object?> json) => Author(
        id: json['id'] as String?,
        authorName: json['author_name'] as String?,
        authorProfilePicture: json['author_profile_picture'] as String?,
        type: json['type'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author_name": authorName,
        "author_profile_picture": authorProfilePicture,
        "type": type
      };
}

List<Author> predefinedAuthors = [
  Author(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}",
    authorName: "Elon Musk",
    authorProfilePicture: "assets/images/elon-musk.png",
    type: "prebuilt",
  ),
  Author(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}",
    authorName: "Bill Gate",
    authorProfilePicture: "assets/images/bill-gate.png",
    type: "prebuilt",
  ),
  Author(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}",
    authorName: "Thomas Franks",
    authorProfilePicture: "assets/images/thomas_frank.png",
    type: "prebuilt",
  ),
  Author(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}",
    authorName: "Joey Schweitzer",
    authorProfilePicture: "assets/images/joey_schweitzer.png",
    type: "prebuilt",
  ),
];
