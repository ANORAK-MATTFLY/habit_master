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

  @override
  // ignore: overridden_fields
  final String? subscribedTo;

  const Author({
    this.id,
    this.authorName,
    this.authorProfilePicture,
    this.type,
    this.subscribedTo,
  }) : super(
            id: id,
            authorName: authorName,
            authorProfilePicture: authorProfilePicture,
            type: type,
            subscribedTo: subscribedTo);

  static Author fromJson(Map<String, Object?> json) => Author(
        id: json['id'] as String?,
        authorName: json['author_name'] as String?,
        authorProfilePicture: json['author_profile_picture'] as String?,
        type: json['type'] as String,
        subscribedTo: json["subscribed_to"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author_name": authorName,
        "author_profile_picture": authorProfilePicture,
        "type": type,
        "subscribed_to": subscribedTo,
      };
}

List<Author> predefinedAuthors = [
  const Author(
    id: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    authorName: "Elon Musk",
    authorProfilePicture: "assets/images/elon-musk.png",
    type: "prebuilt",
    subscribedTo: null,
  ),
  const Author(
    id: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    authorName: "Bill Gate",
    authorProfilePicture: "assets/images/bill-gate.png",
    type: "prebuilt",
    subscribedTo: null,
  ),
  const Author(
    id: "Thomas FranksThomas FranksThomas FranksThomas FranksThomas Franks",
    authorName: "Thomas Franks",
    authorProfilePicture: "assets/images/thomas_frank.png",
    type: "prebuilt",
    subscribedTo: null,
  ),
  const Author(
    id: "JoeySchweitzerJoeySchweitzerJoeySchweitzerJoeySchweitzer",
    authorName: "Joey Schweitzer",
    authorProfilePicture: "assets/images/joey_schweitzer.png",
    type: "prebuilt",
    subscribedTo: null,
  ),
];
