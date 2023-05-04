import 'package:habit_master/features/routine/domain/entities/author.dart';

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
        type: json['type'] as String?,
        subscribedTo: json["subscribed_to"] as String?,
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
    subscribedTo: "",
  ),
  const Author(
    id: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    authorName: "Bill Gate",
    authorProfilePicture: "assets/images/bill-gate.png",
    type: "prebuilt",
    subscribedTo: "",
  ),
  const Author(
    id: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    authorName: "Lewis Hamilton",
    authorProfilePicture: "assets/images/masters/lewis3.png",
    type: "prebuilt",
    subscribedTo: "",
  ),
  const Author(
    id: "clear james clear james clear james clear james clear james clear",
    authorName: "James Clear",
    authorProfilePicture: "assets/images/masters/clear.png",
    type: "prebuilt",
    subscribedTo: "",
  ),
  const Author(
    id: "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    authorName: "Mark Cuban",
    authorProfilePicture: "assets/images/masters/cuban.png",
    type: "prebuilt",
    subscribedTo: "",
  ),
  const Author(
    id: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    authorName: "Oprah Winfrey",
    authorProfilePicture: "assets/images/masters/oprah.png",
    type: "prebuilt",
    subscribedTo: "",
  ),
  const Author(
    id: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    authorName: "Tim Cook",
    authorProfilePicture: "assets/images/masters/cook.png",
    type: "prebuilt",
    subscribedTo: "",
  ),
  const Author(
    id: "Satya Nadella Satya Nadella Satya Nadella Satya Nadella Satya Nadella",
    authorName: "Satya Nadella",
    authorProfilePicture: "assets/images/masters/satya.png",
    type: "prebuilt",
    subscribedTo: "",
  ),
  const Author(
    id: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    authorName: "Satya Nadella",
    authorProfilePicture: "assets/images/masters/jack.png",
    type: "prebuilt",
    subscribedTo: "",
  ),
];
