import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String? id;
  final String? ownerID;
  final String? ownerTokenID;
  final String? postParentID;
  final String? ownerName;
  final String? ownerProfilePicture;
  final String? textContent;
  final String? type;
  final List? likes;
  final int? comments;
  final Timestamp? createdAt;
  const PostEntity({
    this.id,
    this.ownerID,
    this.ownerTokenID,
    this.postParentID,
    this.ownerName,
    this.ownerProfilePicture,
    this.textContent,
    this.comments,
    this.likes,
    this.type,
    this.createdAt,
  });

  @override
  List<Object> get props {
    return [
      id!,
      ownerID!,
      ownerTokenID!,
      postParentID!,
      ownerName!,
      ownerProfilePicture!,
      textContent!,
      comments!,
      likes!,
      type!,
      createdAt!,
    ];
  }
}
